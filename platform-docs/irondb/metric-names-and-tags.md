# Metric Names and Tags

## Canonical Metric Names

Canonical Metric Names in IRONdb are the combination of a [metric name](metric-names-and-tags.md#metric-names) and [tags](metric-names-and-tags.md#tags). For a general overview, canonical metric names would follow the following BNF description:

```
<canonical-metric-name> ::= <metric-name><tags-section>
<metric-name> ::= <characters>
<tag-section> ::= (<stream-tags> | <measurement-tags>)*
<stream-tags> ::= "|ST[" <tagset> "]" | ""
<measurement-tags> ::= "|MT{" <tagset> "}" | ""
<tagset> ::= <tag> "," <tagset> | <tag> | ""
<tag>  ::= <tag-category> ":" <tag-value> | <tag-category>
```

To be canonical:

* A full canonical metric name must be less than 4095 characters in length.
* `<tagsets>` must have duplicate `<tag>` items removed, and then sorted lexicographically by category, and then value.

Submissions will be canonicalized before storage.

Examples:

* `my_metric_name`
* `my_metric_name|ST[color:blue,env:prod]`
* `my_metric_name|MT{}|ST[env:prod]|MT{foo}|ST[color:blue]`

The final example would canonicalize into the previous example since measurement-tags are not currently stored.

### Metric Names

Metric names in Circonus may be an string of bytes other than a null character, or the stream-tag or measurement-tags identifiers (`|ST[` or `|MT{`).

### Stream Tags

Stream tags, as part of the metric name, are considered part of the unique identifier for the metric stream.

### Measurement Tags

While part of the specification, Measurement Tags are experimental and should not be used at this time. They are not part of the unique identifier of a metric stream.

## Tags

Tags in IRONdb are represented as `category:value pairs` that are separated by the colon (`:`) character.

Category strings may contain upper- and lowercase letters (`A-Z` and `a-z`), numerals (`0-9`), and the following characters:

```
`+!@#$%^&"'/?._-
```

Tag values allow all of the above characters plus colon (`:`) and equals (`=`).

Any tag characters that do not fall into this set can still be ingested if they are quoted, or base64 encoded and passed in a special wrapper format. More on this below.

Tags are ingested into IRONdb by placing the tags after the metric name with a tag separator character sequence: `|ST` and enclosed in square brackets `[]`. Commas separate each tag.

Examples:

```
foo|ST[a:b]
bar|ST[c:d]
quux|ST[region:us-east-1,app:myapp]
```

Tags (including category, colon, and value) are limited to 256 characters for each tag-pair. Tag-pairs exceeding that length will be truncated.

### Base64 Encoding

Tags that contain characters outside of the acceptable set can be ingested, or searched for, by base64 encoding. To store a metric like:

```
foo|ST[~(category):<value>]
```

The tilde `~`, parens `()`, and greater/less `<>` are outside of the acceptable character set. The category and value can be encoded separately as base64 and enclosed in `b""`. For example:

```
foo|ST[b"fihjYXRlZ29yeSk=":b"PHZhbHVlPg=="]
and(b"fihjYXRlZ29yeSk=":b"PHZhbHVlPg==")
```

It is always safe to encode _all_ incoming tags in this way, the server will decide if the name is safely representable without encoding and store the metric name decoded if it can.

### Quoting

For searching, but not ingestion, tags that contain characters outside of the acceptable set can also be quoted with double-quotes. Double-quoted strings accept all printable ASCII characters other than `"` and `\`, which must be escaped as `\"` and `\\`, respectively.

To search for a metric like:

```
foo|ST[~(category):<value>]
```

The tilde `~`, parens `()`, and greater/less `<>` are outside of the acceptable character set. The category and value can be quoted separately with `""`. For example:

```
and("~(category)":"<value>")
```

> See [Searching Tags](metric-names-and-tags.md#tag-queries)

## Tag Queries

Tag queries can be used to find or perform deletion of metrics using a boolean tag search.

### Query Syntax

A query follows this eBNF syntax:

```
query-param = all-of | any-of | not
all-of = "and(" query-tag-list ")"
any-of = "or(" query-tag-list ")"
not = "not(" query-tag-el ")"
query-tag-list = query-tag-el | query-tag-el "," query-tag-list
query-tag-el = all-of | any-of | not | tag-category:tag-value | /cat regex/:/val regex/ | glob
```

A `not` clause may only contain a single expression, whereas `and`/`or` may each contain a list of expressions. Each expression may be a literal `key:value` to match, a regular expression, or a glob match syntax.

Regular expressions follow the PCRE2 syntax and are of the form:

```
/category regex/:/value regex/
```

Note that you can apply regular expressions independently to category or value or both:

```
category:/value regex/
/category regex/:value
```

Glob syntax supports the wildcard "`*`" and can be used as a completer:

```
categ*:value
category:val*
*:*
```

The last will match every tag and pull everything for the account.

There are several special tags:

* `__name`
* `__check_uuid`
* `__activity`

Which do not explicitly appear in metric names but can be used to find metrics anyway. For example, you could query activity periods for all metrics within a given `__check_uuid` even if none of those metrics were submitted with tags.

The `__activity` tag uses a special syntax to select only metrics that have data (also know as activity) in a specific time range (start and end both inclusive). The value of the `__activity` tag in the search expression must take one of the following formats:

* `<start seconds>-<end seconds>` (hyphen format)
  * `<start seconds>`: Seconds since Unix epoch. May contain decimal precision. May be omitted to mean "the beginning of time". Note that a value of `1` shares this meaning.
  * `<end seconds>`: Seconds since Unix epoch. May contain decimal precision. May be omitted to mean "the end of time".
* `<start time string/seconds>:<end time string/seconds>` (colon format)
  * `<start/end seconds>`: Seconds since Unix epoch. May contain decimal precision. Note: Unlike the above, this may not be omitted.
  * `<start/end time string>`: Seconds since Unix epoch of the form `[origin time] [<+/-><duration string>]`. `origin time` may be either the literal string `now` or seconds since epoch as above. If omitted, `now` is assumed. `<duration string>` is optional and explained below, but may not be present without `+/-` preceding the whole specified duration.
* `<duration string>`: String of positive integers (Example: `1h2m` is valid, `1h-2m` is not. Note that the `+/-` above is not part of `<duration string>`.) and units representing a human-readable time span. **UNITS MAY NOT BE OMITTED**
  * `w`/`wk`/`week`: weeks
  * `d`/`day`: days
  * `h`/`hr`/`hour`: hours
  * `m`/`min`: minutes
  * `s`/`sec`: seconds
  * Example: `2d3h` = 2 days, 3 hours.
  * Note: Years/months omitted because they are not consistent values (leap years/short months)
* Full example of "hyphen format":
  * Given: `1640995200-1641600000`
  * Translated: `Jan 1 2022 00:00:00 GMT+0000` through `Jan 8 2022 00:00:00 GMT+0000`
* Full example of "colon format":
  * Given: `now - 1w2d3h : - 1w1d`, assume `now` is the Unix time `1641600000` (`Jan 8 2022 00:00:00 GMT+0000`)
  * `now - 1w2d3h` translation:
    1. `now - 788400s`
    2. `1640811600` (seconds since Unix epoch)
    3. `Dec 29 2021 21:00:00 GMT+0000`
  * `- 1w1d` translation:
    1. `now - 1w1d`
    2. `now - 691200s`
    3. `1640908800` (seconds since Unix epoch)
    4. `Dec 31 2021 00:00:00 GMT+0000`
  * Translated: `Dec 29 2021 21:00:00 GMT+0000` through `Dec 31 2021 00:00:00 GMT+0000`

An example to find metrics named `query_count` with data between 1569869100 to 1569870000 would be:

`and(__name:query_count,__activity:1569869100-1569870000)`

An example to find metrics named `query_count` with data between two weeks ago and one week ago would be:

`and(__name:query_count,__activity:-2w:-1w)`

If your query segment uses an unsupported tag character you must enclose the segment in double-quotes, or use base64 notation:

`and("foo$%^":"bar$%^")` `and(b"Zm9vJCVe":b"YmFyJCVe")`

Note that the asterisk (`*`) for glob syntax is supported and stays a glob even if quoted or base64 encoded. To remove this behavior use the `[exact]` qualifier.

`and([exact]"foo*":"bar")` `and(b[exact]"Zm9vKg==":b"YmFy")`

If using regular expression patterns, the `/ /` should not be encoded. The regex pattern however, may be base64 encoded if it uses a character that otherwise will violate parse rules. To perform a regex match in this form would look like `b/KGZvb3xiYXIp/`.

### Query Examples

You have ingested the following metrics:

```
foo|ST[region:us-east-1,app:myapp]
bar|ST[region:us-east-2,app:myapp]
baz|ST[region:us-west-1,app:myapp]
quux|ST[region:us-west-2,app:yourapp]
```

To find all of the metrics under `app:myapp` your query would be:

`and(app:myapp)`

To find all of the metrics in `us-east` regardless of sub-region you would do:

`and(region:us-east-*)` in glob syntax or:

`and(region:/us-east-.*/)` in regex syntax.

To find `bar` or `quux` you could either do:

`or(__name:bar,__name:quux)`

or:

`or(and(region:us-east-2,app:,myapp),and(region:us-west-2,app:yourapp))`

### `match impl` Search Options

While primarily used for the `__name` tag, there are other options that can be invoked for specific search types on tag categories or values. These are known as "match impl" and have four options and can be activated with an optional `[<type>]` invocation at the beginning of the value.

* `default` - Literal matches with glob (`*`) support - as its name implies, this is the default form
* `exact` - Literal without glob support - useful for matching metrics with a `*` character
* `re` - The following string is a regex - this is synonymous with `tag_cat:/<regex>/`
* `graphite` - The string is part of a graphite-ingested name. This function allows IRONdb to use graphite-specific search indexes for better performance.

These options are applied to whatever immediately follows them barring delimiting characters, so using them with unencoded values is straightforward:

example: `and(__name:[graphite]prod.thing.nyc2.meter.worker.counter)`\
example: `and(__name:[graphite]prod.*.*.,mycategory:[re]foo.*bar[0-9]{5})`

When using Base64 encoding, the same logic applies, therefore given a Base64 string as above `b"Zm9vKg=="`, the correct application of the `match impl` would be `b[<type>]"Zm9vKg=="`:

example: `and(__name:b[exact]"Zm9vKg==")`

Note that, in accordance with the above, if the `match impl` is placed before the `b` in a Base64 string, it will result in matching the Base64 string as though it were not encoded.
