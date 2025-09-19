# ZebraTester User Guide

* Overview
  * Getting Started With ZebraTester
    * Menu and Navigation Overview
    * Recording Web Surfing Sessions with ZebraTester
    * Recording - Additional information
    * Processing Recording
    * Inner Loops
    * Session Parameters
    * Generate Program
    * Executing Load Test Programs
    * Analyzing Results
    * Context Help
    * Analyzing Results
    * Distributed Load Tests
    * Multiple Client IP Addresses
    * Page Scanner
    * Web Tools
    * Modifying Programs
    * Direct Access to Measured Data

## Overview <a href="#overview" id="overview"></a>

### Getting Started With ZebraTester <a href="#getting-started-with-zebratester" id="getting-started-with-zebratester"></a>

| **Get a Load Test Session**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | **Enhance the Load Test Session**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | **Execute the Load Test**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <p><strong>There are several ways to get a Load Test Session:</strong></p><ul><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620852">Record a Session</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/146210870">Import a HAR File</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/142082078">Import a Load Runner Script</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/107380972/Session+Cutter#Importing-Web-Surfing-Sessions-from-External-Definition-Files">Load a Definition File</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/147619863">Enter URL Calls Manually</a></li></ul> | <p> <strong>Load Test Sessions can be enhanced with:</strong></p><ul><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/28147864/Dynamic+Session+Parameters+Var+Handler">Dynamically Exchanged Session Parameters</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/28147864/Dynamic+Session+Parameters+Var+Handler#Input-Files">Input Files</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/28147864/Dynamic+Session+Parameters+Var+Handler#User-Input-Fields">User Input Fields</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620846/Next+Steps+after+Recording+a+Web+Surfing+Session#Reviewing-the-Automatically-Applied-Content-Test">Response Verification</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620850/Inner+Loops">Inner Loops / URL Loops / Conditional Execution</a></li><li>User-Defined Transactions</li><li>Inline Scripts</li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/148865368/ZebraTester+Plug-in+Handbooks#%22Load-Test-Plug-In%22-Developer-Handbook">Load Test Plug-Ins</a></li></ul> | <p><strong>There are Powerful Features for Executing Load Tests:</strong></p><ul><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620870/Generate+HTTP+S+Load+Test+Program">Generating and Starting the Load Test</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/28344346">Load Test Input Parameters</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/150405377">Real-Time Error Analysis</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/150405366">Real-Time Actions</a></li><li><a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/150405388">Acquiring the Load Test Result</a></li></ul><p> <strong>Load Tests can be executed on Multiple Platforms:</strong></p><ul><li><a href="https://apica-kb.atlassian.net/wiki/spaces/ALTDOCS/pages/5672100">Using the Apica LoadTest Portal</a></li><li>Installing and Defining <a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620509">Additional Load Generators</a> and <a href="https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620499/Clusters">Clusters</a></li></ul> |

#### [Menu and Navigation Overview](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620858) <a href="#menu-and-navigation-overview" id="menu-and-navigation-overview"></a>

The ZebraTester menu structure is somewhat different from other applications. Menu options are always context-sensitive; that is, only options relevant to the current operation are displayed. Also, there is no "main menu" or "main application window" (even though one of the menus has the title "Main Menu").

#### [Recording Web Surfing Sessions with ZebraTester](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620852/Recording+Web+Surfing+Sessions+with+Zebra+Tester) <a href="#recording-web-surfing-sessions-with-zebratester" id="recording-web-surfing-sessions-with-zebratester"></a>

Recording a Web-surfing session is supported by using _any_ web browser, like Internet Explorer, Google Chrome, or Safari.

You can use also ZebraTester in either Firefox or Chrome without installing their respective [Apica Recorder Extensions](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620878/Download+the+Extension).

However, without either [Firefox or Chrome browser ](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620878/Download+the+Extension)extension, you must reconfigure your Web browser before you will be able to record a Web-surfing session. This is described in the Installation Guide, Chapter 3:

