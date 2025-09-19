# AppDynamics Integration

**Caveat**: each of the following integration directions was based on the UI when it was written. The UIs may change by the time you read this, so _UI updates are beyond the scope of these articles_. Please go to the integration target sites for their latest information on integration directions.

AppDynamics integration provides access to AppDynamics data via a dashboard containing AppDynamic metrics and allows you to compare check metrics against AppDynamics Business Transactions response times. You can also trigger and view AppDynamics Snapshots.

With the AppDynamics internal application metrics, you can correlate Synthetic Monitoring metrics with AppDynamics internal application metrics.



## Feature Overview <a href="#appdynamicsintegration-featureoverview" id="appdynamicsintegration-featureoverview"></a>

#### Introduction <a href="#appdynamicsintegration-introduction" id="appdynamicsintegration-introduction"></a>

AppDynamics is the leading provider of application performance management for modern application architectures. The integration of Synthetic Monitoring and AppDynamics delivers a complete performance monitoring solution.

**Benefits**

**Reduce mean time to resolution**

Pinpoint problems instantly, find the root cause in a matter of seconds, and troubleshoot issues faster than ever before.

**Understand the user journey**

Gain newfound insight into the end-user experience. Correlate browser, mobile, and API synthetic checks with your AppDynamics transactions in your Apica dashboard.

**Keep your data secure**

Have tight security requirements? We offer on-premise deployment so you can augment your AppDynamics data with secure internal synthetic checks.

Some sample views:

#### Integration Dashboard <a href="#appdynamicsintegration-integrationdashboard" id="appdynamicsintegration-integrationdashboard"></a>



#### Check Result <a href="#appdynamicsintegration-checkresult" id="appdynamicsintegration-checkresult"></a>



#### Integration Information Needed <a href="#appdynamicsintegration-integrationinformationneeded" id="appdynamicsintegration-integrationinformationneeded"></a>



#### Browser Check <a href="#appdynamicsintegration-browsercheck" id="appdynamicsintegration-browsercheck"></a>



## AppDynamics New Integration Process <a href="#appdynamicsintegration-appdynamicsnewintegrationprocess" id="appdynamicsintegration-appdynamicsnewintegrationprocess"></a>

## AppDynamics <a href="#appdynamicsintegration-appdynamics" id="appdynamicsintegration-appdynamics"></a>

This Section focuses on the New Integration + AppDynamics checks process, which uses a configured AppDynamics integration to provide AppDynamics application performance monitoring information.



**An Example AppD Integration Results View of an AppD Check:**



***

### The AppD Wizard <a href="#appdynamicsintegration-theappdwizard" id="appdynamicsintegration-theappdwizard"></a>

An AppDynamics check accesses AppDynamics data for application performance monitoring.

| **Step**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | **Screenshot**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <h4 id="appdynamicsintegration-step1-nameanddescription">Step 1: Name and Description</h4><p>In the first step, you can name the check and add a description.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| <h4 id="appdynamicsintegration-step2-commandandlocation">Step 2: Command and Location</h4><p>In the second step, you provide integration settings. This <strong>AppDynamics</strong> section contains Critical/Fundamental settings related to proper AppDynamics integration.</p><ul><li><strong>AppDynamics Base URL:</strong> the AppDynamics controller address.</li><li><strong>AppDynamics Account/Username:</strong> The user name for access to the controller.</li></ul>                                                                                                                                                                                           | <p></p><ul><li><strong>AppDynamics Password:</strong> Password for access to the controller.</li><li><strong>Application:</strong> Name of the application.</li><li><p><strong>AppDynamics Path:</strong> Full path to the metric you wish to use.</p><ul><li>Available metrics can be viewed in the AppDynamics Metric Browser.</li></ul></li><li><p><strong>Statistics:</strong> Type of data for the metric.</p><ul><li><code>Value/Maximum/Minimum</code></li></ul></li><li><strong>Interval (min):</strong> Time between data retrievals.</li><li><p><strong>Use Private Location:</strong> Internal location to run the test from.</p><ul><li>This will require allowing the IP.</li></ul></li></ul> |
| <h4 id="appdynamicsintegration-step3-options">Step 3: Options</h4><p>In the third step, you can configure</p><ul><li>how often the check is to run,</li><li>set threshold values for check notifications, and</li><li>add it to one or more <a href="https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS&#x26;title=Monitor%20Groups&#x26;linkCreation=true&#x26;fromPageId=4633308">Monitor Groups</a>.</li><li><strong>Polling Interval:</strong> The time between data retrieval.</li><li><strong>High Warning Threshold:</strong> Severity level Threshold calculation method and settings. A warning is triggered above this value.</li></ul> | <p></p><ul><li><strong>High Error Threshold:</strong> Severity level Threshold calculation method and settings. Error is triggered above this value.</li><li><strong>Low Warning Threshold:</strong> Severity level Threshold calculation method and settings. A warning is triggered below this value.</li><li><strong>Low Error Threshold:</strong> Severity level Threshold calculation method and settings. Error is triggered below this value.</li><li><strong>Monitor Groups:</strong> Monitor Groups for the check.</li></ul>                                                                                                                                                                      |
| <h4 id="appdynamicsintegration-step4-confirmation">Step 4: Confirmation</h4><p>The final step shows all configurations made and allows you to go back to revise the check or move forward and create it.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |

