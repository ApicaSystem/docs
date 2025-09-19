# Ascent 2.1.0



Discover the latest advancements and improvements of the Apica Ascent platform. This is your go-to destination for updates on platform enhancements and new features. Explore what's new to optimize your observability and data management strategies.



***

## Data Fabric&#x20;

### Release v3.7 (February 11, 2023)

Welcome to the latest update of our product! We are excited to introduce several new features and improvements designed to enhance user experiences.

**Refined User Interface:**&#x20;

* Introduced a refined User Interface across the app, enhancing user experience on the following pages:&#x20;
  * Search&#x20;
  * Data explorer&#x20;
  * Topology&#x20;
  * Pipeline&#x20;
  * Dashboards&#x20;
  * Query/Report editor&#x20;
* Implemented dynamic quick date-time selection for granular control, empowering users to specify any date range they desire, not limited to predefined time ranges.&#x20;

**Infrastructure with Honeycomb View:**&#x20;

* This view offers users a bird's-eye view of all flow statuses on a single page.&#x20;
* Users can customize group-by options like namespace, application, and severity to analyze the flow status of the entire stack.&#x20;
* Flexible time range selection allows users to analyze their stack effectively.&#x20;

**Counter Widget in Explore Page**&#x20;

Added a new counter widget on the Explore page, enabling users to monitor ingested Trace volume across selected time ranges.&#x20;

**Query Snippets**&#x20;

Added Query Snippet templates, allowing users to create and insert query snippets from the settings page into the query editor using keyboard triggers/shortcuts.&#x20;

**ASM Plus**&#x20;

ASM Plus is a new offering enabling users to analyze their ASM synthetic check data in OpenTelemetry(OTel) format. Features include viewing check data as an Opentelemetry trace, page-level check execution details in a timeseries graph, check aggregator view with dynamic pivot table visualization, and check analysis view offering various visualizations like Waterfall chart, Flame graph, and Graph view.&#x20;

* View checks data as a Opentelemetry trace in ASM plus.&#x20;
* Check execution details (page level) view in a timeseries graph. Users can select different check attributes to analyze the check execution data.&#x20;
* Check aggregator view &#x20;
  * Provide a dynamic pivot table for visualizing the check data in different formats like Tabular, line chart, bar graph, etc. We have also added a feature where users can export their pivot table data in an excel format for further analysis.&#x20;
  * Provides a timeseries graph for various kinds of service names.&#x20;
* Check analysis view provides an option to view the check results data in the following visualizations:&#x20;
  * Waterfall chart&#x20;
  * Flamegraph
  * Graph view

**New Forwarder for ServiceNow ITOM Event Management Connectors API:**&#x20;

* Added a new forwarder to facilitate integration with ServiceNow ITOM Event Management Connectors API.&#x20;

**New Query Parameter Type - Duration List:**&#x20;

* Introduced a new Query parameter type called Duration list, enabling users to create a dropdown of relative time durations in templatized queries.&#x20;

**Improved Dashboard Widgets Visualization:**&#x20;

* Enhanced dashboard widgets visualization by smoothing the data for better presentation.

Thank you for choosing our product! We hope you enjoy these new features and improvements. Should you have any questions or feedback, please do not hesitate to contact us.



### Data Fabric Release v3.7.1 (March 11, 2024)

**Bug Fixes:**&#x20;

ALIVE Graph and Summary Fixes: Corrected issues where the "select-all" function wasn't applying across all pages in the ALIVE graph and the pattern index and y-axis didn't match in the summary table.&#x20;

ALIVE Page Navigation: The "psid log select-all" operation now correctly spans across all pages instead of just the current one.&#x20;

Browser Compatibility: Resolved a bug where the Check analysis view was breaking specifically in old Firefox browsers.&#x20;

UI and Display Fixes: Made improvements to various UI elements such as ensuring subject time intervals adhere strictly to different function screens and fixing issues with long horizontal content on the ALIVE summary page.&#x20;

Query and Data Handling: Handled edge cases where errors in results could lead to spans having no data.&#x20;

Performance and Functionality: Made improvements to several areas such as handling ingest ratelimiters more effectively, reducing open connections errors, and enhancing byte buffer pool performance.&#x20;

**Enhancements:**&#x20;

Dashboard Widget: Improved the overflow behavior for Alive Filter tags on the dashboard page for better visibility and usability.&#x20;

