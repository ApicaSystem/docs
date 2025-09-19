# Ascent 2.5.0

## &#x20;**Synthetic Monitoring (ASM 13.27.0) - SaaS**

**Features**

1. **NG Private Locations/Agents API Support**: Added ASM API support for full self-serve new check-type agnostic Private Agents which can be grouped into Private Locations.\
   Features include:
   * Creation and management of Private location.
   * Creation and management of Private agents.
   * Configuration of Private Container repositories for Private locations to use during check run.
2. Added API support for Timezone selection for Check Inclusion/Exclusion periods during UrlV2 check creation.
3. Extended the subscription page to include more check statistics per check type like Info, Warning, Error, and Fatal check counts.
4. Enhanced status updates for NG Private agents.

**Bug Fixes**

* Fixed the sporadic non-availability of agents in the Stockholm location issue when debugging a Selenium scenario.
* Fixed a bug with downloading scripts from http sources for Scripted and Postman checks.
* Fixed a bug where some block domain rules were not being respected in Browser checks.
* Fixed the issue where setLocation command was not working properly if it is not used at the start of a Selenium script for Browser checks.

***

***

## **Apica Data Fabric (ADF)**

**Features**

1. [**Native Support for OTEL Logs.**](https://docs.apica.io/api/native-support-for-otel-logs)
   * Added native support for OTEL logs using the OTLP HTTP exporter.
2. [**Native Support for OTEL Traces.**](https://docs.apica.io/api/native-support-for-otel-traces)
   * Added native support for OTEL trace using the OTLP HTTP exporter.
3. [**STREAMS Rule Type**](https://docs.apica.io/flow/rules/stream)
   * Introduced a new rule type for STREAMS.
4. [**Moving Average**](https://docs.apica.io/logiq-events/time-series-ai-ml/averaging) **Improved**
   * Enhanced moving average calculation using SMV (Simple Moving Average) and CMV (Cumulative Moving Average).
5. [**Pattern-Log Compare**](https://docs.apica.io/logiq-events/autonomous-log-interactive-visual-explorer-alive/pattern-compare)**.**
   * Feature to compare the logs and patterns side by side to different time ranges.
6. Improved [**ALIVE summary** **graph** **highlighting**](https://docs.apica.io/logiq-events/autonomous-log-interactive-visual-explorer-alive/alive-pattern-signature-summary#highlighting-data-in-pattern-bar-graphs) depending on table content to provide better data visualisation.
7. **Data Explorer: Tabs Scrolling and Improvement**
   * Added scrolling functionality and various improvements to the Data Explorer tabs for better navigation.
8. **GPT-4o-mini and Limited Model Support**
   * Introduced support for GPT-4o, GPT-4o-mini, GPT-3.5-Turbo.
9. **API-Based Create Data-Explorer Dashboard**
   * Added the ability to create Data-Explorer dashboards via API.
10. **API-Based Create Sharable Dashboard**
    * Enabled the creation of sharable dashboards through API.
11. **Generic Implementation for Data Explorer Header**
    * Made the Data Explorer header implementation generic and interdependent.
12. **Check Management Map View**
    * Introduced a map view for check management.
13. **Check Management List View UI Changes**
    * Updated the UI for the check management list view.
14. **Data Explorer Header to Persist Data**
    * Added functionality for the header of data explorer to persist data.
15. **Automatically Create** [**Splunk Universal Forwarder for Splunk S2S Proxy**](https://docs.apica.io/integrations/list-of-integrations/splunk-forwarding-proxy)
    * Added automatic creation of Splunk universal forwarder for Splunk S2S Proxy.
16. **Pipeline Tab in Search View**
    * Added a new pipeline tab in the search view.
17. [**Code Rules Preview**](https://docs.apica.io/flow/rules/code#testing-code-rule-output)
    * Introduced a preview feature for code rules.
18. **Health Check for Agents**
    * Implemented a health check feature for agents.

***

**Improvements**

1. **Trace/Default App Performance Improved**
   * Enhanced the performance of the trace/default application.
2. **New Algorithm for PS Compare and Anomalies Compare**
   * Implemented a new algorithm for comparing architecture PS and detecting anomalies.
3. **Widget Refresh Performance**
   * Improved the performance of widget refresh operations.
4. **Query API Performance for search**
   * Enhanced the performance of the Query API for search.
5. **Default Namespace for Logs for Syslog vs Per Host Namespaces**
   * Enhanced default namespace handling for logs, distinguishing between syslog and per host namespaces.
6. **UI Enhancements for Pipeline and Topology View**
   * Improved UI for pipeline and topology views.
7. **Agent Manager Improvements for Installation Scripts**
   * Enhanced agent manager installation scripts.
8. **Delete Agent Cleanup**
   * Improved the cleanup process when deleting agents.
9. **Remove Unsupported Agents**
   * Enhanced the process to remove unsupported agents.

***

**Bug Fixes**

1. **Y-Axis Overlapping on View**
   * Fixed an issue where the Y-axis was overlapping on the view in the ALIVE application.
2. **Gauge Widget Color Render Based on Zone**
   * Fixed the rendering of gauge widget colors based on specified zones.
3. **Group By for Data-Explorer**
   * Fixed the group by functionality in the Data-Explorer.
4. **Creating Alert Creates Panic**
   * Resolved an issue where creating an alert caused a panic.