***

### AppD Configuration: <a href="#appdynamicsintegration-appdconfiguration" id="appdynamicsintegration-appdconfiguration"></a>

| **Step/Configuration**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | **Screenshot**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <h4 id="appdynamicsintegration-executionbehavior">Execution Behavior</h4><p>The <strong>Execution Behavior</strong> section defines how the check will be run.</p><ul><li><strong>Use Private Location:</strong> Internal location to run the test from.</li><li>This will require allowing the IP.</li><li><strong>Enable Failover:</strong> Use Failover for the check.</li><li><strong>Polling Interval:</strong> Time between data retrieval.</li><li><strong>Max Attempts:</strong> The number of attempts for the check run.</li><li>This setting applies to the primary location only, not any failover locations.</li><li><strong>Attempt Pause:</strong> The delay between attempts.</li></ul> | <p></p><h4 id="appdynamicsintegration-schedulingwhentorunchecks">Scheduling when to Run Checks</h4><p>In the <strong>Schedule</strong> section, you can define time periods where the check runs should deviate from the basic AppD Configuration: Execution Behavior settings.</p><ul><li><strong>Inclusion Periods:</strong> Time period(s) when the check will run at the defined frequency.</li><li><strong>Exclusion Periods:</strong> Time period(s) when the check will not run.</li></ul>                                                                                                                            |
| <h4 id="appdynamicsintegration-integrationinformation">Integration Information</h4><p>This section contains fundamental information about the check:</p><ul><li><strong>Name</strong> of the Check</li><li>Check <strong>Description</strong></li><li>Whether or not the Check is <strong>Enabled</strong></li></ul>                                                                                                                                                                                                                                                                                                                                                                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| <h4 id="appdynamicsintegration-monitorgroups">Monitor Groups</h4><p>In this section, selected and available <a href="http://confluence.teamsinspace.com:8090/display/ASMDOCS/Monitor+Groups">Monitor Groups</a> are shown.</p><p>Monitor groups are a way of organizing checks into manageable groupings or thematic units.</p><p>Monitoring groups are used in the Dashboard to organize checks in separate display widgets and lists and the Manage view to structure checks for a better overview.</p><p>You can have as many groups as you like, and any check can be a member of any number of groups.</p>                                                                                         | <p></p><h4 id="appdynamicsintegration-top-levelgroups">Top-Level Groups</h4><p>The <strong>Top-Level Group</strong>s are the primary organizing level. They can contain any number of <strong>Subgroup</strong>s.</p><h4 id="appdynamicsintegration-subgroups">Subgroups</h4><p>Subgroups provide a slightly more fine-grained organization and are placed inside Top-Level Groups.</p><p>Subgroups are at the lowest level and cannot contain other subgroups.</p><h4 id="appdynamicsintegration-access">Access</h4><p>Users can have access to monitor groups either as either a co-owner or as a user (non-co-owner).</p> |
| <h4 id="appdynamicsintegration-varioussettings">Various Settings</h4><p>This section contains additional, general configuration settings for the check.</p><ul><li><strong>Time Zone:</strong> Time zone to use when originating the check.</li><li><strong>Result Unit:</strong> Unit of measure to display for the check result.</li></ul>                                                                                                                                                                                                                                                                                                                                                            | <p></p><ul><li><strong>None:</strong> No unit.</li><li><strong>%:</strong> Percentage.</li><li><strong>b:</strong> Bytes.</li><li><strong>h:</strong> Hours.</li><li><strong>Mbit / s:</strong> Megabit / second.</li><li><strong>ms:</strong> Milliseconds.</li></ul>                                                                                                                                                                                                                                                                                                                                                       |
| <h4 id="appdynamicsintegration-settingthesla">Setting the SLA</h4><p>The <strong>SLA</strong> section allows you to defined the Service Level Agreement (SLA) target values for the check.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | <p></p><ul><li><strong>Target SLA %:</strong> The primary SLA target percentage.</li><li><strong>Target SLA % (2nd):</strong> Secondary SLA target percentage.</li></ul>                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| <h4 id="appdynamicsintegration-theappdtoolbar">The AppD Toolbar</h4><p>The toolbar provides access to the check result view and shows icons for location and check type.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| <h4 id="appdynamicsintegration-verifyconnection">Verify Connection</h4><p>In this section, you configure what hostnames to ping (and verify the site is up) after a failed check result.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | <p></p><ul><li><strong>Verify Ping:</strong> List of hostnames to Ping to after a failed result.</li></ul>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |

