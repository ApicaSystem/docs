# Editing ZebraTester Checks

## Check Information <a href="#editingzebratesterchecks-checkinformation" id="editingzebratesterchecks-checkinformation"></a>

### Scenario Class <a href="#editingzebratesterchecks-scenarioclass" id="editingzebratesterchecks-scenarioclass"></a>

The core of any ASM ZebraTester check is the ZebraTester script. Scripts can either be uploaded and compiled or specified by class or zip name:



Scripts can be uploaded to ASM and compiled via the “Upload Scenario” functionality in ASM:



When you create a ZebraTester script on your own machine, the ZebraTester application is responsible for compiling the script into a runnable .class or .zip file. When you upload a ZT script to ASM, the compilation is done purely by a component on the ASM backend.

To begin adding a ZebraTester scenario, click the green “plus” sign to the right of the “Scenario Class” dropdown. The “Add Scenario” dialog appears:



## Advanced Options <a href="#editingzebratesterchecks-advancedoptions" id="editingzebratesterchecks-advancedoptions"></a>

The Advanced Options governs the compilation behavior of the script:



### Compile with ZebraTester version <a href="#editingzebratesterchecks-compilewithzebratesterversion" id="editingzebratesterchecks-compilewithzebratesterversion"></a>

During recompilation, older version scenarios will be converted to the selected version. Scenarios are backwards but not forwards compatible. That is, scenario files with a higher version can than the selected compiler can not be compiled with that compiler. The compiled scenario will only be executable on a location that has a matching ZebraTester version installed.

#### Version Recommendations <a href="#editingzebratesterchecks-versionrecommendations" id="editingzebratesterchecks-versionrecommendations"></a>

Where possible, you should select the highest possible version.

| Versions      | Compiler |
| ------------- | -------- |
| 4.6-Z → 5.5-F | 5.5-F    |
| 5.4-I → 5.5-A | 5.5-A    |
| 5.1-D → 5.4-D | 5.4-I    |
| 4.6-Z → 5.1-C | 5.1-C    |

### Other Advanced Options <a href="#editingzebratesterchecks-otheradvancedoptions" id="editingzebratesterchecks-otheradvancedoptions"></a>

| tem                                                    | Description                                                                                                                                                                                                       | Comment                                                                                                                                                                                                                                                                                        |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|  Content Test                                          | Add extra verifications when compiling the scenario                                                                                                                                                               | <p><code>None</code> - Response content test disabled. No extra pattern verifications</p><p><code>Heuristic</code> - automatically detect and verify patterns in the received content</p><p><code>Size</code> - Compare received content size of all URLs against the recorded size (+-5%)</p> |
|  Content Filter                                        | Disable all URL filters except `no cached data (304)`                                                                                                                                                             | Settings in the `.prxdat` file are not affected                                                                                                                                                                                                                                                |
|  Error Filter                                          | Override the URL filter setting for `errors` and `cached data (304)`                                                                                                                                              | Settings in the `.prxdat` file are not affected                                                                                                                                                                                                                                                |
|  Page Think Time, sec                                  | The number of seconds an automated test user will wait (that is, “think”) before proceeding to execute the URLs on the page. A standard deviation percentage is available to add randomness to the think time     | Settings in the `.prxdat` file are not affected                                                                                                                                                                                                                                                |
|  Generate External Files for XML and SOAP Request Data | If the size of the file exceeds the file size specified, generate external files for XML and SOAP request data. This should not matter as long as you are only viewing results of the load test in the ASM portal | Available options include `Always`/`1024`/`2048`/`4096`/`8192`                                                                                                                                                                                                                                 |
| Strip the accept header                                | Remove the `accept` header                                                                                                                                                                                        |                                                                                                                                                                                                                                                                                                |
| Strip the referrer header                              | Remove the `referrer` header                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                |
| NTLM                                                   | Enable NTLM authentication. Check this option if you utilize NTLM authentication in your base ZebraTester script                                                                                                  | <p>When the NTLM option is enabled, further configuration of the authorization settings for NTLM is needed</p><h3 id="editingzebratesterchecks-view">View</h3><p></p>                                                                                                                          |