User Experience: Enhanced the Add widget dialog by fixing issues related to selecting visualization types and restricting multiple API calls while using the "Add tag" feature.&#x20;

**Other Improvements:**&#x20;

Performance Optimization: Made improvements to several backend processes, including moving from ReadAll to io.Copy for better performance and memory benefits.&#x20;

License Management: Fixed issues with licenses not syncing correctly and removed unknown fields from license display.&#x20;

Code Maintenance: Made updates to code repositories for better version parity and improved rules page images display.&#x20;

We're continuously working to enhance your experience with Apica Ascent Development, and we hope you find these updates valuable. If you have any questions or feedback, please don't hesitate to reach out to us. Thank you for choosing Apica!&#x20;



***

## Synthetic Monitoring <a href="#title-text" id="title-text"></a>

### ASM 13.24 Public Release Notes (2024-04-12) <a href="#title-text" id="title-text"></a>

#### User Story Enhancements <a href="#user-story-enhancements" id="user-story-enhancements"></a>

* Updated the [Compound Check](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2187264091) type to run on the latest infrastructure
* Added a new supported Selenium IDE command, [setLocation](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2135393876/Comparing+Selenium+IDE+Scripts+to+ASM+Scenarios#setLocation)
* Added missing attributes to the response bodies of the [/users](https://api-asm1.apica.io/v3/Help/Route/GET-users) and [/users/{user\_guid}](https://api-asm1.apica.io/v3/Help/Route/GET-users-user_guid) API GET request endpoints
* Added several new ASM commands to the ASM Manage Scenarios front end. See

for a complete list of supported Selenium IDE commands. Now, all of the commands listed in that article are available in the ASM Edit/Debug Scenarios page

#### Tasks <a href="#tasks" id="tasks"></a>

* ASM users now have the option to disable automatic page breaks when creating Browser checks:

<figure><img src="../../.gitbook/assets/ASM1.png" alt="" width="375"><figcaption></figcaption></figure>

#### Bug Fixes <a href="#bug-fixes" id="bug-fixes"></a>

* Fixed an issue in which checks were not correctly saved when an incorrect inclusion/exclusion period was used and the user was not notified of a reason. After the fix, users will be notified explicitly if their inclusion/exclusion period is incorrect.
* Fixed an issue which prevented custom DNS from being used on the latest infrastructure
* Fixed an issue which prevented an error message from being generated and displayed in the event that auto refresh fails to refresh a Dashboard.
* Fixed an issue which prevented [Power Users](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2133760724) who had limited editing permissions from saving checks. For instance, Power Users who could edit only the name, description, and tags of a check could not save the check after doing so. The bug fix resolved this issue.
* Fixed the following API call: [https://api-wpm.apicasystem.com/v3/Help/Route/GET-checks-proxysniffer-checkId-results-resultId-errorlog](https://api-wpm.apicasystem.com/v3/Help/Route/GET-checks-proxysniffer-checkId-results-resultId-errorlog) which was returning a 500 server error previously.
* Fixed an issue with certain checks which prevented Request & Response Headers from showing correctly within the Check Details page:

<figure><img src="../../.gitbook/assets/ASM2.png" alt="" width="375"><figcaption></figcaption></figure>

* Fixed an issue which prevented API calls from returning correct responses when a new user’s time zone was not set
* Fixed an issue which prevented spaces in between the “accepted codes” field for a URLv2 check:

<figure><img src="../../.gitbook/assets/ASM3.png" alt="" width="375"><figcaption></figcaption></figure>

* Updated API documentation for URL, URLv2 checks to include acceptable "secureProtocolVersion" values
* Fixed an issue with Ad Hoc report generation for certain users
* Fixed issues which prevented Command checks from being created or fetched via the ASM API.

#### Epic <a href="#epic" id="epic"></a>

* Disabled the option to select "Firefox" on browser checks
* Disabled location information in the API for deprecated checks
* Disabled old Chrome versions when creating a Chrome check
* Disabled location information in the API for deprecated Chrome versions
* Disabled deprecated check types from the "create new check"
* Disabled deprecated check types from the integration wizard
* Disabled API endpoint for URLv1 checks
* Disabled API endpoint for Command v1 checks
* Disabled deprecated check types from /checks/command-v2/categories
* Disabled deprecated browser version from /AnalyzeUrl
* Replaced Firefox with Chrome when creating an iPhone, iPad, or Android Check in New Check Guide
* Removed deprecated check versions as options from the Edit Scenario page
* Disabled AppDynamics check types from the integration wizard\


Read previous Release Notes, go to:\
[Knowledge Base](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2140241932/Release+Notes)



***





## Synthetic Monitoring On Premise

### On Premise ASM Patch 13H.4 Public Release Notes (2024-04-19) <a href="#title-text" id="title-text"></a>

#### User Story Enhancements <a href="#user-story-enhancements" id="user-story-enhancements"></a>

* Added the ability to add/edit “Accepted Codes”, “Port Number” and all “Secure Protocol Versions” for URLv1 checks via the ASM API. API documentation was updated to reflect the new functionality.
* Added SNI (Server Name Indication) support for URLv1 checks

#### Bug Fixes <a href="#bug-fixes" id="bug-fixes"></a>

* Fixed an issue which prevented Power Users with limited check editing permissions from saving checks after performing edits.\


Read previous Release Notes, go to:\
[Knowledge Base](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2140241932/Release+Notes)

***

## Advanced Scripting Engine

### Major Release V7.5-B (Installation Kit dated April 17, 2024)

ZebraTester 7.5-B release contains the following new features.

* Support for Color Blindness: To improve support for vision impairments and color blindness adaptation we have added new themes to the GUI configuration section.
* Ability to change request method from the ZT GUI: This gives the users the ability to change request method from the ZT GUI. Depending on the request method the Request body field will be enabled & visible or not.
* Support user agent details from a file: Provides an option in ZT personal settings GUI settings area, where user can upload a JSON file, which have all the latest User-Agents details.
* Updated Browser Agent List: All the current and latest browser agent list has been updated. • Option to Disable Page Breaks: Option to comment/disable a page break in the recorded session.
* Variables as Page Break Names: Users can use variables when setting my page-breaks names to make scripts more dynamic.
* Add OR condition for content type validation: Logical OR condition against content type validation can be tested by users.
* ZebraTester Controller Pull file (.wri): User will be able to pull files from the execagent that have been written by the feature "writetofile". For this the files need to be pulled to the controller as any other out/err/result file.
* WebSocket Extension (MS1):  WebSocket implementation capabilities of Zebra Tester, allowing users to conduct more comprehensive testing of WebSocket-based applications. A detailed how guide on how to use WebSocket extension is added in the documentation folder.

&#x20;\
In addition, Zebra Tester V7.5-B release contains the following bug fixes / improvements:

* Bug Fix for XML extractor giving 500 internal error in ZT scripts.
* .Har file conversion issue.
* Conflict when using variables as Mime Type validation.
* Zebra Tester -Auto assign Fix
* Fix for time zone lists, shows the java standard supported time zones without the deprecated ones.
* Detailed Replay logs in ZT (extended logs)
* ALPN Protocol Negotiation
* Page Break - Threshold Breach (Trigger & Abort)
* Library Update (Update JGit library): Updated the JGit library to the latest version to leverage new features and improvements.
* Fix issues with JavaScript editor in ZT.



***

## IRONdb

### Release Version 1.2.0

**NOTE: This release bumps the metric index version from 4 to 5. Upon restart, new indexes will be built and the old ones will be deleted. This process will use a significant amount of memory while the indexes are being rebuilt. It will also cause the first post-update boot to take longer than usual.**

* Update index version from 4 to 5.
* Automatically clean up old index versions on startup to make sure outdated indexes don't clog the disk.
* Fix Ubuntu 20.04 specific bug where nodes could crash when trying to clean up status files when rolling up raw shards.
* Fix issue with level indexes where data was being lost when deleting metrics on levels where the metric has multiple tags.
* Fix issue where level indexes were incorrectly reporting that levels existed when all underlying metrics had been removed.
* Add new API endpoints, `/compact_indexes` and `/invalidate_index_cache`, that allow forcing compaction and cache invalidation for specific accounts, respectively.
* Fix rollup bug where raw shards could be prematurely deleted if a rollup was aborted due to corruption.
* Fix various potential memory corruption issues.
* Fix issue where jlog journal data could get corrupted.
* [libmtev 2.7.1](https://github.com/circonus-labs/libmtev/blob/master/ChangeLog.md#271)