***

### Schedule Syntax <a href="#appdynamicsintegration-schedulesyntax" id="appdynamicsintegration-schedulesyntax"></a>

The periods are configured as semicolon-separated strings specifying the date and time ranges.

Syntax: `PERIOD [ ; PERIOD ]`

`PERIOD ::= ( WEEK-DAY-LIST | MONTH-DAY-LIST | DATE-LIST ) : TIME-RANGE WEEK-DAY-LIST ::= WEEK-DAY-SPEC [ , WEEK-DAY-LIST ]* WEEK-DAY-SPEC ::= ( WEEK-DAY | WEEK-DAY-RANGE ) WEEK-DAY-RANGE ::= WEEK-DAY - WEEK-DAY WEEK-DAY ::= ( mon | tue | wed | thu | fri | sat | sun ) MONTH-DAY-LIST ::= MONTH-DAY-SPEC [ , MONTH-DAY-LIST ]* MONTH-DAY-SPEC ::= ( MONTH-DAY | MONTH-DAY-RANGE ) MONTH-DAY-RANGE::= MONTH-DAY - MONTH-DAY MONTH-DAY ::= 0-31 (Note: Month day 0 means last day of month) DATE-LIST ::= DATE-SPEC [ , DATE-LIST ]* DATE-SPEC ::= ( DATE | DATE-RANGE ) DATE-RANGE ::= DATE - DATE DATE ::= [yy]yy-mm-dd TIME-RANGE ::= TIME-SPEC - TIME-SPEC TIME-SPEC ::= hh[:mm[:ss]]`

#### Example: <a href="#appdynamicsintegration-example" id="appdynamicsintegration-example"></a>

`mon-fri:21:30-22; sun:15-17; 0-1:12-18; 2018-04-01-2018-04-30:18-23`

| **Section**                    | **Description**                                             |
| ------------------------------ | ----------------------------------------------------------- |
|  `mon-fri:21:30-22`            |  Every Monday to Friday between 21:30 and 22:00.            |
|  `sun:15-17`                   | Sundays between 15:00 and 17:00.                            |
|  `0-1:12-18`                   |  The last and first day of each month, between noon and 18. |
|  `2018-04-01-2018-04-30:18-23` |  Between 18:00 and 23:00 on each day of April 2018.         |

**Note:** The `Semicolon;` separator is needed between periods, but not at the end.

***

## AppDynamics Setup <a href="#appdynamicsintegration-appdynamicssetup" id="appdynamicsintegration-appdynamicssetup"></a>

## Setup <a href="#appdynamicsintegration-setup" id="appdynamicsintegration-setup"></a>

The first time you open the integration view, you need to set the integration up, by adding (at least) one server.

#### AppDynamics Setup <a href="#appdynamicsintegration-appdynamicssetup.1" id="appdynamicsintegration-appdynamicssetup.1"></a>



