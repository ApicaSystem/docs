---
description: >-
  The following document describes how Apica Ascent's log search functionality
  works.
---

# Apica Ascent Search Cheat Sheet

## Simple search

To carry out a simple search, type any word or series of words into the **Search** bar and click **Search** or hit Enter on your keyboard.

![Search Bar](<../../.gitbook/assets/image (6) (1).png>)

By default, Apica Ascent scans for your search term(s) using the `and` operator. If your search query contains more than one word, the search engine looks for occurrences that contain both words. For example, searching for the term `Read Error` returns records that contain both `read` and `error` and not necessarily in the same sequence. Searches are also not case-sensitive. For example, searching for `ReadError` returns records that contain both `read` and `error`.

### Exact match

To search for exact matches of your search string, wrap your search string in double-quotes. For example, if you search for `"Read Error"` the search results will only contain records that match the search string exactly. If no records are an exact match of the search string, the search does not yield any result.

## Advanced search

Apica Ascent's advanced search feature supports the use of complex expressions in the search query. With this feature, you can include `and` or `or` expressions, regular expressions, and mathematical symbols such as `<` and `>`.

{% hint style="info" %}
**Note:** Apica Ascent only supports RE2 syntax while using regular expressions to construct advanced search queries. For more information on the RE2 syntax, visit the [RE2 Wiki](https://github.com/google/re2/wiki/Syntax).
{% endhint %}

The following image depicts how you can conduct an advanced search within Apica Ascent.

![Advanced Search Dialog](../../.gitbook/assets/advanced-search-2022-01-25_17-40-46.png)

### Comparators

The following list contains comparison operators that you can use to build your advanced search query on Apica Ascent.

| Operator | Description                       | Function                                                                                                                                                                                                                                               |
| -------- | --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `==`     | Equal to operator                 | Returns records if they are exact matches of the search string                                                                                                                                                                                         |
| `>`      | Greater than operator             | Compares string literals lexicographically.                                                                                                                                                                                                            |
| `>=`     | Greater than or equal to operator | Compares string literals lexicographically.                                                                                                                                                                                                            |
| `<`      | Less than operator                | Compares string literals lexicographically.                                                                                                                                                                                                            |
| `<=`     | Less than or equal to operator    | Compares string literals lexicographically.                                                                                                                                                                                                            |
| `=~`     | Regex match operator              | <ul><li>Returns records that match the given search string.</li><li>This operator only works with string literals.</li><li>This operator does not match numerical values.</li><li>You can use regular expressions with this operator.</li></ul>        |
| `!=`     | Not equal to operator             | <ul><li>Returns records that do not match the given search string.</li><li>This operator only works with string literals.</li><li>This operator does not match numerical values.</li><li>You can use regular expressions with this operator.</li></ul> |

### Things to consider

Apica Ascent uses the Porter stemmer algorithm while creating the index. The [Porter algorithm](https://en.wikipedia.org/wiki/Stemming) stems strings such as "argue", "argued", "argues", "arguing", and "argus" to the stem "argu". Searching for "argue" or "argued" or "argu" in Apica Ascent yields the same results due to the employed stemmer algorithm.

This also implies that only valid stems can return search results. Apica Ascent ignores stems with lengths less than 3 characters. Searching for `message =~ '\\d{3}'` yields no results since stemming `\\d{3}` does not generate any stems.

#### Custom Indices

Apica Ascent custom indices help deliver exponentially faster search experiences while working with sparse data. You can create Log2Metrics for your logs to generate custom indices. Each Log2Metrics definition creates additional indices based on search matches. For example, a Log2Metric defined to monitor ingress with a status code as a label called `ingress_code__e1001e` can generate supplementary indices such as `ingress_code__e1001e_status_code_401`, `ingress_code__e1001e_status_code_500`, and so on.

{% hint style="info" %}
**Note:** For more information on creating Log2Metrics for your logs, refer to [Metrics and Custom Indices](metrics-and-custom-indices.md#creating-a-log-2-metric).
{% endhint %}

#### Stop words

Apica Ascent never indexes the following words.

* able
* about
* across
* after
* all
* almost
* also
* among
* and
* any
* are
* because
* can
* cannot
* could
* dear
* did
* does
* either
* else
* ever
* every
* for
* from
* got
* had
* has
* have
* her
* his
* how
* however
* into
* its
* just
* least
* let
* like
* likely
* may
* might
* most
* must
* neither
* not
* off
* often
* only
* other
* our
* own
* rather
* said
* say
* says
* she
* should
* since
* some
* than
* that
* the
* them
* then
* there
* these
* they
* this
* tis
* too
* twas
* wants
* was
* were
* what
* when
* where
* which
* while
* who
* will
* with
* would
* yet
* you
* your