#### [Recording - Additional information](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620854/Recording+-+Additional+information) <a href="#recording-additional-information" id="recording-additional-information"></a>

Recording can also be done on web surfing sessions of client programs.

#### [Processing Recording](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620846/Processing+Recording) <a href="#processing-recording" id="processing-recording"></a>

After recording a web session, a number of further steps should be performed.

The **Session Cutter Menu** allows combining one or more web surfing sessions to form a new session, similar to splicing motion picture films together to create a complete movie.

#### [Inner Loops](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620850/Inner+Loops) <a href="#inner-loops" id="inner-loops"></a>

It is possible to define “inner loops” which include only some web pages of a recorded web surfing session.

#### [Session Parameters](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620872/Session+Parameters) <a href="#session-parameters" id="session-parameters"></a>

After a web surfing session has been recorded, the load test program can be generated.

#### [Generate Program](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620870/Generate+Program) <a href="#generate-program" id="generate-program"></a>

Only URLs that are visible in the main menu are used by the load test program. This means that you can use the **URL filter** to exclude certain types of URLs from being executed by the load test program.

#### [Executing Load Test Programs](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/28344346) <a href="#executing-load-test-programs" id="executing-load-test-programs"></a>

After the load test program has been called by the Project Navigator, you must enter the test input parameters for the test run (a single execution of the load test program is also called “test run”).

#### [Analyzing Results](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620465/Analyzing+Results) <a href="#analyzing-results" id="analyzing-results"></a>

Measurement results can be analyzed using the **Analyze Load Tests** menu, into which the statistics result files can be loaded.

#### [Context Help](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620866/Context+Help) <a href="#context-help" id="context-help"></a>

All views provide context-specific help text, available using the **Help** button

#### [Analyzing Results](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620465/Analyzing+Results) <a href="#analyzing-results.1" id="analyzing-results.1"></a>

Measurement results can be analyzed using the **Analyze Load Tests** menu, into which the statistics result files can be loaded.

#### [Distributed Load Tests](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620507) <a href="#distributed-load-tests" id="distributed-load-tests"></a>

Load tests can also be transmitted and started on **remote computers**. Similarly, a “single” load test can be divided up and run on several computers, in which case the load-releasing computers are combined into a "virtual" **application cluster**.

#### [Multiple Client IP Addresses](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620501) <a href="#multiple-client-ip-addresses" id="multiple-client-ip-addresses"></a>

Optionally, you may want an Exec Agent to use multiple client IP addresses during the load test in order to simulate users from different network locations.

#### [Page Scanner](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620495) <a href="#page-scanner" id="page-scanner"></a>

&#x20;Zebra Tester's Page Scanner function browses and explores web pages of a web server automatically in a recursive way - similar to a Web Spider or a Web Crawler

#### [Web Tools](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620529) <a href="#web-tools" id="web-tools"></a>

The Web tools menu can be invoked from the main menu and contains **four small utilities** which can be useful to examine the data exchanged between the web browser and the webserver.

#### [Modifying Programs](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620531/Modifying+Programs) <a href="#modifying-programs" id="modifying-programs"></a>

ZebraTester follows the philosophy that almost all functions can be done by using the GUI, without requiring programming knowledge. Nevertheless, it is also possible to modify the automatically-generated load test programs manually. You can freely modify the program on this "second-level" according to your needs; however, you should remember that the modifications are not protected from being overwritten when the load test program is generated again. You should be sure that you have already made all Var Handler definitions, such as defining Input Files and User Input Fields, before you start modifying the program code.

#### [Direct Access to Measured Data](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620533/Direct+Access+to+Measured+Data) <a href="#direct-access-to-measured-data" id="direct-access-to-measured-data"></a>

The ZebraTester Java API also contains classes and methods which allow direct access to all measured values stored within a statistics result file of a load test run (.prxres file).
