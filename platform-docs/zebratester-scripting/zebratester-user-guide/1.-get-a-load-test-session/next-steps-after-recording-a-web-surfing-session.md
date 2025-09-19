# Next Steps after Recording a Web Surfing Session

* [Saving the Recorded Web Surfing Session](broken-reference)
* [Reviewing the Recorded Web Surfing Session](broken-reference)
  * [Reviewing the Stressed Web Servers](broken-reference)
  * [Reviewing the Automatically-Applied Content Test](broken-reference)
    * [Search Text Examples](broken-reference)
    * [Max. Stored Content Size](broken-reference)
    * [Failure Action](broken-reference)
    * [Reset Settings](broken-reference)
  * [Configuring Parallel or Serial URL Execution within Web Pages](broken-reference)
* [Executing a First Load Test](broken-reference)

After recording a web session, a number of further steps should be performed.

## Saving the Recorded Web Surfing Session <a href="#nextstepsafterrecordingawebsurfingsession-savingtherecordedwebsurfingsession" id="nextstepsafterrecordingawebsurfingsession-savingtherecordedwebsurfingsession"></a>

ZebraTester keeps the entire recorded Web surfing session in its transient memory cache.

| For this reason, you should save the recorded Web surfing session to disk by using the **Save Session** icon inside the Web Admin GUI. All data from the Web surfing session are saved, including all HTTP request- and response-headers, all recorded HTTP content data, and all page break definitions. Any special session enhancements made by using the Variable Handler, or by using the content test configuration menu, are also saved. We recommend that you also enter a small comment describing the recorded session. |   |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | - |
| After saving the session, the **Project Navigator** menu appears.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |   |
| <p>You can later restore the Web surfing session by clicking on the “Load Recorded Session” icon of a saved session inside the Project Navigator.</p><p></p>                                                                                                                                                                                                                                                                                                                                                                      |   |

## Reviewing the Recorded Web Surfing Session <a href="#nextstepsafterrecordingawebsurfingsession-reviewingtherecordedwebsurfingsession" id="nextstepsafterrecordingawebsurfingsession-reviewingtherecordedwebsurfingsession"></a>

After you have recorded a Web-surfing session, you should review the results by checking the following:

1. Does the recorded session contain only URL calls to the webserver(s) you want to test?
2. Has the automatically-applied content test check for the recorded Web pages been correctly configured?

### Reviewing the Stressed Web Servers <a href="#nextstepsafterrecordingawebsurfingsession-reviewingthestressedwebservers" id="nextstepsafterrecordingawebsurfingsession-reviewingthestressedwebservers"></a>

Some of the recorded Web pages may contain, embedded in them, images with a size of pixels originating from an external Web session-tracking server. In order to not stress external tracking servers, we recommend that you remove these URLs from the recorded Web surfing session.

You should also review the hostnames, or the IP addresses, of all recorded URLs. If you find some unnecessary or unwanted hosts, you should remove such URLs by clicking on the red cross icon near the item number on the left side of the URL. Alternatively, you can use the host field of the URL filter to suppress any unwanted URL:



### Reviewing the Automatically-Applied Content Test <a href="#nextstepsafterrecordingawebsurfingsession-reviewingtheautomatically-appliedcontenttest" id="nextstepsafterrecordingawebsurfingsession-reviewingtheautomatically-appliedcontenttest"></a>

Avoid executing tests without controlling the received content of URL calls by comparing them to the originally recorded data. Many errors from Web server applications are embedded inside valid HTTP 200 responses. Therefore, the content of the responses must be also be checked to detect content errors under load. For this reason, ZebraTester examines the content of all recorded URLcalls, and automatically applies a content check per each URL call using a heuristic algorithm. This algorithm performs content checks by searching for an ASCII-text string inside the received content; however, if this seems to be impossible, or if this doesn't seem to make sense, the received content is checked by its size (content length) instead of by searching an ASCII-text string.

