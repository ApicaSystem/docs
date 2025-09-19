# Ascent 2.10.2

### ASM 13.34.0

**Browser Behavior Improvements**:

* We've resolved an issue where, after upgrading to Chrome 130, some users were experiencing a different behavior. Specifically, the client was triggering the mobile/collapsed version of the web application instead of the desktop version, which was causing Selenium scenarios to fail. This has been corrected to ensure a consistent experience.
* We've also fixed a problem where certain requests were incorrectly reported as URL errors in Chrome 130. Previously, these requests were reported as "cancelled" without throwing an error in Chrome 115. This update ensures more accurate error reporting.
* These changes should provide a smoother and more reliable experience with ASM.

### Ascent Synthetics

#### New Features

#### Check Type

* Moved several check types from Tech Preview to General Availability (Browser, Compound, Mobile, Postman and Traceroute)

#### Monitor Groups

* Introduced hierarchical monitor groups with sub-group support for improved check organization
* Added user assignment capabilities for more granular access control
* Implemented multi-check assignment functionality to streamline group management

#### Visualization Enhancements

* Deployed monitor group visualization of checks to provide status indicators across group hierarchies
* Released comprehensive SLA Dashboard with performance trend analytics and success/failure metrics
* Integrated 24-hour SLA uptime status directly within all check list view and monitor group view

#### Operations View

* Launched a consolidated operations view for comprehensive check monitoring
* Enhanced check status indicators with consistent severity coloring for improved readability

#### Scenario Management

* Delivered unified management for Browser and ZebraTester scenarios
* Added multi-deletion support to improve workflow efficiency
* Implemented file type filtering (.html, .zip) for better scenario organization
* Enhanced test execution with customizable browser, version, and location settings

#### Repository Management

* Refined repository settings interface for improved usability
* Added private location association functionality for more flexible repository configuration

#### UI/UX Improvements

* Added multi-select filter capability in Check Visualization and Manage Check groups views
* Consolidated navigation by integrating Manage Checks, Scenario Management, and Operations View as tabs
* Refined location display format to include flag, country code, and city name
* Upgraded status code selection with multi-select interface

#### Bug Fixes

* Fixed check results display problems that were causing missing data
* Corrected search functionality in Check Group View

### Fleet Management

#### New Features

* **Advanced Search Redesign**: Saved queries now appear directly on the main screen, and we've added visual backgrounds to search groups so you can better organize your queries.

#### Improvements

* **Table Design Enhancements**:
  * Action buttons display in a line with helpful color coding
* **Better Documentation for Attributes and Secrets**: We've added helpful explanations about:
  * What attributes are and how they help you categorize and manage fleet components
  * How secrets work to keep your sensitive information like passwords and API keys secure
* **Agent Details Page Refinements**:
  * Fixed width issues in the configuration file tab
  * Improved the assignment visibility toggle for better clarity
  * Updated card colors in the Fleet Summary Table to match our design language

#### Bug Fixes

* **CPU Usage Optimization**: Good news! We've fixed that frustrating issue where stopping an agent would cause the agent-manager service to max out your CPU.
* **Tech Preview Features**: Tech Preview items are now disabled by default.

#### Platform-Wide Improvements

#### Security Enhancements

* **Cookie Security**: We've strengthened session cookie security by implementing the HttpOnly and Secure attribute, giving you better protection against certain types of attacks.

#### Performance Optimizations

* **Database Connection Pooling**: We've fine-tuned how Ascent connects to databases, resulting in snappier performance across the platform.

#### System Stability

* **Syncable Leader Selection**: We've fixed issues that could occur during system updates, making the platform more reliable during maintenance windows.
* **First-time Access**: First impressions matter! We've fixed those annoying error messages some users experienced when accessing the platform for the first time.

### Flow

## Pipelines (New)

#### Pipeline Dashboard & Navigation

* **New Pipeline Dashboard**: We've designed the Pipeline dashboard with intuitive summary cards showing total pipelines, data flows, and pipeline rules at a glance.
* **Enhanced List View**: Pipeline lists include actionable information with good filtering options:
  * Search by pipeline name, rule type, namespace, application, and state
  * Visual identification of rule types with color-coded icons for each rule category
  * Quick access to pipeline metrics directly in the list view
* **Improved Navigation**:
  * Pipeline names are clickable, opening a dashboard with preselected pipeline
  * Dataflow entries are clickable, opening a dashboard with preselected pipeline, namespace, and application to quickly view metrics and graphical data
  * Action buttons are accessible with clearer visual indicators

#### Pipeline Configuration

