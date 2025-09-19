# ZebraTester Overview

ZebraTester is developed based on HTTP/HTTPS protocol and Web Standards with the mission of supply a tool for technically challenging testing procedures in the area of web applications

1. Synthetic Monitoring for Advanced and Complex user journeys
2. Performance Testing
3. Mega tests -  Very High Load test with millions of virtual users with low ramp up time

Apica LoadTest and Synthetic Monitoring can use ZebraTester generated scripts for load testing and monitoring. The Engine for Load Testing and Monitoring is also part of the ZebraTester Tool.

&#x20;Its powerful GUI lets you create sophisticated, custom, load test/monitoring scripts easily and intuitively.

&#x20;All components are platform-agnostic across Windows, macOS, and Linux.

&#x20;You can use Apica ZebraTester standalone running in your infrastructure or with the Apica LoadTest Portal for the advanced team with continuous testing features.

<figure><img src="../../.gitbook/assets/image (632).png" alt=""><figcaption></figcaption></figure>

&#x20;

<figure><img src="../../.gitbook/assets/image (633).png" alt=""><figcaption></figcaption></figure>

## Graphical User Interface <a href="#graphical-user-interface" id="graphical-user-interface"></a>

<figure><img src="../../.gitbook/assets/image (634).png" alt=""><figcaption></figcaption></figure>

Apica ZebraTester contains a unique, powerful GUI which does not require you to learn any scripting language. In addition, no implementation of complicated regular expressions is required, even if you need to extract and assign user-specific dynamic session parameters or consider any other user-specific data such as authentication credentials.

The rich product features are directly accessible with a few mouse clicks from the high-performance, user-friendly graphical user interface. This eases and simplifies the workflow significantly to create realistic load tests.

* Automatic generation of custom load test scripts – based on your click-by-click GUI actions.
* Integrated wizards for extracting and assigning user-specific session parameters.
* Integrated support of input files containing user-specific data.
* Integrated support for user-specific execution control, response verification, and error actions.

## Web Standards Support <a href="#web-standards-support" id="web-standards-support"></a>

ZebraTester supports these Web Standards

| <ul><li>HTTP and HTTPS</li><li>CGI parameters</li><li><p>HTML forms</p><ul><li>HTML hyperlinks</li><li>HTML redirects</li></ul></li><li>J2EE URL Rewriting</li><li>AJAX Technology</li><li>JSON data</li><li>XML and SOAP data</li><li>WebDAV data</li><li>Google Protocol Buffers (Protobuf) data</li><li>Adobe Flex/AMF</li><li>GWT</li><li>WebSocket</li><li>HTTP/2</li><li>gRPC</li></ul> | <ul><li><p>HTTP Protocol Extensions</p><ul><li>Client-side caching of network connections (keep-alive),</li><li>Compressed request and response data (gzip, deflate)</li><li>Automatic session cookies processing</li><li>File Upload and Download</li><li>Outbound/cascaded HTTP(S) proxy server.</li></ul></li><li><p>SSL/TLS Protocol</p><ul><li>TLS 1.0, TLS 1.1, TLS 1.2 and TLS 1.3.</li><li>Configurable SSL/TLS session timeout</li><li>“Server Name Indication” (SNI)</li><li>Client certificates</li><li>Certificates from PKCS#11 Devices</li><li>TLS Session Tickets</li></ul></li><li>Parallel execution of HTTP(S) requests like web browsers.</li><li>DNS TTL and DNS round robin.</li></ul> |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

## Authentication Methods <a href="#authentication-methods" id="authentication-methods"></a>