After clicking on the **View** icon inside the Web Admin GUI main menu, the display of the recorded Web surfing session changes to an _**Alternate View**_, and then automatically applied content test methods are displayed for the URL calls at right. Binary data, such as images, are checked by their size - this is fast and works well in most cases. You should always review content tests where an ASCII text fragment is searched for inside HTML data (Web pages), and check whether the pre-configured search text makes sense.



The content test configuration can be modified by clicking on the magnifier icon which will open another dialog, **HTTP Response Verification & Failure Action**:



During the execution of a load test program, the HTTP response code and the received MIME type of each URL call is always compared with the originally-recorded response from the web surfing session (if not disabled manually). The response verification menu allows the specification of how received content is to be tested:

**Verify Content by Size:** Only the size of the content is checked. This is a good, fast approach for completely static content such as images. You may also set an acceptable size derivation of ±0% if the content never changes.

**Verify Content by Text:** a text fragment is searched inside the received content. This is the best method for testing dynamically-generated HTML pages. If the content contains HTML or XML text, ZebraTester Analyzes the recorded content and gives rated suggestions (0..1) for advisable text fragments. Alternatively, you can enter your own desired text fragment.

In addition to searching for the occurrence of a simple text inside the received response content of an URL call, the following special search patterns are supported:

| **String**                       | **Description**                                                                                                         |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
|  `![<search text>]`              |  The search text must not occur inside the received content.                                                            |
|  `#<int>[<search text>]`         |  The search text must occur exactly \<int> times inside the received content.                                           |
|  `#<int>-[<search text>]`        |  The search text must occur a minimum of \<int> times inside the received content.                                      |
|  `#<int1>-<int2>[<search text>]` |  The search text must occur a minimum of `<int1>` times, but not more than `<int2>` times, inside the received content. |

#### Search Text Examples <a href="#nextstepsafterrecordingawebsurfingsession-searchtextexamples" id="nextstepsafterrecordingawebsurfingsession-searchtextexamples"></a>

| **Text**             | **Description**                                                                                                         |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `hello`              | The search text "hello" must occur at least once inside the received content.                                           |
| `![ORA-01652]`       | The search text "ORA-01652" must not occur inside the received content.                                                 |
| `#1[Dear Mr.]`       | The search text "Dear Mr." must occur exactly one time inside the received content.                                     |
| `#1-2[Order Number]` | The search text "Order Number" must occur a minimum of one time and a maximum of two times inside the received content. |
| `#3-[new order]`     | The search text "new order" must occur a minimum of three times inside the received content.                            |

**Note:** One or more variable text patterns in the form of `${<variable name>}` are supported as a part of the search text; for example, `Welcome ${gender} {$name}`.

#### Max. Stored Content Size <a href="#nextstepsafterrecordingawebsurfingsession-max.storedcontentsize" id="nextstepsafterrecordingawebsurfingsession-max.storedcontentsize"></a>

By configuring a value other than unlimited all response data are read as usual during the load test execution, but only a part of them are stored internally. This means for example that error snapshots that are made in case of failures may not contain all received response data. On the other hand configuring the maximum stored content size with **a value of less or equal than 5 megabytes can save a lot of Java memory during the load test execution and allows you to receive response content data of a large size (multiple gigabytes), even when many hundreds of Web users are simulated by only one load generator.**

If a value other than unlimited is configured the following restrictions apply during the execution of the load test:

* If the content data are received in a compressed format they are not automatically decompressed if the response content is larger than the configured value.
* The real size of the stored content data may be a little bit smaller or larger than the configured maximum value (+/- 32 kilobytes).

#### Failure Action <a href="#nextstepsafterrecordingawebsurfingsession-failureaction" id="nextstepsafterrecordingawebsurfingsession-failureaction"></a>

The Failure Action determines what happens in case the URL call fails.

| `Abort Loop Next Loop`  | This means that the current loop (repetition of Web surfing session) of the simulated user is aborted and that the simulated user executes subsequent to that the next loop (if more loops per user are planned, or if the duration of the load test is not exceeded). Such failures are also named **fatal errors**. |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

