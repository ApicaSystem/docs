# Creating / Running a Single Load Test

A test script accesses the Load Test target and performs a number of actions that you will measure. There are several ways to add these to ALT. In this chapter, we take a look at creating LoadTests in LoadTest Portal. The following video provides a visual overview of the load test creation process.



{% file src="../../.gitbook/assets/ALT demo.webm" %}

## Creating and Running a Load Test <a href="#creating-and-running-a-load-test" id="creating-and-running-a-load-test"></a>

To begin the process of creating a load test, navigate to the “Loadtest > New Test” page from the top menu bar within the ALT portal:

<div align="left"><figure><img src="../../.gitbook/assets/image (596).png" alt="" width="206"><figcaption></figcaption></figure></div>

When the “Create New Loadtest” page appears, a list of links will appear on the right side of the page. Click on any of the links to jump to that step in the scenario process.

<div align="left"><figure><img src="../../.gitbook/assets/image (595).png" alt="" width="197"><figcaption></figcaption></figure></div>

### Step 1: Select Subscription <a href="#step-1-select-subscription" id="step-1-select-subscription"></a>

Select a subscript to begin the load test creation process.

Every load test must be run using a valid subscription. A subscription is purchased when a customer pays for service. As the above screenshot shows, different subscriptions can be used for different purposes, although many customers will only have one subscription. The most common reason for multiple subscriptions is to allow for a subscription which accounts for “day to day” load tests with a smaller number of users, as well as a subscription with “burst days” which lasts for a much shorter period of time (e.g. two weeks) but allows for a much higher number of max users and/or a higher test duration. Each subscription displays the maximum number of users who are allowed to run a load test, the maximum duration of each load test which is run, the maximum number of tests which can be performed at one time, and the start and end time of the subscription.

The specific terms of a subscription are determined when the customer contract is signed. Most subscriptions allow for an unlimited maximum number of tests.

### Step 2: Select Script <a href="#step-2-select-script" id="step-2-select-script"></a>

When a subscription has been selected, select a script from which to build the Load Test:

<div align="left"><figure><img src="../../.gitbook/assets/image (597).png" alt="" width="375"><figcaption></figcaption></figure></div>

#### Use Existing Loadtest Script <a href="#use-existing-loadtest-script" id="use-existing-loadtest-script"></a>

Users have the option to select from a list of previously uploaded .class or .zip files when creating a load test.

#### Create New Loadtest Script <a href="#create-new-loadtest-script" id="create-new-loadtest-script"></a>

**Create a New URL Script**

The URL Script is a series of directly entered URL calls with some optional steps.

When the **Next** button is pressed, the entered URLs will be executed/validated and the option to proceed and generate the Loadtest script will be provided.

After that script is generated, it will appear as an existing .class file.

**Create a New Loadtest Selenium Script**

<div align="left"><figure><img src="../../.gitbook/assets/image (598).png" alt="" width="375"><figcaption></figcaption></figure></div>

It is possible to utilize an HTML-formatted Selenium IDE recorded session as the Load Test script. In the below screenshot, the file has already been uploaded and the user must click the Actions icon and wait until that HTML file has been run.

A Step 2 Page will appear for you to select any step options.

When the user selects **Next**, the Selenium script will be executed/validated and the option to proceed and generate the script will be provided. The results of the URL calls will be shown. It is possible to remove certain file extensions or domains which are unnecessary by entering a comma-separated list of extensions/domains and clicking the “Remove” button. For example, a user may wish to remove 3rd party URLs from their load test script or run the script without .png or .jpg images. Alternatively, it is possible to only keep certain domains within the script and remove all other domains by entering a comma-separated list of domains and clicking the “Keep” button.

When a user clicks the “Remove” or “Keep” buttons, the list of URLs in the table will update to reflect the extensions or domains which have been kept or removed.

**Upload a New ZebraTester Script**

To upload a new ZebraTester file, click the “ZebraTester” file icon:

<div align="left"><figure><img src="../../.gitbook/assets/image (599).png" alt="" width="375"><figcaption></figcaption></figure></div>

The **Upload Zebra File** dialog opens.

Upload a compatible .class or .zip file. Select an existing Project to assign the file to using the file dropdown, or select “Add Project” to create an entirely new Project. Select a script group or leave the script ungrouped. Add an optional file description and click the Save button.

### Step 3: Presets <a href="#step-3-presets" id="step-3-presets"></a>

If a user within your customer account has configured a Load Test, a Preset may already be defined with a number of users, a test duration, a defined location, etc. Configuration of the Loadtest Options, Location, and Test Information sections are mandatory; other configuration options are optional.

#### Loadtest Options <a href="#loadtest-options" id="loadtest-options"></a>

The following graph provides a visual explanation of the Loadtest Duration, Ramp Up Time, and Users within a test:

<div align="left"><figure><img src="../../.gitbook/assets/image (600).png" alt="" width="375"><figcaption></figcaption></figure></div>

It is possible to run several tests in sequential order (as opposed to running in parallel) by selecting “Run Multiple Sequential Tests”.

### Step 4: Location <a href="#step-4-location" id="step-4-location"></a>

Select the location from which to run the load test. A Cluster is a saved collection of one or more locations which a user can reuse when running load tests. A cluster must be defined when starting a load test, rather than one individual location, although a cluster can consist of only one test.

### Step 5: Scenario Options <a href="#step-5-scenario-options" id="step-5-scenario-options"></a>

Optional custom response time percentiles can be used to set specific percentiles for each page response time. The settings will be used when creating the test results and will be available on the test result page.

### Step 6: Advanced Options <a href="#step-6-advanced-options" id="step-6-advanced-options"></a>