### Proxy <a href="#editingzebratesterchecks-proxy" id="editingzebratesterchecks-proxy"></a>

The Proxy options are supported on version V5.5-A and higher.



| Item                      | Description                                                                                | Comment                                                                                                                 |
| ------------------------- | ------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
|  HTTP Host                | Hostname or IP address of the proxy server                                                 | For unencrypted connections                                                                                             |
|  HTTP Port                | Port for the proxy server                                                                  | For unencrypted connections                                                                                             |
|  HTTP Cache Disabled      | Disable the internal HTTP cache. Load all resources fresh with every check run             |                                                                                                                         |
|  HTTPS Host               | Hostname or IP address of the proxy server                                                 | For encrypted connections                                                                                               |
|  HTTPS Port               | HTTPS IP port number of the proxy server (for encrypted connections)                       | For encrypted connections                                                                                               |
|  Auth Username            | Basic authentication username                                                              | Used for authentication to the [proxy ](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/4631837/P+Proxy)server |
|  Auth Password            | Basic authentication password                                                              | Used for authentication to the [proxy](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/4631837/P+Proxy) server |
|  No Proxy for Host/Domain | Comma-separated list of hosts or domain names for which you would like to bypass the proxy |                                                                                                                         |

## Advanced <a href="#editingzebratesterchecks-advanced" id="editingzebratesterchecks-advanced"></a>



### Collect Ticks <a href="#editingzebratesterchecks-collectticks" id="editingzebratesterchecks-collectticks"></a>

Check this box to collect extra data for each individual loop. The option is required if the test utilizes any looping; otherwise, no data about loops will be collected. When the box is ticked, there will be an option to click a link in the Check Result waterfall called “Ticks Details”:



When you click the “Ticks Details” link, you will be brought to a specific page:



There is a detailed URL history here. Users can see request and response headers for each past URL by clicking the “caret” dropdown to the right of the URL waterfall.

## Command Arguments <a href="#editingzebratesterchecks-commandarguments" id="editingzebratesterchecks-commandarguments"></a>

Within the “Command Arguments” section, it is possible to configure the ZebraTester check so that it functions as a small load test rather than a single loop, single user test.



| Item                            | Description                                                                                                                                                                                                                                                                                                                                                                               |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Concurrent Users                | <p>Just as it is possible to specify multiple concurrent users to ensure that the ZebraTester script will pass when multiple users attempt to run the script concurrently, it is possible to specify up to 20 concurrent users to run through the script using this field</p><p>If you change the number of Concurrent Users, the number of users will be shown in the Result Message</p> |
| Test Duration                   | A 15 second - 6 minute test duration is possible                                                                                                                                                                                                                                                                                                                                          |
| Request Timeout                 | A 10 second - 2 minute request timeout is possible                                                                                                                                                                                                                                                                                                                                        |
| Startup Delay per User          | Choose between a 1 and 200 ms startup delay                                                                                                                                                                                                                                                                                                                                               |
| Max Loops per User              | <p>Choose between 1 and 40 max loops per user. Or, select Unlimited loops if you would like the user to continue looping through the ZebraTester scenario until the “Test Duration” is complete. The default value is 1</p><p>If you change the default number of loops per user, the number of loops each user performed will be shown in the Result Message</p>                         |
| Statistics Sampling Interval    |                                                                                                                                                                                                                                                                                                                                                                                           |
| Max Error Snapshots per URL     |                                                                                                                                                                                                                                                                                                                                                                                           |
| Additional URL Sampling Options |                                                                                                                                                                                                                                                                                                                                                                                           |

## Verify Connection <a href="#editingzebratesterchecks-verifyconnection" id="editingzebratesterchecks-verifyconnection"></a>

It is possible to verify connection issues are not coming from the ASM agent itself using the Verify Connection options. Specifically, it is possible to verify Ping, Port, and DNS Servers using a ZebraTester check.

### Result Unit <a href="#editingzebratesterchecks-resultunit" id="editingzebratesterchecks-resultunit"></a>



The result unit specified here will be used in the Result Message of the check.