* HTML Form-Based Login
* Basic Authentication
* Digest Authentication
* NTLM Authentication - supports CyberArk password vault for dynamically fetching passwords
* SSL Authentication using X509 Client Certificates in PKCS#12 format, DER or PEM encoded format
* SSL Authentication using Smart Cards and HSMS (PKCS#11 security devices)
* Kerberos with SPNEGO Authentication - supports CyberArk password vault for dynamically fetching passwords

Non-standardized authentication methods can be supported by developing your own “plug-ins.”

## Proxy Recorder <a href="#proxy-recorder" id="proxy-recorder"></a>

The universal HTTP(S) proxy recorder supports capturing any web traffic produced from any web browser or produced from any technical web client application running on any computer, smartphone, or tablet.

After capturing a recorded session, all of the captured data can be filtered, post-processed, and functionally enhanced using the powerful GUI.

The straight session can then be turned automatically into a ready-for-use load test script which can be executed directly as a customized load test.

## Test Features <a href="#test-features" id="test-features"></a>

* Configurable DNS servers, DNS cache, and DNS hosts file per executed load test
* Configurable SSL/TLS settings per executed load test
* Detailed real-time statistics
* See all error details in real-time: Error analysis can be performed during a running load test.
* Manually modify variable values and flow control in real-time
* Real-time comments
* Suspend and resume load test execution
* Manually increase and decrease the number of simulated users in real-time
* Conditional execution of web pages / URLs
* Simulate slow network connections
* Integrated scheduler
* Concurrent test execution: Run multiple load tests at one time on the same infrastructure
* Integrated overload detection of load generators
* Support of multiple TCP/IP addresses per load generator
* Clustering of load generators

## Test Measurement Features <a href="#test-measurement-features" id="test-measurement-features"></a>

* Sampling rates up to 100%
* Store the complete data from every test.
* Measures in-depth values for each HTTP(S) request
  * DNS resolve time
  * TCP/IP connect time
  * SSL handshake time
  * Request transmit time
  * Time to First Byte of the response header
  * Response header received time
  * Response content received time.
* Measures internal statistics inside DNS, TCP/IP, SSL, and HTTP layers.
  * Examples
    * DNS resolve rate
    * Abbreviated SSL handshake rate
    * HTTP Keep-Alive efficiency
    * Inner throughput diagram of each received HTTP content response.
* All measured errors contain snapshots of all of the current HTTP data
  * Request header
  * Request content
  * Response header
  * Response content.
* All measured errors also contain layer-specific context information
  * Outbound TCP/IP address
  * Outbound TCP/IP port
  * SSL session ID
  * The layer-specific execution step of the failed HTTP(S) request.
    * Example: If an empty web page is returned, you can see clearly if a network problem causes this or is caused by an overload of the stressed web server.
* Each measured error also contains a snapshot of
  * The actual values of all user-specific variables and a snapshot statistic about the activity of all other users at error time.
* The measurements can be complemented with additional statistics from Apica Inside Agents, which can collect real-time performance information from multiple in-house sources.
  * Operating systems (OS performance data)
  * Databases
  * Network
  * System management frameworks
    * NMP
    * ARM
    * APIs
  * Application management modules

### Test Automation <a href="#test-automation" id="test-automation"></a>

Automate both test creation (recording and post-processing of HTTP/S sessions) and even the test execution.

### Test Creation <a href="#test-creation" id="test-creation"></a>

Automate by calling the REST-API of the proxy recorder and by triggering the execution of self-developed “recorder plug-ins.”

### Test Execution <a href="#test-execution" id="test-execution"></a>

Automate by calling the “PrxJob” utility.

Up to 86 different commands can be used in a self-written shell or \*.bat scripts to start and synchronize load test executions.

## Clustering Load Generators <a href="#clustering-load-generators" id="clustering-load-generators"></a>

You can combine local, remote, or cloud-based load generators into clusters.

_**Almost infinitely scalable**_**&#x20;:** More than 300 load generators can be combined to form a single cluster.

* Each load generator can be a member of several clusters.
* Apica supports multiple locations AND mixed operating systems.
* Split user account credentials and X509 client certificates across cluster members.
* Easy to use and easy to operate.
* All measured data are merged into one single test result.

## Reporting Features <a href="#reporting-features" id="reporting-features"></a>

* Generate PDF reports from Load Test results.
* Comments can complement each report.
* Create your report templates with your corporate logos on the cover sheet.
* Up to 24 different diagrams and statistic types are available for reports.
* Compare the results of different test runs to verify the efficiency of any implemented tuning measures; also visualize the response time behavior and the stability of the stressed web application under different load conditions.

## Load Test Plug-ins <a href="#load-test-plug-ins" id="load-test-plug-ins"></a>

Extend the functionality during load test execution by creating custom load test plug-ins.

* Plug-in creation Wizard
* Some examples of added functionalities using custom load test plug-ins:
  * Perform real-time calculations during the execution of a load test (e.g., to support a proprietary challenge-response authentication algorithm).
  * Access external databases during the execution of a load test
  * Add additional, previously measured data to the load test result and present them as additional XY- diagrams in the GUI and PDF reports
  * Create your test-specific error conditions

Related Page: [ZebraTester Plug-in Handbooks](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/148865368)

## Context-Sensitive Help <a href="#context-sensitive-help" id="context-sensitive-help"></a>

All views provide context-specific help text, available using the **Help** button

### Open Context Help <a href="#open-context-help" id="open-context-help"></a>

<figure><img src="../../.gitbook/assets/image (635).png" alt=""><figcaption></figcaption></figure>

&#x20;

&#x20;

<figure><img src="../../.gitbook/assets/image (636).png" alt=""><figcaption></figcaption></figure>

Click the **help** button for contextual help from any page and a related page (in this example, a Generate Load Test Help Page) will pop-up.



&#x20;

&#x20;

\
\


&#x20;