The **Max Loops per User** field limits the number of web surfing session repetitions (loops) per simulated user. The load test stops if the limit has reached for each simulated user. This parameter can be combined with the parameter 'Load Test Duration'; the limitation which first occurs will stop the load test.

**Script pacing** is used to control the pace of script iterations (loops) over time. When the script reaches the end of an iteration (loop) the virtual user is inactive until the pacing time is reached. The result is a static flow of script iterations over time as long as the pacing time is set to a longer time than the script iteration time. The function is commonly used to control the requests per time ratio independent of response times. For example, a 30 second pacing gives one script iteration (loop) every 30 seconds.

The **Additional Options** field passes command line options to the load testing engine. If additional options are specified within a ZebraTester script which is being tested, do not reproduce those additional options here; otherwise duplicate fields may arise. The following\
\
`-multihomed` Initiates all Exec Agents to use multiple local IP addresses when executing a load test. This option allows users to simulate traffic from more than one IP address per Exec Agent. This option is only considered if the Exec Agent supports a multihomed network configuration (that is, several IP addresses are assigned to the same host). The first step in using this option is to configure multiple IP addresses for the same host on the level of the Windows or Unix operating system. The second step is to assign these IP addresses to the Exec Agent configuration. For the local host, where the Web Admin GUI is running, the second step can be performed by calling the Setup menu inside the Project Navigator (the “gear-wheel” icon at the top of the navigation). For remote Exec Agents, edit the file javaSetup.dat which is located inside the ZebraTester installation directory by modifying the value of the entry javaVirtualIpAddresses: enter all IP addresses of the host on the same line and separate them by comma characters. The effect of this option is that each concurrent user uses its own client IP address during the load test. If fewer IP addresses are available than concurrent users, the IP addresses are averaged across the users.\
\
`-sslcache <seconds>` Alters the timeout of the user-related SSL cache. The default value is 300 seconds. A value of 0 (zero) has the effect that the SSL cache is disabled.\
\
`-sslcreset` Reset the user-related SSL session cache per loop (default: no reset per loop).\
\
`-sslcmode` Apply SSL/HTTPS compatibility workarounds for deficient SSL servers. You may try this option if you get constantly the error type 'Network Connection aborted by Server' for all URL calls.\
\
`-tz <timezone>` Sets an alternative time zone which is used by the load test program. The default time zone is equal to the selection which has been made when installing ZebraTester, or - if modified subsequently - which has been set in the Personal Settings menu. Possible time zone values are described in chapter 6 of the Application Reference Manual.\
\


`-ssl <parameter>`

* All - Automatic detection of the SSL protocol version. ZebraTester prefers the TLS 1.2 protocol, but if this is not supported by the Web server, TLS 1.1, TLS 1.0 or SSL v3 is used. This is the normal behavior which is implemented in many Web browser products.
* v3 - Fixes the SSL protocol version to SSL v3.
* TLS - Fixes the SSL protocol version to TLS 1.0.
* TLS11 - Fixes the SSL protocol version to TLS 1.1.
* TLS12 - Fixes the SSL protocol version to TLS 1.2.

### Step 7: Client Options <a href="#step-7-client-options" id="step-7-client-options"></a>

Define a custom user agent and custom bandwidth speeds.

Configuration of **Client Side Monitoring** is optional.

### Step 8: DNS Options <a href="#step-8-dns-options" id="step-8-dns-options"></a>

Specifying a **DNS Hosts file** will allow the load test job to utilize its own DNS hosts file in order to resolve hostnames. If a Hosts file is used, the hosts file of the underlying operating system will be ignored. A DNS Hosts file must be zipped along with all other scenario input files. Specifying a **DNS Server** will allow a load test job to use one or more specific DNS server(s) in order to resolve hostnames. If a custom DNS server is specified, the DNS library of the underlying agent operating system will be ignored. Multiple values can be entered and separated by a comma.

Only IP addresses will be accepted in the DNS server field! DNS names are invalid.

Specifying a **DNS Translation file** will allow for a manual DNS remapping so an internal/non-production hostname can be mapped to a public hostname.

### Step 9: Reporting <a href="#step-9-reporting" id="step-9-reporting"></a>

Reporting is an optional feature. Reporting History defines a number of prior tests to compare the current report to. For example, a Reporting History of 10 will attempt to find a maximum of 10 load test jobs similar to the one being configured, and present a comparison of the configured job and the previous jobs in a report. The similarity is based on the script being run as well as the number of parallel users which is defined.

### Step 10: Test Information <a href="#step-10-test-information" id="step-10-test-information"></a>

Add the created script into a Project. Take the Test Instance and attach it to a new or existing Instance. Add comments and tags for more context and organization.

### Step 11: Monitoring Agents <a href="#step-11-monitoring-agents" id="step-11-monitoring-agents"></a>

If the **AppDynamics** integration has been configured within a user’s customer account, the user can select an AppDynamics server in this section which will gather additional Test metrics. There is a specific tab within the load test Results which displays AppDynamics data that is gathered using the integration. In the **Performance Monitoring Agents** section, a user can include a configured Performance Monitoring Agent as part of the test. The agents need to have been created and configured within the **Monitoring Agents** page before they can be added to a test.

A user can select single agents or an entire group with all agents at once.

### Steps 12 and 13: Execution and Start Loadtest <a href="#steps-12-and-13-execution-and-start-loadtest" id="steps-12-and-13-execution-and-start-loadtest"></a>

It is possible to specify a runtime and to save the current settings as a preset in the final steps. Click “Initiate Loadtest” to begin the test.
