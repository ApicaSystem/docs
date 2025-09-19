# Ascent 2.8.0

#### Release Notes - Ascent October 2024

**Overview**\
This release introduces a host of updates to enhance user experience, streamline operations, and address known issues across Fleet, Data Explorer, the Ascent platform, and ASM+. New features and improvements focus on usability, performance, and customization, while bug fixes enhance platform stability and reliability.

***

#### **New Features and Enhancements**

**OpenTelemetry**

OpenTelemetry Collectors can now be configured to use the standard ingest endpoints when pushing data to Apica Ascent

1. Traces - /v1/traces
2. Logs - /v1/logs
3. Metrics - /v1/metrics

**Telemetry Pipelines**

1. New forwarders added for Oracle Cloud
   * OCI Buckets
   * OCI Observability & Monitoring - Logs

**Freemium Support**

Experience Apica Ascent with the Freemium release. The Freemium is a **FREE FOREVER** release which includes all the capabilities of the Apica Ascent Intelligent Data Management Platform available as a convenient SaaS offering

1. Fleet Management
2. Telemetry Pipelines with support for platforms such as **Splunk**, **Elasticsearch**, **Kafka**, **Datadog** among others
3. Digital Experience Monitoring (Synthetic Monitoring for URL, Ping, Port and SSL Checks)
4. Log Management
5. Distributed Tracing
6. Infrastructure Monitoring
7. Enterprise ready with features such as SAML based SSO
8. ITOM integration with platforms such as **PagerDuty**, **ServiceNow**, and **OpsGenie**

**Fleet Updates**

1. **Agent Management**:\
   \- Introduced controls for managing agents within the Fleet UI for better administration.\
   \- A summary table was added to display agent statistics, providing quick insights.\
   \- Enabled rules for assigning configurations or packages to agents.\
   \- User-defined Fleet resource types (rules, alerts, agent\_types, configurations, and packages) can now be imported via Git.\
   \- Fleet REST API search endpoints now support the `?summary` query parameter for result summarization.\
   \- Expanded fleetctl CLI tool capabilities to manage Fleet API resources directly.
2. **Advanced Search and Customization**:\
   \- Users can save and retrieve advanced search queries in the Fleet Advanced Search Modal.

**Data Explorer Enhancements**

1. **Improved Analytics Options**:\
   \- Added support for PostgreSQL, expanding data integration capabilities.\
   \- Enhanced GroupBy functionality and a “Select All” label for better data analysis.\
   \- Enabled parameterized queries for dashboards, allowing dynamic user input for real-time customization.\
   \- Users can edit the dashboard header query and set the dropdown type (query, enum, or text) for customization.
2. **Visualization Improvements**:\
   \- Introduced a DenseStatusType chart to monitor active and inactive pods/instances in real time.\
   \- Added time zone customization for chart displays.\
   \- Optimized dark theme UI components with updated icons and design assets.

**Ascent Platform Enhancements**

1. **ASM UI Enhancements**:\
   \- Integrated repository and certificate management for streamlined admin controls.\
   \- Implemented a persistent last-view setting on the Check Management page.
2. **General Improvements**:\
   \- Enhanced navigation with streamlined redirection flows for faster page loads.

**AI/ML and GenAI Enhancements**

1. **Pattern-Signature Processing**:\
   \- Improved compaction with meaningful aliasing during pattern-signature (PS) merging.\
   \- Enhanced performance through PS coding representation for faster processing and UI responsiveness.\
   \- Fixed functionality for PS compaction at the backend.
2. **GenAI Features**:\
   \- GenAI document search functionality was added to the NavBar.

***

#### **Bug Fixes**

**Fleet UI and Backend Fixes**

1. **UI and Agent Issues**:\
   \- Resolved banner display inconsistencies during agent updates.\
   \- Fixed errors in anonymous report generation for Grafana Alloy.\
   \- Fixed agent-manager token refresh failures on Windows hosts.
2. **Backend and API**:\
   \- Fixed errors preventing default configuration/package assignments via the install endpoint.\
   \- Resolved OpAMP client failures and Windows socket exhaustion issues.\
   \- Corrected lookup errors for agents by instance ID during OpAMP registration.

**Data Explorer Fixes**

1. **Performance and Stability**:\
   \- Resolved crashes on the Data Explorer page.\
   \- Corrected schema issues and bugs affecting `*`-based queries and widget calculations.\
   \- Fixed default date-type inputs and adjusted other input defaults for smoother workflows.
2. **UI Updates**:\
   \- Fixed CSS and overflow issues in modals and alert render pages.

**General UI and Usability Fixes**

* Resolved usability regressions from the v3.11.2 update, improving input defaults and widget updates.

***

#### **Miscellaneous Enhancements**

1. **Fleet-Specific Improvements**:\
   \- Improved response times in Fleet views for queries involving large datasets.
2. **Ascent Platform**:\
   \- Resolved permission issues for non-admin users in the Namespace endpoint.

***

These updates reflect our commitment to delivering a robust and user-friendly platform. As always, we value your feedback to enhance our services further.
