# Understanding ZebraTester Check Results

ASM provides a useful interface for interpreting the results of a ZebraTester check. Many of the returned metrics are self-explanatory.

## Result Message <a href="#understandingzebratestercheckresults-resultmessage" id="understandingzebratestercheckresults-resultmessage"></a>

The Result Message of a ZebraTester Check contains useful summarizing information. The following message is an example of a result message:

`4 pages, 213/1 passed/failed url calls, 11,6 urls/sec, session/total throughput: 363,1/346,6 KB/s.`

`4 pages` - Of course, pages organize Browser Check URL calls into logical functions (such as navigating to a certain page). The number of pages in the scenario can be altered using ZebraTester’s native [Page Break](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/148865739/6.+Execution+Control+-User-Defined+Transactions+And+Page+Breaks#Insert-Page-Break) functionality.

`213/1 passed/failed url calls` - 213 URL calls passed and 1 URL call returned an error message:



`11.6 urls/sec` - the number of URLs which loaded per second.

`session/total throughput: 363,1/346,6 KB/s` - metrics related to network throughput during the load test session.

## Metrics Section <a href="#understandingzebratestercheckresults-metricssection" id="understandingzebratestercheckresults-metricssection"></a>



The Metrics Section contains useful information regarding ZebraTester metrics.

`No. Request Roundtrips` is the number of requests which went out and returned a response.

`Response time` is the sum of the response time of all the objects that were loaded during the execution.

`Total Throughput` is a re-iteration of the total network throughput which is also reported in the check result message.

`Total Url/s` is the number of URLs which loaded per second - in this case, 11.6 URLs per second (or 11,6 per second using the European comma).

`Total loops` can be set within the Edit Check settings. Generally a check will only run with 1 total loop.

## Elapsed Time Per Page <a href="#understandingzebratestercheckresults-elapsedtimeperpage" id="understandingzebratestercheckresults-elapsedtimeperpage"></a>

This metric simply shows the time each page took to run all its URLs and each page’s percentage of the total run time of the scenario.

## 10 Slowest URLs <a href="#understandingzebratestercheckresults-10slowesturls" id="understandingzebratestercheckresults-10slowesturls"></a>

See [https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#10-Slowest-URLs](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#10-Slowest-URLs)

## Errors <a href="#understandingzebratestercheckresults-errors" id="understandingzebratestercheckresults-errors"></a>

See [https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Errors](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Errors)

## Waterfall <a href="#understandingzebratestercheckresults-waterfall" id="understandingzebratestercheckresults-waterfall"></a>

The following diagram explains the different metrics which are displayed in the waterfall for a ZebraTester Check result. These metrics, of course, are pulled from the ASM API.



| Number on Diagram | Metric Name              |
| ----------------- | ------------------------ |
| 1                 | URL Number               |
| 2                 | URL                      |
| 3                 | Header Name (Key)        |
| 4                 | Header Value             |
| 5                 | HTTP Status Code         |
| 6                 | HTTP Method              |
| 7                 | DNS lookup duration (ms) |
| 8                 | Connect duration (ms)    |
| 9                 | Send duration (ms)       |
| 10                | Wait duration (ms)       |
| 11                | Receive duration (ms)    |
| 12                | Elapsed Time             |
| 13                | Received Bytes           |

In the above diagram, the metric in the top right, 3 795 ms, refers to the “Step Duration” of the check - the total amount of time it took all URLs on the page to finish loading.