Optionally, you can activate the checkbox **Terminate User** which effects that all simulated users for which this failure occurs are removed from further load test execution.

| `None - Continue Loop`  | This means that the simulated user continues to execute the current loop (repetition of web surfing session). Such failures are also named **non-fatal errors**. This option should only be used if no variables have to be extracted from the response of the URL call - or in other words - only if the succeeding URL calls do not depend on the response of this URL. |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

#### Reset Settings <a href="#nextstepsafterrecordingawebsurfingsession-resetsettings" id="nextstepsafterrecordingawebsurfingsession-resetsettings"></a>

By clicking on the **Apply Default Settings** button at the bottom of the window you can undo your changes and the default settings are reapplied.

### Configuring Parallel or Serial URL Execution within Web Pages <a href="#nextstepsafterrecordingawebsurfingsession-configuringparallelorserialurlexecutionwithinwebpages" id="nextstepsafterrecordingawebsurfingsession-configuringparallelorserialurlexecutionwithinwebpages"></a>

This function allows configuring the Runtime Execution Behavior (serial or parallel execution order) for one URL, or for a group of URLs, or for all URLs - which will be applied _per simulated user_ during the execution of the load test.

Normally the first URL of a standard Web page should always be executed serial - analog to the behavior of a normal Web browser. Additionally, any redirects located at the start of a Web page should also be executed serially. Subsequently following URLs of a Web page such as images can then be executed in parallel. The synchronization point for all in parallel executed URLs is always at the end of a page.





It might be necessary to consider variables that are assigned or extracted to or from URLs, meaning that a variable cannot be extracted from a parallel executed URL and then assigned to another succeeding URL which is also executed in parallel on the _same page_. Therefore to avoid unexpected runtime errors during a load test we recommend that you **always use the** **Auto-Configuration for Parallel URL Runtime Execution**, which considers almost all aspects.



In principle, you can configure the Runtime Execution Behavior for each URL separately. However, such a manual configuration may be overwritten when you invoke later the Auto-Configuration. To avoid this behavior you can protect a manual configured URL by enabling the checkbox **Disallow Auto-Configuration for this URL**.

The configuration for protected URLs is shown in the Main Menu in bold letters.

**Note:** You should **invoke the Auto-Configuration after all declarations of variables have already been made**. **You can do this also just before generating the load test program**. You should save your recorded session once again in such a case (after generating the load test program).

Depending on if all URLs of a page are executed in serial order - or some of the URLs are executed in parallel, ZebraTester **measures the response time of a page in different ways**.

If **all URLs are executed in serial order** then the response time of a page is calculated as the simple sum of all response times of the URLs, without considering any internal overhead time between the executions of the URLs.

On the other hand, if **some of the URLs are executed in parallel**, then the response time of the page is measured as the time difference between the start of the page and the end of the page and includes also the internal overhead time:



***

## Executing a First Load Test <a href="#nextstepsafterrecordingawebsurfingsession-executingafirstloadtest" id="nextstepsafterrecordingawebsurfingsession-executingafirstloadtest"></a>

You can now execute a first try of the load test if your recorded Web surfing session **does not contain dynamically exchanged session parameters**. For this here only a short overview is shown.

First of all, you have to convert the recorded Web surfing session into a load test program. Normally, you should only have to enter the name of the load test program with an (optional) annotation or description of what the program does, without having to choose or modify any other options:



After that, the load test program can be started. It is recommended that you choose for the first test run only a few numbers of simulated users and short execution time:



&#x20;**Tip:** If your **load test fails** **and a permanent error occurs at the same URL** you should call the **Var Finder menu –** and verify if the handling for dynamically exchanged session parameters must be applied. Example below.



&#x20;**In these cases, we strongly rec**om**mend reading the installed ZT manual about Handling "Dynamically-Exchanged Session Parameters"** (Attached)

