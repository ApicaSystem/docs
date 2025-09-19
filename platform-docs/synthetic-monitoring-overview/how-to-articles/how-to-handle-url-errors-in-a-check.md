# How to Handle URL Errors in a Check

### Introduction <a href="#howtohandleurlerrorsinacheck-introduction" id="howtohandleurlerrorsinacheck-introduction"></a>

In short, Severity Mapping allows the user to assign one of four specific resulting statuses:

1. **Information**
2. **Warning**
3. **Error**
4. **Fail**

For a specific HTTP transaction receiving a specific HTTP response, for whatever purpose. Some users may not need to use Severity Mapping; others may find it indispensable.

Of the four statuses Apica monitoring provides, Severity Mappings allows you to select a specific HTTP transaction, define a set of HTTP responses (or use an asterisk for any response), then assign a specific Status to that set of circumstances. Here are some examples of Severity Mapping Uses:

Common reasons to use Severity Mappings where Blocks aren't a solution include:

* Known recurring errors from a specific service or transaction that don't need to be sending out alerts
* Some specific Background error that needs investigation but doesn't need to throw alerts
* Monitor 3rd party URLs without check failures
* Integrating Severity Mappings with Alerts

We'll look at some specific use cases to clarify, but first, let's look at our Blocking tools to note what Severity Mapping isn't.

#### Block URL <a href="#howtohandleurlerrorsinacheck-blockurl" id="howtohandleurlerrorsinacheck-blockurl"></a>

_This is a way to disregard an HTTP response._

The Block URL tool is available in the Check Settings:

Blocking a URL disregards any calls made to the URL from the check's waterfall results. The most common reason to Block a URL entirely is that the performance of that URL is outside the responsibility of the Performance Team—examples: Ad Services, Facebook, Google services, 3rd party services in general.

The format for blocking is '[subdomain.domain.com](http://subdomain.domain.com)' - the protocol (HTTP:// or HTTPS://, for example) should be removed, as well as any path to a specific file. Here are a few blocks as examples:

Note: Block rules can be implemented using **Wildcards**. such as an asterisk '\*'

e.g. \*[block.thisDomain.com/dummyUrl/script.js\*](http://block.thisdomain.com/dummyUrl/script.js*)

The disadvantage of Blocking a URL is that it disregards "all" calls to the designated URL: this isn't the tool to use if you want to monitor some URLs associated with a domain but not others.

#### Block File Types / Block MIME Types <a href="#howtohandleurlerrorsinacheck-blockfiletypes-blockmimetypes" id="howtohandleurlerrorsinacheck-blockfiletypes-blockmimetypes"></a>

These can also be used to block calls by file type or by MIME type. The disadvantage is the same as Blocked URLs: these options don't allow monitoring some URLs of a given File or MIME type but disregarding others.

### Alerts based on Severity <a href="#howtohandleurlerrorsinacheck-alertsbasedonseverity" id="howtohandleurlerrorsinacheck-alertsbasedonseverity"></a>

**You can set alerts** based on Severity, which are then sent to 'Targets' (individual users) or 'Groups' (of users) to review alerts according to the parameters you prefer.

#### Mapping <a href="#howtohandleurlerrorsinacheck-mapping" id="howtohandleurlerrorsinacheck-mapping"></a>

With **Severity Mapping**, you can customize how to handle error codes. Specify the URL Pattern, HTTP error status codes, and which severity you want to treat the error status codes as.

**View**



| **Item**           | **Description**                                    | **Comment**                                                                                                                                    |
| ------------------ | -------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Severity Mapping   | Method for converting errors.                      | `Wildcard`/ `Regex`                                                                                                                            |
| URL Pattern        | The pattern for URLs to match.                     | A URL Pattern can be mapped as Regex.                                                                                                          |
| Error Status Codes | The pattern for HTTP Status Codes to match.        |                                                                                                                                                |
| Treat As Severity  | Level of Severity to convert to.                   |                                                                                                                                                |
| Preserve Value     | Keep and use the mapped error as a reported value. | The default behavior is not to save the result and report errors as failed checks.                                                             |
| Error Wildcard     | Setting for Severity Wildcard.                     | Wildcards can be used by themselves or at the beginning or end of a URL Pattern. Unique HTTP error status code can have a wildcard at the end. |

Note that the mapping only applies to URLs in the Check Result that returns an error status code (e.g., 4xx or 5xx).

#### Priority <a href="#howtohandleurlerrorsinacheck-priority" id="howtohandleurlerrorsinacheck-priority"></a>

Severity rules are resolved in this order

1. Fatal
2. Error
3. Warning
4. Information

If a URL matches two or more severities, the higher severity will be used.
