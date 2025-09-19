# Understanding the ASM Imported Dashboards

When Apica Panels is enabled for your account, you will see a number of custom dashboards which can be customized as needed to fulfill your business needs. These links take you directly to the GitHub Dashboards documentation for the Grafana Plugin:

* Dashboards
* **Tag Level Dashboards**
  * Apica Tags SLA
  * Apica Drill Down Checks Aggregate with Tags
  * Apica Check Summary
  * Apica Tags Geo Map
  * Apica Check Summary Status with Tags
  * Apica Tags Events Insight
* **Group Level Dashboards**
  * Apica Groups SLA
  * Apica GeoMap Groups
* **Account Level Dashboards**
  * Apica Account Events Insight
  * Apica Checks Summary Table
* Sample Business Dashboard
* You can also refer to the Readme for further details on using Template Variables, Ad Hoc filter, Query Editor options, and more:



### [Apica Tags SLA](https://apicasystem.github.io/apica-grafana/#apica-tags-sla) <a href="#understandingtheasmimporteddashboards-apicatagssla" id="understandingtheasmimporteddashboards-apicatagssla"></a>

This dynamic dashboard shows aggregate SLA by selected tags from the dropdown list.

* Allows the team to customize the dashboard to view related tags or focus on business-critical checks.
* Drill down on the impacted tag SLA to view checks details associated with the selected tag
* Show custom events associated with the selected tags
* Drill down to the check summary dashboard
* Group by selected tag key
* Use the ad hoc filter to filter results using a specific tag value



### [Apica Drill Down Checks Aggregate with Tags](https://apicasystem.github.io/apica-grafana/#apica-drill-down-checks-aggregate-with-tags) <a href="#understandingtheasmimporteddashboards-apicadrilldownchecksaggregatewithtags" id="understandingtheasmimporteddashboards-apicadrilldownchecksaggregatewithtags"></a>

Dynamic dashboard to show aggregate SLA for selected checks

* The dashboard can be filtered by tags and checks
* Show custom event associated with selected check
* This dashboard is used as a drill-down dashboard from the Apica Tags SLA.
* Drilldown into Apica Check Summary by clicking on the Check SLA widget

### [Apica Check Summary](https://apicasystem.github.io/apica-grafana/#apica-check-summary) <a href="#understandingtheasmimporteddashboards-apicachecksummary" id="understandingtheasmimporteddashboards-apicachecksummary"></a>

Dynamic dashboard to show health status and critical KPIs for selected check(s) from the dropdown list

* The dashboard can be filtered by tags and checks
* Show custom event associated with selected check
* Show Annotation in the charts based on custom events
* Dynamic Drill down into Check Details in the Apica System



### [Apica Tags Geo Map](https://apicasystem.github.io/apica-grafana/#apica-tags-geo-map) <a href="#understandingtheasmimporteddashboards-apicatagsgeomap" id="understandingtheasmimporteddashboards-apicatagsgeomap"></a>

View the check's health status by geo location for a selected tag

* Drill down into Apica systems to check details
* Summary of check types for the selected tag



### [Apica Check Summary Status with Tags](https://apicasystem.github.io/apica-grafana/#apica-check-summary-status-with-tags) <a href="#understandingtheasmimporteddashboards-apicachecksummarystatuswithtags" id="understandingtheasmimporteddashboards-apicachecksummarystatuswithtags"></a>

View multiple checks summary health status for a selected tag



### [Apica Tags Events Insight](https://apicasystem.github.io/apica-grafana/#apica-tags-events-insight) <a href="#understandingtheasmimporteddashboards-apicatagseventsinsight" id="understandingtheasmimporteddashboards-apicatagseventsinsight"></a>

Analyze all events triggered in your Apica system at a selected time for the selected tag

* Filter the data based on a given tag filter
* Identify the noise source in the events, like the checks triggering most of the events. Understanding the noise source will lead to better tuning and quality monitoring.



### [Apica Groups SLA](https://apicasystem.github.io/apica-grafana/#apica-groups-sla) <a href="#understandingtheasmimporteddashboards-apicagroupssla" id="understandingtheasmimporteddashboards-apicagroupssla"></a>

Dynamic dashboard to show group Checks SLA

* Show Aggregated SLA at the Group Level
* Show individual checks Aggregated SLA
* You can exclude specific checks from the SLA calculation



### [Apica GeoMap Groups](https://apicasystem.github.io/apica-grafana/#apica-geomap-groups) <a href="#understandingtheasmimporteddashboards-apicageomapgroups" id="understandingtheasmimporteddashboards-apicageomapgroups"></a>

Dynamic dashboard to show group checks based on geo location



### [Apica Account Events Insight](https://apicasystem.github.io/apica-grafana/#apica-account-events-insight) <a href="#understandingtheasmimporteddashboards-apicaaccounteventsinsight" id="understandingtheasmimporteddashboards-apicaaccounteventsinsight"></a>

Analyze all events triggered in your Apica system in a selected time

* This dashboard is at the account level
* Identify the noise source in the events, like the checks triggering most of the events. Understanding the noise will lead to better tuning and quality monitoring.



### [Apica Checks Summary Table](https://apicasystem.github.io/apica-grafana/#apica-checks-summary-table) <a href="#understandingtheasmimporteddashboards-apicacheckssummarytable" id="understandingtheasmimporteddashboards-apicacheckssummarytable"></a>

View the account's check summary health status in a table format at the account level



### [Sample Business Dashboard](https://apicasystem.github.io/apica-grafana/#sample-business-dashboard) <a href="#understandingtheasmimporteddashboards-samplebusinessdashboard" id="understandingtheasmimporteddashboards-samplebusinessdashboard"></a>

Sample dashboard to demonstrate business impact by using Apica System

* This dashboard is static, so you will need to adjust and customize it for your environment
* This dashboard is to be used as a template



## [Template Variables](https://apicasystem.github.io/apica-grafana/#template-variables) <a href="#understandingtheasmimporteddashboards-templatevariables" id="understandingtheasmimporteddashboards-templatevariables"></a>

The plugin supports template Variables, allowing you to create more interactive and dynamic dashboards. Instead of hard-coding things like tag, group, and check in your metric queries, you can use variables in their place. Variables are displayed under dropdown lists.

### [Events](https://apicasystem.github.io/apica-grafana/#events) <a href="#understandingtheasmimporteddashboards-events" id="understandingtheasmimporteddashboards-events"></a>

* Analyze all events triggered in your Apica system for any given time, including both Custom Events and normal events
* Query Supported Levels: \[Account, Tag, Check]
* Used Apica API:
  * All Events: [GET /events](https://api-wpm2.apicasystem.com/v3/help#href-CustomEvents)
  * Custom Events: [GET /custom\_events](https://api-wpm2.apicasystem.com/v3/help#href-CustomEvents)

## [Annotations](https://apicasystem.github.io/apica-grafana/#annotations) <a href="#understandingtheasmimporteddashboards-annotations" id="understandingtheasmimporteddashboards-annotations"></a>

The plugin supports annotations by overlaying events like custom events on top of the graphs. When you hover over an annotation, you can get the event description.

For example, the screenshot below shows a custom event for a deployment that happened on the highlighted time range as an annotation.



Annotations show when to configure custom events, as below

