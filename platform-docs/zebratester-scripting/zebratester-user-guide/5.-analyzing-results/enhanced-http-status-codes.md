# Enhanced HTTP Status Codes

In addition to the "normal" HTTP status codes (range from 100..599), the ZebraTester load test program generates some additional HTTP status codes in error situations that are not directly related to the HTTP protocol.

These additional HTTP status codes have **negative values**:

| **Enhanced HTTP Status Code** | **Meaning**                                                                                                                                                                                                                                                             |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 99                            | The initial value, the URL call, has never been executed.                                                                                                                                                                                                               |
| 98                            | An internal network error occurred at the client-side (load test resource problem). There are commonly not enough free TCP **client sockets** available on the Exec Agent. You have to tune the system parameters of the operating system on which the Exec Agent runs. |
| 97                            | A java.lang.OutOfMemoryError occurred. Memory problem in Exec Agent job - test data not valid.                                                                                                                                                                          |
| 11                            | The network connection to an outbound SSL proxy server has failed.                                                                                                                                                                                                      |
| 10                            | Unknown host. DNS problem or wrong hostname.                                                                                                                                                                                                                            |
| 9                             | Unable to open the network connection to the webserver (connection refused).                                                                                                                                                                                            |
| 8                             | The web server has first accepted but later closed/aborted the network connection - before all response data have been received (connection reset by peer).                                                                                                             |
| 7                             | The web server response violates the HTTP protocol - invalid protocol data have been received.                                                                                                                                                                          |
| 2                             | Request timeout expired - no response from the webserver. The load test program aborted the URL call.                                                                                                                                                                   |
| 1                             | Generic request error.                                                                                                                                                                                                                                                  |

If the HTTP response content was received in HTML format, the defective web page's content could be displayed in the web browser (without images) by clicking on **Display (Response) in Web Browser**. This web page is taken directly from the captured error snapshot's data; therefore, the defective web page can also be displayed even if the webserver is no longer reachable.

|   |   |
| - | - |

Next is the Error Log and **debug output of the current loop** (current web surfing session of a simulated user). This also contains information about extracted and assigned session variables, based on the Var Handler definitions:



Finally, **the activity of all users** at the time of the error is shown. The URL in which the error occurred is marked with pink background:

