---
description: 'Data Fabric Release: v3.7'
hidden: true
---

# Data Fabric

## Release v3.7.1 (March 11, 2024)

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



## Release v3.7 (February 11, 2023)

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





***

## Release v3.6 (September 11, 2023)

### Welcome to Release v3.6. We're excited to introduce several new features and improvements designed to enhance user experience.

* **Enhanced Log Analysis with Generative AI like ChatGPT and Azure OpenAI Service**
  * We're excited to introduce the **integration of Generative AI**, including **ChatGPT** and **Azure OpenAI Service**, into the Explore feature. Now, you can easily select logs and engage in dynamic conversations with Generative AI to gain in-depth insights into your log data. Ask questions, request explanations, and explore your logs to gain deeper insights into your log data, making log analysis more informative and versatile.
* **ALIVE (Autonomous Log Interaction Visual Explorer)**: ALIVE is a powerful interactive visualization tool designed to empower users in identifying issues and patterns within their applications. This innovative tool offers a rich and insightful representation of unstructured logs. Key features includes:
  * **Autonomous Log Analysis**: ALIVE autonomously analyzes logs, saving users time and effort.
  * **Interactive Visualization**: Enjoy an interactive and engaging experience when exploring log data.
  * **Flow Representation**: Understand the flow of log events with clear and intuitive visualizations.
  * **Insightful Representation**: Gain deep insights into your log data through meaningful visual representations.
  * **Multivariate Analysis**: Easily pinpoint issues across vast datasets at a glance.
  * **Scalability**: ALIVE scales effortlessly to accommodate your growing data needs, ensuring consistent performance.
  * **Improved pattern compaction (PC) workload**: With this release, we've enhanced the pattern compaction feature. Now, as the number of patterns increases, selected patterns can be further aggregated into the same group to prevent pattern count explosion. This process is called compaction. We've also added a button in the ingestion settings that allows you to disable or enable pattern compaction. Please note that this feature is not intended for use with static or small pattern sets, and excessive use of the PC action can result in pattern aliasing.
* **Enhanced Onboarding Experience with App Tour**: Introducing _**App Tour**_, designed to provide both new and returning users with a seamless introduction to our platform's key features. This guided tour ensures a smooth and intuitive navigation experience right from the start, helping you quickly become familiar with our app's functionalities and empowering you to make the most of our platform.
  * App tour coverage:
    * Explore (Data, Topology, Flows)
    * Dashboards
    * Source Extensions
    * Search
    * Rules
    * Forwarder
    * Queries
    * Create Rule
* Moved **Source Extensions, Forwarders, Rule Packs and Import dashboards** to new **Integrations** page.
* New **Source Extensions**
  * [SNMP Source Extension](https://docs.logiq.ai/integrations/snmp)
  * [Apica Source Extension](https://docs.logiq.ai/integrations/apica-synthetic-monitoring): The Apica Source Extension is a component designed to integrate with the Apica Synthetics and Load test platform. Its main purpose is to retrieve check results from the Apica platform and make them available for further processing or analysis within another system or tool.
* New **Forwarders** which can help users selectively send specific log data to downward destinations based on their filtering criteria, thereby reducing the amount of data stored and analyzed. This can lead to cost optimization as it allows users to focus their resources on the most relevant and important log data, rather than storing and processing unnecessary or redundant information.
  * [Coralogix](https://logflow-docs.logiq.ai/forwarding-to-monitoring-tools/coralogix-forwarding)
  * [GCP BigQuery](https://logflow-docs.logiq.ai/forwarding-to-data-warehouse/gcp-bigquery)
  * [Azure Log Analytics](https://logflow-docs.logiq.ai/forwarding-to-monitoring-tools/azure-log-analytics-forwarding)
* **Topology view Enhancements** ✨ Recent enhancements in the topology view is the inclusion of the total events information. This improvement provides users with a clearer understanding of the overall event activity within the system or network.
* **Pipeline Changes:**
  * **Pipeline Application Filtering Support**
    * We're excited to introduce support for pipeline application filtering in this release. With this enhancement, users can efficiently filter log data when managing multiple applications, streamlining their data management processes.
  * **Error Indicator**
    * We've also added an error indicator to the Pipeline View. This indicator serves as a valuable visual cue when forwarding logs to destinations, helping users quickly identify and address any issues in their data flow to downward destinations.
* **Faster Reports**
  * In this release, we've significantly improved report generation speed by removing the 10-second polling delay.

#### Search

* **Optimized Search**
  * We've enhanced search performance by further optimizing the search query parallelism, ensuring quicker and more efficient results retrieval.
* **Enhancement in Search feature by adding Regex for Extract.**
  * Get a holistic taxonomy of logs by automatically categorizing them based on their content, context and other characteristics. This capability provides users with a way to extract and classify logs automatically, improving the speed and accuracy of log-analysis. This saves time and effort by automating the process of field extraction, eliminating the need for users to manually identify and extract fields .

#### Other Enhancements:

* **Aggregate Settings Persistence**
  * We've introduced the convenience of persistent aggregate settings. Now, when users select an aggregate, the system will remember their choice, ensuring that their selection remains consistent across sessions.
* **Table View for Structured Data**
  * We've deprecated the Tree view and introduced a more user-friendly Table View for structured data derived from log lines.
* **Revamped Forwarder Selection UX**
  * Experience an enhanced user interface when selecting forwarders during creation. Our redesigned forwarder selection process is more intuitive and efficient.
* **Log-to-Traces Proxy**
  * We've built a versatile proxy that can seamlessly convert logs into traces. This allows logs to be stitched into multiple spans, forming a comprehensive trace for improved monitoring and analysis.
* **Multiple Widgets in Dashboards**
  * Enhance your dashboards with ease. Users can now add multiple visualizations related to various queries in a single step, providing more flexibility in dashboard creation.
* **Distribution Flow**
  * We've deprecated the distribution flow feature from the forwarders page, making it even more accessible. Users can now access distribution flow directly from the explore page.

#### Bug Fixes

* **Increased gRPC Recovery Limits**
  * We've addressed an issue that could sometimes result in partial search results. By increasing the gRPC recovery limits, we've improved the reliability of search operations in our platform.

### We Value Your Feedback

If you have any questions, encounter issues, or want to share your thoughts, please don't hesitate to contact our [support team](mailto:support@apica.io). Thank you for choosing Apica as your data fabric partner. We look forward to continuously improving your experience.

***

***

## v3.5.9.1 <a href="#uversionv359u" id="uversionv359u"></a>

### **📅 Fri, Mar 24, 2023**

*   **Topology-powered root-cause analysis**.

    Visualize your data streams as a topology with drill down to errors and warnings for faster root causes. Helps visualize the health of your applications. Users can quickly investigate the issues by clicking errors or alerts.
*   **Data flow Pipelines**.

    The pipeline is a series of processes or stages through which data flow systematically and efficiently. Helps to visualize the flow between nodes, rules, and filters applied for the data flow. Shows the inflow and outflow information of data, and also helps in identifying the data loss or optimizing the data flow to forward destinations.
*   **Search results aggregates**.

    Buit-in Pivot table makes it easy to analyze large data sets from search queries. Summarize or Visualize a set of data points for instant analysis. Some common examples of aggregation functions include(Count, Value, Sum, Count Unique Values, List Unique Values, Average, Median, Min, Max). Aggregation functions are used to summarize large datasets into a more manageable form for further analysis and visualization. And includes different types of visualizations (Table, Line chart, Area chart, Scatter chart, Dot chart, and Multiple pie chart).
*   **Re-designed Landing page**.

    Instantly get access to valuable insights when you login into our redesigned Explore page. Users now log in and directly land on the Explore page with quick summaries at their fingertips.

    1. Introduced counter widgets for EPS, Total Flows, Total Events, Forwarders, and Source Extensions.
    2. Added a new Event Statistics column, which has counts of (Errors, Alerts, Critical, Emergency), (Warnings) and (Total) events.
*   **OSSEC HIDS Mappings**

    Automatically map OSSEC HIDS event severity and log messages for Linux and Windows environments.
* **Added support for exporting events and metrics from** [**Apache Beam**](https://docs.logiq.ai/integrations/apache-beam) **to Apica Ascent**.
*   **OpenTelemetry `otel.status_code` Mapping**

    Detect OpenTelemetry severity and level embeddings and map them into severity levels.
* **Memory and performance improvements**.
* **Automated agent installation for Linux and Windows**.