#### Options <a href="#appdynamicsintegration-options" id="appdynamicsintegration-options"></a>

| **Item**            | **Description**                                                              |
| ------------------- | ---------------------------------------------------------------------------- |
| Account             | AppDynamics account.                                                         |
| Username            | AppDynamics username.                                                        |
| Password            | AppDynamics password.                                                        |
| Url                 | AppDynamics controller URL.                                                  |
| Default Application | AppDynamics application to use as the standard in checks.                    |
| Share Settings      | Make the server available to all users (required for use in browser checks). |

#### Buttons <a href="#appdynamicsintegration-buttons" id="appdynamicsintegration-buttons"></a>

| **Button** | **Action**       | **Description**                                                            |
| ---------- | ---------------- | -------------------------------------------------------------------------- |
|            | Get Applications | Populate the dropdown list with applications from the AppDynamics account. |
|            | Save             | Store the changes.                                                         |
|            | Cancel           | Stop editing and ignore all changes.                                       |

When the **AppDynamics Snapshots** option is enabled, a transaction snapshot provided by AppDynamics is included in check results.

**Where the Option is in the Edit Check View**



When selecting this option, this additional configuration also needs to be set:



| **Item**                     | **Description**                            |
| ---------------------------- | ------------------------------------------ |
| AppDynamics Server           | Address to the AppDynamics server.         |
| AppDynamics Application Name | Application name as set up in AppDynamics. |

