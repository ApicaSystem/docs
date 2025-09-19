# How to Combine Multiple ZebraTester Scripts Into One

The **Session Cutter Menu** allows loading up to 3 Web surfing sessions into RAM and then rearranging their Web pages to a new surfing session, similar to splicing motion picture films together to create a complete movie.\
[The Session Cutter allows also to import Web surfing sessions from (external) Definition Files](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/107380972/How+to+Combine+Multiple+ZebraTester+Scripts+Into+One#Importing-Web-Surfing-Sessions-from-External-Definition-Files).

### Cutting Sessions <a href="#howtocombinemultiplezebratesterscriptsintoone-cuttingsessions" id="howtocombinemultiplezebratesterscriptsintoone-cuttingsessions"></a>



This process can only be performed using "raw" web surfing sessions; that is, recorded sessions that have not yet been enhanced using the "Var Finder“ or using the "Var Handler “. If an “enhanced" web surfing session is loaded into the Session Cutter Menu, a warning message will be displayed. If the warning is ignored, all enhancements will be deleted; that is, after using the Session Cutter, the "Var Finder" and/or "Var Handler" enhancements will have to be done over again.



Individual web pages can be selected by clicking on the name or the number of the Web-Page. The selected web page(s) can be moved or copied by using the "move here" or "copy here" button.

After the splicing of the new web surfing sessions is complete, the Session Cutter Menu can be closed by clicking on the "Close" button or by clicking again on the Session Cutter icon.

### Importing Web Surfing Sessions from External Definition Files <a href="#howtocombinemultiplezebratesterscriptsintoone-importingwebsurfingsessionsfromexternaldefinitionfiles" id="howtocombinemultiplezebratesterscriptsintoone-importingwebsurfingsessionsfromexternaldefinitionfiles"></a>



The Session Cutter allows additionally to import web surfing sessions from external definition files:

**Data Format of Definition Files**

Definition Files are written in ASCII format. Each line contains either a command or a URLdefinition. Commands always begin with a hyphen (-).

URL definitions must contain at least 3 arguments:

1. The HTTP method (GET, POST …)
2. absolute or relative URL
3. expected HTTP response status code of the URL call (200, 302 …)
4. Argument 4 of a URL definition is optional and contains the requested content

All further arguments are optional and contain URL options that begin with a hyphen (-)\


```
<-command> [<argument 1>..<argument n>]
<HTTP method> <URL> <HTTP status code> [<request content>] [<-URLoption 1>..<-URLoption n>]
...
<HTTP method> <URL> <HTTP status code> [<request content>] [<-URLoption 1>..<-URLoption n>]
<-command> [<argument 1>..<argument n>]
<HTTP method> <URL> <HTTP status code> [<request content>] [<-URLoption 1>..<-URLoption n>]
...
```

Comments at the start or within a line are supported and begin with a hash character (# ).

All values can be also be optionally enclosed with double-quotes.

#### Example: <a href="#howtocombinemultiplezebratesterscriptsintoone-example" id="howtocombinemultiplezebratesterscriptsintoone-example"></a>

```
#
# default settings
-defaultURL http://www.d-fischer.com
-autoPageBreak 4 3 50

POST /search 200 "query=address&x=5" -responseContentCheck "phone number" -responseContentType "text/html"
GET http://www.proxy-sniffer.ch/clients.html 200
GET /hotlinks/index.html 200
GET /jobs 301
GET http://www.proxy-sniffer.com/logo.gif 200 -responseContentType "image/gif"
```

#### Commands <a href="#howtocombinemultiplezebratesterscriptsintoone-commands" id="howtocombinemultiplezebratesterscriptsintoone-commands"></a>

| `userAgent <browser type>`                                     | Allows the setting of a new web browser identifier to be applied for all URL calls. The default value is "Mozilla/4.0 (compatible; MSIE7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)".                                                                                                                        | <p><br></p>                                                  |
| -------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| `defaultURL <URL>`                                             | Allows the setting of a default absolute URL to be used as the basis for all following URLdefinitions which are specified in a relative format. Only the protocol, the host, and the TCP/IP port of the absolute URL specified are used in building the full URL in combination with the relative URL.                      | <p><br></p>                                                  |
| `defaultRequestContentDirectory <directory>`                   | Allows the setting of a default (local) directory from which request content files are read. This command can be used in combination with the URL option -requestContentFile.                                                                                                                                               | <p><br></p>                                                  |
| `defaultRequestContentType <content type>`                     | Allows the setting of a new default value for the request content type for all URL calls which contain request content data. This overrides the default value, used when this command is not applied, of "application/x-www-form-urlencoded".                                                                               | <p><br></p>                                                  |
| `defaultRequestHeaderField <request header field>`             | Allows the setting of an additional HTTP request header field to be applied for all URL calls. This command can be called several times, allowing the definition of several additional header fields.                                                                                                                       | Example: -defaultRequestHeaderField "Accept-Language: en-us" |
| `defaultResponseContentType <content type>`                    | Allows the setting of a default expected response content type, such as "text/html". The use of this command is only appropriate if all defined URLs return the same response content type. By default, the response content type of URL calls will not be verified.                                                        | <p><br></p>                                                  |
| `autoPageBreak <number of URLs <think time <random deviation>` | Allows the automatic insertion of Page Breaks, to be inserted after every specified number of URLdefinitions are processed. The second parameter - the user's think time - must be set (in seconds), and the third parameter - the random deviation of the think time - must be set (in a percent: 0..100).                 | <p><br></p>                                                  |
| `addPageBreak <comment <think time <random deviation>`         | Allows the insertion of a Page Break. This command can be called multiple times, before or after URL definitions. The first parameter is the comment for the page break, the second parameter is the user's think time (in seconds), and the third parameter is the random deviation of the think time (in percent: 0…100). | <p><br></p>                                                  |
| `eof`                                                          | Stops processing of the definition file at this point. This command can be used when only a part of the URL definitions should be processed.                                                                                                                                                                                | <p><br></p>                                                  |

#### URL Options <a href="#howtocombinemultiplezebratesterscriptsintoone-urloptions" id="howtocombinemultiplezebratesterscriptsintoone-urloptions"></a>

| `requestContentFile <file name>`                | It allows the use of the content of a (local) file as request content. Argument 4 of the URL definition is not used, and not required if this option is set. If the command -defaultRequestContentDirectory was previously called, the file name is only allowed to be the simple name of a file within the default request content directory. |
| ----------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `requestContentType <content type>`             | Allows the setting of a specific value for the request content type for this URL call. The default value, used when this option is not set, is that set by the command -defaultRequestContentType or, failing that, `application/x-www-form-urlencoded` if the command -defaultRequestContentType was not previously used.                     |
| `requestHeaderField <request header field>`     | Allows the setting of an additional HTTP request header field for this URL call. This option can be specified several times, allowing the addition of several HTTP request header fields.                                                                                                                                                      |
| `responseContentType <content type>`            | Allows the setting of the expected response content type. If this option is not used, and if the command -defaultResponseContentType has not been previously used, the response content type will not be verified.                                                                                                                             |
| `responseContentCheck <text fragment>`          | Checks to see if the response content contains a specified text fragment. The response content will not be verified if this option is not set.                                                                                                                                                                                                 |
| `responseContentSize <content size <deviation>` | Checks the size of the response content. The size of the response content will not be verified if this option is not set. Argument 1 contains the size in bytes, and argument 2 contains the maximum allowed deviation of the size in percent (0..100).                                                                                        |

&#x20;**Tip:** the URL option -**requestContentFile** can, for example, be used to **POST XML data**.

Example:

```
-defaultURL http://www.d-fischer.com
-defaultRequestContentDirectory "D:\XmlData"
POST /putDataDo?action=addAddress 200 -requestContentFile requestData.xml -requestContentType "text/xml"
```
