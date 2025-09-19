# Using Regular Expressions Within the ASM Platform

Regular Expressions can be used to perform pattern matching on domain names within the ASM platform. The following examples provide examples of how Regex can be used effectively within ASM.

The ASM regex implementation uses the [PERL](https://www.perl.org/) programming language library.

## General Examples of Regex within the ASM Platform <a href="#usingregularexpressionswithintheasmplatform-generalexamplesofregexwithintheasmplatform" id="usingregularexpressionswithintheasmplatform-generalexamplesofregexwithintheasmplatform"></a>

### Top Domain Match <a href="#usingregularexpressionswithintheasmplatform-topdomainmatch" id="usingregularexpressionswithintheasmplatform-topdomainmatch"></a>

`||https?:\/\/(www\.)?(`[a-zA-Z0-9-](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=a-zA-Z0-9-)`+\.)?co\.uk.*`

This regex string matches on any site which has a top-level domain of `co.uk`.

(You can modify it to only look for `.com` top-level domains as well by replacing `?co\.uk.*` with `?com.*`.

Valid links: [http://apicasystems.co.uk/\\](http://apicasystems.co.uk/) , [https://www.apicasystems.co.uk/\\](https://www.apicasystems.co.uk/)

Invalid links: `www.apicasystems.co.uk` , [http://www.apicasystems.com/\\](http://www.apicasystems.com/)

### Exclude Top Domain <a href="#usingregularexpressionswithintheasmplatform-excludetopdomain" id="usingregularexpressionswithintheasmplatform-excludetopdomain"></a>

`||https?:\/\/(www\.)?testing.apicasystems\.com\/.+`

This expression looks for a second-level domain called `testing.apicasystems` and a top-level domain of `.com`. Anything after the link will not be matched.

Useful for excluding the root folder of a website but maintaining reporting for the rest of the site.

Valid link: [https://testing.apicasystems.com/\\](https://testing.apicasystems.com/)

Invalid links: [https://testing.apicasystems.com/home/\\](https://testing.apicasystems.com/home/) , [https://testing.apicasystems.com/file.php\\](https://testing.apicasystems.com/file.php)

### Exclude String <a href="#usingregularexpressionswithintheasmplatform-excludestring" id="usingregularexpressionswithintheasmplatform-excludestring"></a>

 `||((?!apicasystems).)*$`

This regex string string looks for every word except for `apicasystems`.

Useful when a folder on the server is missing and it will take a while to fix.

### Ignore External Site <a href="#usingregularexpressionswithintheasmplatform-ignoreexternalsite" id="usingregularexpressionswithintheasmplatform-ignoreexternalsite"></a>

`||https?:\/\/(www\.)?(`[a-zA-Z0-9-](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=a-zA-Z0-9-)`+\.)?apicasystems\.com.((?!APIone).)*$`

This regex string looks for something to skip, and also requires that `apicasystems` is in the string.

Say for example your site has a function called `APIone`, and you want to severity map any errors to `APIone` as information.

But a third-party website also has a function called `APIone` and if that function fails you want to get alerted by it.

With this string you can specify it to only look for errors on your site and ignore any other one.

## Examples of Regex Within Severity Mapping <a href="#usingregularexpressionswithintheasmplatform-examplesofregexwithinseveritymapping" id="usingregularexpressionswithintheasmplatform-examplesofregexwithinseveritymapping"></a>

Regular Expressions can be used to customize [Severity Mapping](broken-reference) within a check configuration.

### Skip and Keep <a href="#usingregularexpressionswithintheasmplatform-skipandkeep" id="usingregularexpressionswithintheasmplatform-skipandkeep"></a>

| **URL Pattern**                                  | **Treat As Severity** |
| ------------------------------------------------ | --------------------- |
| `\|\|https?:\/\/(www\.)?inside.example\.com\/.+` | `fatal`               |
| `\|\|((?!example).)*$`                           |  `warning`            |

In this case, we are aware that the base domain `inside.example.com` always returns `403`, so we want to ignore that, but catch errors in directories for the domain.

The first pattern will match an URL with the subdomain `inside.example.com` followed by something, for example, `inside.example.com/home`. If the URL is only the base domain the error will be ignored.

The second pattern matches the string `example` in URLs, and any errors not handled by the first pattern will generate a Warning.

### Warn On Known Error <a href="#usingregularexpressionswithintheasmplatform-warnonknownerror" id="usingregularexpressionswithintheasmplatform-warnonknownerror"></a>

If you have an error occurring that you want to ignore, but still want to receive any other fatal errors:

|                                                 | URL Pattern |          | Treat As Severity |
| ----------------------------------------------- | ----------- | -------- | ----------------- |
| `\|\|(?=.?\bexample\b)((?!fonts.googleapis).)$` |             |  `fatal` |                   |

This pattern looks for `example` in the URL, and if it also contains `fonts.googleapis`, the error will be ignored.
