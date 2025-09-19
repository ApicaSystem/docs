# Load Curve Diagrams

* [Overall Load Curves](broken-reference)
* [Response Time per Page](broken-reference)
* [Response Time per URL](broken-reference)
* [Errors (formerly Session Failures)](broken-reference)

To discover the web application’s maximum possible capability, you must run the same load test program several times, each time with a different number of users.

We recommend increasing the load in each successive test run logarithmically to get a good overview; for example, successive test runs with 1, 2, 5, 10, 20, 50, 100, 200, 500, 1000 .. users.

These test runs can be combined to produce load curves that will provide an excellent overview of the **response time behavior**, the **throughput**, and the **stability** of the web server or web application and how they vary depending on the number of users.



With small loads, the response times are constant and are independent of the number of users. If the load is increased, and thereby the maximum throughput of the server is reached (measured in URL calls per second, which is the web transaction rate - or also called hits per second), the response times will rise in an at least linear relationship with the number of users.

Web pages and/or URL calls, whose response times rise more strongly than others while under load, are potential tuning candidates; that is, the reason for the sudden, strong rise in their response times should be investigated.



Please note that not all web servers or web applications show a linear response time behavior if they are overloaded. A web server may collapse in this situation; in this case, the throughput falls after a specific load point has been exceeded.



To produce the load curves, you must select - from inside the **Analyze Load Tests** menu - several test runs made with the same load Test program but with a different number of users.

* Choose the diagram type **Load Curve.**
* Click the **Compare** button.



#### Overall Load Curves <a href="#loadcurvediagrams-overallloadcurves" id="loadcurvediagrams-overallloadcurves"></a>

In the right upper corner, inside the window's title, you can generate a **PDF report,** and you can also **export** the performance data.



You can click within the diagrams on the red rhombuses to display the corresponding test run's detailed results.

9 different diagrams are displayed:

| **Diagram**                               | **Description**                                                                                                                                  |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
|  Average Session Time per User - per Loop |  the cumulative time for a loop per user; that is, the server's response time behavior.                                                          |
|  Web Transaction Rate - Hits per Second   |  the number of successfully-executed URL calls per second (hits per second); that is, server throughput.                                         |
|  Session Failure Rate                     |  percentage of failed loops; that is server stability.                                                                                           |
|  Average TCP Socket Connect Time          |  average time per URL call to open a network connection; that is, network performance, combined with the TCP/IP stack performance of the server. |
|  Users Waiting for Response               |  average of the number of users who are waiting for a response from the server.                                                                  |
|  URL Error Rate                           |  percentage of failed URL calls.                                                                                                                 |
|  HTTP Keep-Alive Efficiency               |  percentage of reused network connections.                                                                                                       |
|  SSL Session Cache Efficiency             |  percentage of abbreviated SSL handshakes.                                                                                                       |
|  Completed Loops per Minute               |  the number of completed loops per minute (sessions per minute).                                                                                 |
|  Overall Network Throughput               |  total network throughput; that is, network load.                                                                                                |

#### Response Time per Page <a href="#loadcurvediagrams-responsetimeperpage" id="loadcurvediagrams-responsetimeperpage"></a>

This menu option displays all web pages' load curves (average response times and 90% percentile value of the response times). Again, you can click within the diagrams on the red rhombuses to display the corresponding test run's detailed results.



#### Response Time per URL <a href="#loadcurvediagrams-responsetimeperurl" id="loadcurvediagrams-responsetimeperurl"></a>

This menu option displays all URL calls' load curves (average response times and 90% percentile value of the response times). Again, you can click within the diagrams on the red rhombuses to display the corresponding test run's detailed results.



#### Errors (formerly Session Failures) <a href="#loadcurvediagrams-errors-formerlysessionfailures" id="loadcurvediagrams-errors-formerlysessionfailures"></a>

This menu option displays a summary of all errors which did occur in the test runs. By clicking on an error counter, the detailed results of the corresponding test run are shown.



\