For more information, see [Transaction Snapshots](https://docs.appdynamics.com/display/PRO45/Transaction+Snapshots) in the AppDynamics documentation.

## Add Server <a href="#appdynamicsintegration-addserver" id="appdynamicsintegration-addserver"></a>

#### Add Server <a href="#appdynamicsintegration-addserver.1" id="appdynamicsintegration-addserver.1"></a>

All the required settings to add a server can be configured from the dialog.

**AppDynamics Setup**

To add a server:



* Click **Add Server**

The Server settings dialog is shown



* Enter an account name



* Enter a user with access to the API



* Enter a password for the user



* Enter the URL for the server



* Click **Get Applications**



* Select the desired application from the dropdown menu.



* If you want all users in your account to share the same settings:
* Mark the **Share Settings** checkbox
* Click **Save**

## Data Collector <a href="#appdynamicsintegration-datacollector" id="appdynamicsintegration-datacollector"></a>

#### Data Collector <a href="#appdynamicsintegration-datacollector.1" id="appdynamicsintegration-datacollector.1"></a>

When creating browser checks using AppDynamics snapshots, you need to make sure that there is an appropriate Data Collector configured for the Application.

**HTTP Header**

When the AppDynamics integration is enabled in a browser check, all the requests sent for the check contain a HTTP Header named ApicaGUID, containing a GUID for the request.

This header can be discovered by AppDynamics to trigger snapshots.

**Create Data Collector**

To create a data collector:

* Log in to your AppDynamics account



* Select **Applications**
* Pick the relevant application&#x20;



* Select **Configure**



* To find the data collectors section, open the **>>** dropdown menu
* Select **Data Collectors**



* Expand the **HTTP Request Data Collectors** section



* Click **Add**



* Enter a collector **Name**
* If you want the collector to apply to all business transactions created later\*:\*
* Mark the \*\***Apply to new Business Transactions**\*\* checkbox
* Add `ApicaGUID` in the **Headers** box
* Click **Create HTTP Request Data Collector**

Next, you need to select which existing Business Transactions the collector should apply to:



* Select Business Transactions in the **NOT using this Data Collector** list&#x20;
* Click **Add**
* Click **Save**



AppDynamics is now activated to create a snapshot when Synthetic Monitoring checks are being executed against an AppDynamics-enabled website.

Summary information about snapshots can be viewed inside the details of a result:



Clicking the provided link **Open snapshot in AppDynamics** in the result details will take you to the snapshot in your AppDynamics dashboard:



In the snapshot view you can access all relevant ApDynamics features.

#### Edit Server <a href="#appdynamicsintegration-editserver" id="appdynamicsintegration-editserver"></a>

Existing server settings can be modifed by changing the server setup.

**Change Setup**

To change the settings for a server:



* Click **Setup**

The Server settings dialog is shown



* Click **Edit** for the server to change



* Change the settings as needed
* Click **Save**
* Click **Dashboard** to return to the dashboard

## AppDynamics Dashboard <a href="#appdynamicsintegration-appdynamicsdashboard" id="appdynamicsintegration-appdynamicsdashboard"></a>

An AppDynamics dashboard, featuring various AppDynamics metrics and graphs, is included in Synthetic Monitoring.

**View**



### Overview <a href="#appdynamicsintegration-overview" id="appdynamicsintegration-overview"></a>

#### Filter <a href="#appdynamicsintegration-filter" id="appdynamicsintegration-filter"></a>

The filter section lets you choose between servers and applications to show in the dashboard.

#### Table <a href="#appdynamicsintegration-table" id="appdynamicsintegration-table"></a>

The table(s) show the business transactions configured in the selected AppDynamics server.

## The AppDynamics Dashboard Charts <a href="#appdynamicsintegration-theappdynamicsdashboardcharts" id="appdynamicsintegration-theappdynamicsdashboardcharts"></a>

#### Charts <a href="#appdynamicsintegration-charts" id="appdynamicsintegration-charts"></a>

For each business transaction tier, a number of charts display AppDynamics performance data.

**View**



## The AppDynamics Dashboard Filter <a href="#appdynamicsintegration-theappdynamicsdashboardfilter" id="appdynamicsintegration-theappdynamicsdashboardfilter"></a>

#### Filter <a href="#appdynamicsintegration-filter.1" id="appdynamicsintegration-filter.1"></a>

The filter section lets you choose between servers and applications to show in the dashboard.

**View**



| Item        | Description                                                                                                                                                               |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Server      |  AppDynamics Controller address.                                                                                                                                          |
| Application |  AppDynamics Application.                                                                                                                                                 |
| **Setup**   | Configuration of [Edit Server](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=Edit%20Server\&linkCreation=true\&fromPageId=4631765). |
| Interval    | Duration of time to display in the dashboard.                                                                                                                             |
| **Refresh** | Update all data according to the selected interval.                                                                                                                       |

## The AppDynamics Dashboard Table <a href="#appdynamicsintegration-theappdynamicsdashboardtable" id="appdynamicsintegration-theappdynamicsdashboardtable"></a>

#### Table <a href="#appdynamicsintegration-table.1" id="appdynamicsintegration-table.1"></a>

The table(s) show the business transactions configured in the selected AppDynamics server.

**View**



## AppDynamics Results <a href="#appdynamicsintegration-appdynamicsresults" id="appdynamicsintegration-appdynamicsresults"></a>

## Results <a href="#appdynamicsintegration-results" id="appdynamicsintegration-results"></a>

With AppDynamic integration, you can include snapshots in the Check Results graph, with the option to drill down into AppDynamics reporting.



### Overview <a href="#appdynamicsintegration-overview.1" id="appdynamicsintegration-overview.1"></a>

Compare

Using the **Compare** feature, you can combine AppDynamics data with existing result charts.

#### Snapshots <a href="#appdynamicsintegration-snapshots" id="appdynamicsintegration-snapshots"></a>

Snapshots included in the results chart provide access to more detailed AppDynamics information.

## Results Compare <a href="#appdynamicsintegration-resultscompare" id="appdynamicsintegration-resultscompare"></a>

#### Compare <a href="#appdynamicsintegration-compare" id="appdynamicsintegration-compare"></a>

Using the **Compare** feature, you can combine AppDynamics data with existing result charts.

**View**



**Include AppDynamics data**

Start with the results chart for the desired check.



* Click **Compare**



* If you have several servers, choose one of them



* Choose an application



* Choose the business transaction to display



* Mark checkboxes if you want to include errors and/or normal snapshots
* Click **Apply**

The AppDynamics graph is displayed below the check graph.



## Results Snapshots <a href="#appdynamicsintegration-resultssnapshots" id="appdynamicsintegration-resultssnapshots"></a>

#### Snapshots <a href="#appdynamicsintegration-snapshots.1" id="appdynamicsintegration-snapshots.1"></a>

Snapshots included in the results chart provide access to more detailed AppDynamics information.

**Example**



The icons are clickable and provide access to the AppDynamics drill-down.

