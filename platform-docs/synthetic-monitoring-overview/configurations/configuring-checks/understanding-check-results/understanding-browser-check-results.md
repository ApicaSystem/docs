# Understanding Browser Check Results

The Browser Result Details view contains information about Browser check results in a number of charts, graphs and tables. Users can use the Check Result page to view information regarding which domains loaded during the check run, the slowest URLs which loaded, any errors which occurred during the check execution, and more.



## Result Message <a href="#understandingbrowsercheckresults-resultmessage" id="understandingbrowsercheckresults-resultmessage"></a>

The Result Message of a Browser Check contains useful summarizing information. The following message is an example of a result message:

`6 steps, 6 pages, 76 urls, 32902/857026 sent/received bytes`

`6 steps` - Obsolete data point. The number of steps will always equal the number of pages.

`6 pages` - Of course, pages organize Browser Check URL calls into logical functions (such as navigating to a certain page). The number of pages in the scenario can be altered using the custom command [insertPageBreak](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2135393876/Comparing+Selenium+IDE+Scripts+and+ASM+Scenarios#insertPageBreak).

`76 urls` - the number of URLs which were loaded throughout the entirety of the check.

`32902/857026 sent/received bytes` - the number of uncompressed bytes sent to and received by the web server throughout the duration of the scenario.

## Metrics Section <a href="#understandingbrowsercheckresults-metricssection" id="understandingbrowsercheckresults-metricssection"></a>



The Metrics Section contains useful information regarding browser metrics.

`Total browser render time` is the response time from the start of the navigation until the last request is completed.

`Total response time` is the sum of the response time of all the objects that were loaded during the execution. Total response time is calculated serially.

`Total page size` is the sum of the response sizes of all loaded objects in bytes.

`DOM content loaded` is the time it took for the check to reach the DOM content loaded event after navigation started.

`DOM complete` is the time it took for the check to reach the DOM complete event after navigation started.

`DNS lookup` is the time the check took to perform DNS lookup for the scenario.

Click on the arrows to the left and right of the metrics to access the previous and next Check Result.

## Domains <a href="#understandingbrowsercheckresults-domains" id="understandingbrowsercheckresults-domains"></a>

The Domains section displays a table containing the domains accessed in the check. For each, aggregated information regarding traffic volumes and percentage is shown.



| **Column** | **Description**                                                                                                                                                                                                                                                                                                                       |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Domain     | URL for the domain                                                                                                                                                                                                                                                                                                                    |
| Size       | Absolute traffic size and percentage of the total number of received bytes (as seen in the sent/received portion of the result message and the Metrics section). The percentage metric here refers to a percentage of the “Received Size” of the check - in the above screenshot, 824 KB is 98.4% of the “Received Size” of the check |
| Time       | Absolute traffic time and percentage of the time it took all pages to load. Note that this is different from the scenario runtime - in the above screenshot, 4 857 ms is 99.2% of 4895 ms, the total time it took all the scenarios to load                                                                                           |
| Count      | Number of urls and percentage                                                                                                                                                                                                                                                                                                         |
| Timeline   | Graphical representation of the transactions. Colored bars correspond to the timings indicated in the [Legend](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Legend)                                                                                                        |

## 10 Slowest URLs <a href="#understandingbrowsercheckresults-10slowesturls" id="understandingbrowsercheckresults-10slowesturls"></a>

The **Slowest URLs** table shows a list containing the urls with the slowest response times in the check:



| Column   | Description                                                                                                                                                                                                                    |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| #        | Order of access / order in scenario                                                                                                                                                                                            |
| Time     | Response time of the URL                                                                                                                                                                                                       |
|          | In this unnamed column, you will see an icon. Hover over the icon to see the type of the URL in question. Example types include `application/json` and `image/avif`                                                            |
| Url      | Accessed URL and the HTTP method used to request the URL                                                                                                                                                                       |
| Timeline | Graphical representation of the transactions. Colored bars correspond to the timings indicated in the [Legend](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Legend) |

### Slowest URL Legend <a href="#understandingbrowsercheckresults-slowesturllegend" id="understandingbrowsercheckresults-slowesturllegend"></a>

The Slowest URL Legend window is displayed when you point at a url in the table. It explains the colors used in the diagram, reveals information about the URL timing, and displays the Server IP address for the domain which is accessed:



This information can be very valuable when diagnosing timing issues with individual URLs within a scenario. See the [Legend](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Legend) for more information on DNS Lookup, Connection, SSL Handshake, etc.

## Errors <a href="#understandingbrowsercheckresults-errors" id="understandingbrowsercheckresults-errors"></a>

The Errors section displays errors encountered during the scenario run for the check, if any exist. For each page that has errors, a table is shown which reveals pertinent information about each error:



| **Column** | **Description**                                      | **Comment**                                                                                                                       |
| ---------- | ---------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| #          | ID number for accessed page                          |  The **Jump To URL** link lets you navigate to the URL in the waterfall where the error occurred                                  |
| HTTP Code  | Returned HTTP Status Code                            |                                                                                                                                   |
| Error      | Error message from the application, if any           |                                                                                                                                   |
| Time       | Elapsed time for the step where the error occurred   |                                                                                                                                   |
| Url        | Access HTTP Methods and URL where the error occurred |  When you click a particular URL in the table, detailed information regarding the response is shown                               |
| Request    | Outgoing request message                             |  The **Open** link in the **Request** column allows you to try to send the request manually                                       |
| Response   | Incoming response for the request                    |  In the above screenshot, no responses were returned and all columns contain the response “N/A”. That will not always be the case |
| MIME       | MIME Type for the response                           |                                                                                                                                   |
| Error log  | Log messages for the error                           |  In the above screenshot, no errors were logged; all columns contain the response “N/A”. That will not always be the case         |

The Jump To URL link lets you navigate to the URL in the [Waterfall](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#The-URL-Waterfall-Section) where the error occurred:



The Open link in the Request column allows you to try to send the request manually:



If the request can be sent, you will see data in the “Headers” section.

When you click a particular URL in the table, detailed information about the response is shown:



### A Note on Request Timeout <a href="#understandingbrowsercheckresults-anoteonrequesttimeout" id="understandingbrowsercheckresults-anoteonrequesttimeout"></a>

If a URL in your scenario does not return a response within X seconds after the DOM complete is sent, you will see an error informing you that the URL timed out:



The number of seconds which the check will wait for request resolutions after DOM complete can be configured in the [Edit Check](broken-reference) settings:



Altering the request activity timeout can help in situations where a certain URL is simply taking a long time to return a response. However, if the URL is not returning a response at all, the URL will fail regardless of the value you enter in the Request Activity Timeout input above.

## Screenshots <a href="#understandingbrowsercheckresults-screenshots" id="understandingbrowsercheckresults-screenshots"></a>

The Screenshots section displays any screenshots that were taken for the browser run [if the check is configured to take screenshots](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2167570435/Editing+Browser+Checks#Adding-Screenshots-and-Filmstrips-to-a-Check).



The screenshots are shown as a timeline with an indicator displaying when the image was taken. Click on an individual screenshot to see a full-screen version of the screenshot. Screenshots are taken at the [resolution defined in the Edit Check settings](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2167570435/Editing+Browser+Checks#Screen-Resolution).

Screenshots are inserted into a check at the following times:

-when a new page is loaded using the “open” command, “...andWait” commands (such as clickAndWait), and any other command which triggers a new page load within the scenario\
-if the check fails, at the step on which the failure occurs\
-when the “takeScreenshot” command is inserted by the author of the ASM Scenario which is attached to the script

Screenshots are NOT automatically taken when an “InsertPageBreak” command is utilized.

## The URL Waterfall Section <a href="#understandingbrowsercheckresults-theurlwaterfallsection" id="understandingbrowsercheckresults-theurlwaterfallsection"></a>

The following diagram explains the different metrics which are displayed in the waterfall for a Browser Check result. These metrics are pulled from the ASM API. If you hover over a URL in the waterfall, detailed information about the URL is shown:



Clicking on the dropdown caret to the right of the URL will reveal information about the size and load time of past URL runs, as well as Request and Response header information [if “store Request/Response Headers” is enabled in the Edit Check settings](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2167570435/Editing+Browser+Checks#Browser-Data):



### Page Breaks in a Browser Check Result <a href="#understandingbrowsercheckresults-pagebreaksinabrowsercheckresult" id="understandingbrowsercheckresults-pagebreaksinabrowsercheckresult"></a>

Page breaks fulfill the need to separate different pages, typically consisting of multiple URL calls, from each other. They are used to organize the set of HTML pages into a single group before the next logical page navigation.

Page breaks are inserted into a browser check result whenever a new page load is triggered during a user journey. Specifically, a new page load is triggered when the “Open” command, the “[insertPageBreak](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2135393876/Comparing+Selenium+IDE+Scripts+to+ASM+Scenarios#insertPageBreak)” command, and any of the “…andWait” commands (e.g. clickAndWait) are used.

Page breaks are automatically generated and inserted by default. However, there is an option to disable automatic page breaks in the [Edit Check section](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2167570435/Editing+Browser+Checks#Disable-Automatic-Page-Breaks). Page breaks can also be entered manually into scripts via use of the [insertPageBreak scenario command](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2135393876/Comparing+Selenium+IDE+Scripts+to+ASM+Scenarios#insertPageBreak)

### Waterfall Metrics <a href="#understandingbrowsercheckresults-waterfallmetrics" id="understandingbrowsercheckresults-waterfallmetrics"></a>



| Number on Diagram | Metric Name              | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ----------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1                 | Step Nr                  | The Step (sometimes Page) number                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 2                 | URL number               | The identifier of a URL inside of a Step. This is a counter that is unique per Step and corresponds to a URL inside of the Step                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 3                 | URL                      | The complete URL including protocol, hostname, path and query parameters                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| 4                 | HTTP method              | The HTTP method used (e.g. GET, POST, PUT)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| 5                 | HTTP status code         | The returned status code from the server (200, 302, 500, etc.)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 6                 | URL Offset ms            | The time offset in milliseconds from when the URL was initiated by the browser relative to the first URL on the Step                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 7                 | Blocked duration ms      | The time the URL is blocked (aka Queued By Browser) inside of the browser before it is executed                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 8                 | DNS lookup duration ms   | The time it took to perform a DNS lookup/query and receive the result back                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| 9                 | Connect duration ms      | The time it took to establish a connection to the target system                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 10                | Send duration ms         | The time it took to send the request from the browser                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| 11                | Wait duration ms         | The time it took for the target system to return the first response (that is, the Response Headers)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| 12                | Receive duration ms      | The time it took for the complete response to be returned from the target system, including headers and content                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 13                | Response time ms         | The total network response time for this URL (`DNS Lookup + Connect + Send + Wait + Receive`)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| 14                | Received bytes           | The number of uncompressed bytes received from the server                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 15                | Content mime type        | MIME type of the response content                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 16                | Blocked url offset ms    | A timestamp indicating the offset of the Blocked timing relative from when the URL was started                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 17                | DNS lookup URL offset ms | A timestamp indicating the offset of the DNS Lookup timing relative from when the URL was started                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 18                | Connect URL offset ms    | A timestamp indicating the offset of the Connect timing relative from when the URL was started                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 19                | Send URL offset ms       | A timestamp indicating the offset of the Send timing relative from when the URL was started                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 20                | Wait offset ms           | A timestamp indicating the offset of the Wait timing relative from when the URL was started                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 21                | Receive URL offset ms    | A timestamp indicating the offset of the Receive timing relative from when the URL was started                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 22                | Step duration ms         | <p>The total amount of time it took all URLs on the page to finish loading. In the following example, the “Step duration” of the page is 6,030ms:</p><p></p><p>As you can see here, the final URL in the waterfall for this page finished loading between 6 and 7 seconds, roughly matching the 6,030ms reported as the “Step duration”:</p><p></p><p>For further confirmation, if you hover over the final URL and add the metrics together, you will find the sum of the metrics equals the Step duration:</p><p></p><p><code>5458 (offset) + 560 (DNS Lookup) + 1 (Connecting) + 6 (SSL Handshake) + 2 (Waiting for Response) + Receiving Data (3) = 6030ms</code></p> |

When the check records Websockets, you can get a detailed view of the recorded data by expanding the relevant result Waterfall row.

## Legend <a href="#understandingbrowsercheckresults-legend" id="understandingbrowsercheckresults-legend"></a>

The Legend section at the bottom of a Browser Check Result page displays the color coding which is used to identify different URL operations for each URL in the result. Hover over the “question mark” icons to learn more about how ASM defines DOM Interactive, DOM Content Loaded, and DOM Complete:



| **Item**             | **Description**                                                                                                                                                                                                                                                                                                          |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Queued by Browser    | Time spent in the browser before executing DNS Lookup or Connect.                                                                                                                                                                                                                                                        |
| DNS Lookup           | Time for DNS query and receive the response.                                                                                                                                                                                                                                                                             |
| Connecting           | Time to establish a connection.                                                                                                                                                                                                                                                                                          |
| Sending Request      | Outgoing request message processing.                                                                                                                                                                                                                                                                                     |
| Waiting for Response | The time it took for the target system to return the first response which is the Response Headers.                                                                                                                                                                                                                       |
| Receiving Data       | Time to complete the response from the URL/method.                                                                                                                                                                                                                                                                       |
| DOM Content Loaded   | DOM Content Loaded point. The render tree can be constructed: the DOM is ready and there are no stylesheets blocking JavaScript execution. This measure calculates duration between the `EventStart` and `EventEnd` timestamps, to allow for JavaScript frameworks waiting DOM Content Loaded before starting execution. |
| DOM Complete         | DOM Complete point. The DOM Complete point is when the resource loading and processing is complete.                                                                                                                                                                                                                      |

## History Information <a href="#understandingbrowsercheckresults-historyinformation" id="understandingbrowsercheckresults-historyinformation"></a>

The History Information table shows information about the check run. If the check has been purged, only the most basic information regarding the check run will be available:



| **Item**     | **Description**                                                                              |
| ------------ | -------------------------------------------------------------------------------------------- |
| Severity     | Check status Severity                                                                        |
| Time         | The timestamp for the check run                                                              |
| Elapsed (ms) | Duration of the test                                                                         |
| Attempts     | The number of connection attempts                                                            |
| Result Code  | Returned HTTP Status Code                                                                    |
| Message      | If a result message is available (for example, a failure message), it will be displayed here |
