# Ascent 2.9.0

## **Customer Release Notes**

### **ASM 13.31.0**

#### **New Features & Enhancements**

**Automation for Checks and Alerts**

* Added support for CI/CD pipeline to streamline check creation and maintenance through ASM APIs.
* Reduced manual efforts and ensured consistency across different environments through automation.
* Ability to perform CRUD operations for ZebraTester, Browser, and URL checks.
* Ability to create, upload, and assign ZebraTester and Browser scenarios for checks.
* Ability to create and assign Email, SMS, and Webhook alert targets or alert groups.

**Chrome 130 Upgrade for Browser Checks**

* All existing Browser checks have been upgraded from Chrome 115 to Chrome 130.
* All new Browser checks run on Chrome 130.

**NG Private Locations**

* Private locations/agents can be shared among sub-customer accounts to run checks.
* Users can utilize their own CA certificates for checks in Private locations to monitor internal applications.

**Apica Grafana Plugin**

* Upgraded the Apica Grafana plugin to version 2.0.11.
* Added support for page metrics, allowing users to analyze response time for specific pages instead of entire scenario metrics.

#### **Bug Fixes**

* Fixed the issue where invalid "acceptedCodes" were being accepted for URL checks in the `POST /checks/url-v2` API.

***

### **Ascent 2.9.0**

#### **Ascent Synthetics (ASM+)**

**Check Management**

* Introduced new check types: Browser, Postman, Traceroute, Mobile Device, and Compound.
* Added support for the full workflow of check management: Edit, Delete, Clone, and Run Check.
* Added support for Bulk Edit, Run, and Delete checks.
* Inclusion and exclusion periods can be added in the check schedule.

**Private Location and Agent Management**

* Introduced full self-service (Add, Edit, Delete, Reissue Certificate) for new check-type agnostic Private agents.
* Private locations can be added, edited, deleted, enabled, and disabled with the ability to associate Private repositories.
* A new "Private Locations" section in the UI allows easy navigation and management.

**Check Analytics**

* Enabled alerting and reporting on checks.
* Alerts and reports for a particular check can be created directly from the check page.
* Screenshots taken during Browser check execution can now be viewed in the Check Analysis page.

#### **Bug Fixes**

* Fixed an issue where filter criteria were not working correctly on the Checks page.
* Fixed a bug where some check results were missing on the Check Details page.

***

### **New Features and Enhancements**

#### **Fleet**

* **Fleet Agent Limits**: Enforced license-based agent limits.
* **Telemetry Enhancements**: Added telemetry support for Fleet agents.
* **Fleet UI Revamp**: Major UI improvements, better agent configuration management, and pagination fixes.
* **Fleet Summary Table**: Redesigned the summary table for better usability.
* **Kubernetes Agent Status**: Fleet UI now displays Kubernetes agent statuses.

#### **Observe**

* **Data Explorer Graph Enhancements**: Enhanced GroupBy plotting with multiple Y-axis selection.
* **Widgets Enhancements**: Added delete functionality and improved widget load time.
* **New Chart Type**: Introduced Pie and HoneyComb charts for visualization.
* **Grafana to Data Explorer**: Added Grafana JSON conversion support in Data Explorer.
* **GenAI Enhancements**: Integrated "Log Explain" feature for enhanced log analysis in ALIVE.
* **Data Explorer Enhancements**: Improved metrics screen and query list support.
* **Dashboard Optimization**: Reduced load times for Data Explorer dashboards and preserved widget data across tabs.
* **RCA Workbench**: Introduced diagnostics and debugging features based on Data Explorer widgets.
* **Dashboard Validation**: Added validation for Data Explorer dashboard creation.

#### **Authentication & Security Enhancements**

* **React Page Migration**: Migrated Login, Setup, Signup, Reset, and Forgot Password pages to React (TSX) to reduce tech debt.
* **Ascent Invitation Feature**: Implemented user invitation functionality via Casdoor.
* **Casdoor Sync**: Synced Casdoor users and groups with the Ascent database.
* **Port Management**: Resolved open TCP/UDP port issues.
* **Casdoor Integration**: Enhanced authentication, session management, and email integration.
* **API Key Support**: Added API key support for Casdoor in Ascent.
* **Casdoor Mail Service**: Integrated Ascent mail service with Casdoor for email functionality.
* **Casdoor Signing Certificates**: Added support for Casdoor signing certificates to enhance security.

***

### **Ascent Bug Fixes**

* **GCP PubSub Plugin**: Resolved file loading issues.
* **ResizeObserver Compatibility**: Fixed compatibility issues with the latest Chrome version.
* **Alert Email Output**: Truncated query output in triggered alert emails for better readability.
* **Agent Sorting**: Fixed sorting by "Last Modified" in Fleet UI.
* **Incorrect Trace Volume**: Fixed trace volume display on the Ascent landing page.
* **Alert Bug Fix**: Resolved discrepancies in triggered alert counts displayed in the navbar.
* **Pipeline View**: Fixed visual bugs in forwarder mapping and improved rule persistence.
* **Fleet Improvements**: Enhanced Fleet installer, improved Kubernetes token creation, and fixed pagination issues.
* **Password Generation UI**: Improved UI for password generation in Ascent.
* **Query Save Fix**: Resolved unknown error when saving queries in the Freemium tier.
* **Moving Average Bug**: Fixed AI-based query creation issues for Moving Average.
* **Alert UNKNOWN Issue**: Resolved alerts triggering with an UNKNOWN state.
* **Alert Evaluation Fix**: Fixed issues with alerts not evaluating after the first trigger.
* **SNMP Source Bug**: Fixed SNMP ingest source extension bugs.
* **Fluent-Bit Installation**: Addressed issues with Fluent-Bit post-agent manager installation.
* **Dual Active Packages**: Resolved the issue of showing two active packages in Fleet.
* **Inclusion/Exclusion Fixes**: Addressed syntax and period-saving issues.
* **Certificate Upload**: Fixed certificate upload issues and removed the feature from Freemium.
* **Default Otel Configuration**: Updated default Otel configuration for metric ingestion.
* **Platform Validation**: Enhanced platform validation in Fleet.
* **Fleet Assign Package Error**: Fixed package assignment issues.
* **Disable Pattern Signature**: Disabled pattern signature functionality in Freemium.
* **Namespace Bug**: Resolved incorrect namespace selection in Data Explorer.
* **Fleet Advanced Search**: Fixed and improved advanced search functionality.
* **Dark Mode Fixes**: Addressed UI inconsistencies, including Waterfall statistics and button styling.
* **Fleet Installation**: Resolved installation errors on Linux and Windows.
* **Kubernetes Dropdown Fix**: Fixed duplicate Kubernetes entries in Fleet dropdowns.
* **Configuration Refresh**: Addressed package reassignment and configuration refresh issues.
* **Documentation Updates**: Updated user and technical documentation.

***

For further details or inquiries, please refer to the official documentation or contact our support team.