* **Grouped Graph View**: We've replaced the previous pipeline graph visualization with a clearer grouped pipeline view having multiple rules inside of it for better understanding of your data flows.
* **Easier Pipeline Creation**: You can now create new pipelines and attach them to your currently selected namespace:application (dataflow) right from the pipeline view.
* **Rules Management**:
  * Rules are now brought directly to the pipeline page for easier access
  * Pipelines are decoupled from forwarders. Configure Pipeline modal no longer shows 'Forward Rule' when adding new rules.
  * 'Enable Code' switch is enabled by default
* **Preview Improvements**:
  * Added GenAI option for generating sample logs in configure pipeline page.
  * Loading indicators when fetching sample logs, namespaces, or applications.
  * Better handling of empty dropdowns and state management
  * Replaced dataflow dropdown with direct namespace/application selection for clarity

#### Rules Enhancements

#### New and Improved Rules

* **Stream Rule**: This powerful rule helps you redirect the data flows to other stream for better data management.
* **Forward Rule Enhancements**:
  * Support for multiple attribute renaming with regex patterns in forward rule creation.
  * Enhanced preview functionality to properly display changed logs affected by rules.

#### Rule Management Interface

* **Refactored Rule Interface**: We've completely rebuilt our rule creation and editing interface:
  * New tabbed interface for easier rule configuration
  * Separated code blocks into their own tab for cleaner organization
  * Improved form fields with better validation
* **Event Suppression**: Added UI support for suppressing duplicate events (deduplication) within filter rules, allowing you to:
  * Set suppression duration periods
  * See aggregated events when the suppression period ends
* **Visual Rule Identification**: Each rule type now has distinctive icons in the pipeline view for quick visual recognition.

#### Performance and Stability

#### Metrics and Monitoring

* **Enhanced Pipeline Metrics**: Added detailed metrics to help you track:
  * Pipeline execution time by pipeline ID/name, namespace, and application
  * Logs dropped in each pipeline
  * Number of new events created in new streams

#### System Improvements

* **Cache Management**: Pipeline cache now updates automatically on pipeline configuration changes.
* **Rule Processing**: Rule type workers now operate at the channel level instead of globally, improving processing efficiency.

#### Terminology Updates

* **'Events' to 'Journals'**: We've updated our terminology from "events" to "journals" throughout the interface for better clarity.

### Observe Platform

#### Authentication & User Management

* **SAML Implementation**: Redesigned authentication flow provides more reliable enterprise login experiences
* **Contextual UI**: SAML login option now intelligently displays only when configured in your environment

#### Dashboards & Visualization Capabilities

* **New Chart Types**:
  * Pie charts for proportion visualization
  * Race bar charts for temporal comparisons
  * List views with dynamic field selection
  * Dense-status charts with multi-select labeling
* **Data Explorer Enhancements**:
  * Logarithmic scale for Y-axis to better visualize exponential data
  * Time range bookmarking for reproducible data analysis
  * Multi-column plotting with GroupBy operations
  * Improved numerical representation for small values
* **Dashboard Management**:
  * Corrected shared link functionality
  * Streamlined dashboard import process

#### ALIVE Analytics

* **Compare Functionality**:
  * Integrated search capabilities for targeted analysis
  * Support for granular anomaly type classification
  * Enhanced visualization components with improved color differentiation
  * Dual metric display showing both absolute counts and percentages

#### Query System

* **Editor Improvements**:
  * Confirmation safeguards to prevent unintended overwrites
  * Enhanced query execution monitoring
  * Fixed statistical output anomalies

### IronDB

#### Enhancements

* **Prometheus Support**: IronDB now fully supports Prometheus data through our noit metric director. We've added the ability to decode Prometheus protobuf data and ingest it directly into the system, expanding your metrics collection options.

### **Component Versions - Ascent v2.10.2**

| **Component**                          | **Versions**                                    |
| -------------------------------------- | ----------------------------------------------- |
| Coffee                                 | v3.16.4                                         |
| Flash                                  | v3.15.2                                         |
| ASM                                    | 13.34.0                                         |
| NG Private Agent                       | 1.0.8                                           |
| Check Execution Container: Browser     | fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0 |
| Check Execution Container: Zebratester | zt-7.5a-p0-r-2025.04.02-0-base-1.2.0            |
| Check Execution Container: Runbin      | runbin-2025.04.17-0-base-2.2.1                  |
| Check Execution Container: Postman     | postman-2025.04.17-0-base-1.4.0                 |
| Bnet (Chrome Version)                  | 10.2.1 (Chrome 130)                             |
| Zebratester                            | 7.0B                                            |
| ALT                                    | 6.13.3.240                                      |
| IronDB                                 | 1.5.0                                           |
