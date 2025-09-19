# Ascent 2.10.6

We're excited to share the latest improvements and bug fixes in Ascent 2.10.6. This release focuses on enhancing stability and user experience across all our products.

### &#x20;Ascent Synthetics

#### What's Fixed

* **Screenshot Issues Resolved**: Screenshots now work properly for browser checks and ASM integration
* **Check Management Improvements**:
  * Fixed issues with uploading ZebraTester scripts in Scenario Management
  * Resolved problems creating compound checks
  * Fixed check runs graph and table views showing empty data
* **Private Location Support**: Private locations are now working correctly again
* **User Interface Enhancements**:
  * Check deletion now properly closes tabs
  * Fixed cloning issues where check details showed incorrect values
  * Removed unwanted scroll bars in Screenshots & Filmstrips section
  * Improved SSL check type image display
* **Group Management**:
  * Fixed loading issues when monitor groups contain more than 10 checks
  * Renamed "Check Group" and "Monitor Group" to simply "Group" for consistency
* **Data Display**: Resolved issue where no data was showing for enabled and running checks

### Flow

#### New Features

* **Pipeline Management**: Enhanced pipeline creation and management experience
* **Rule Configuration**: Improved rule creation with better help text and field validation
* **SIEM Integration**: Added Alert and Dashboard tabs for SIEM rules

#### What's Fixed

* **Pipeline Operations**:
  * Fixed metric flow stopping when more than 2 machines send data
  * Resolved pipeline filter functionality
  * Fixed issue where deleted pipelines still appeared
  * Corrected Active Pipelines counter when filtering
* **Data Processing**:
  * Fixed CSV file upload errors in Lookups
  * Resolved namespace and application availability issues
  * Fixed facet fields display after selecting dataflow options
* **Rule Management**:
  * Fixed TAG rule creation issues with metrics, dashboards, and alerts
  * Resolved field name display problems with dots in the name
  * Fixed pipeline preview to use raw logs correctly
* **User Interface**:
  * Improved layout and color schemes for pipelines
  * Fixed dropdown bugs in pipeline configuration
  * Better handling of pipeline rules display

### Fleet Management

#### What's Fixed

* **Agent Management**:
  * Stopped fleet agents from restarting repeatedly with new configurations
  * Fixed syncing issues between repository and fleet-control
* **Configuration**:
  * Improved Datadog agent field handling
  * Added platform-based filtering for agent types
  * Fixed tech preview text display
* **Repository Updates**: Updated fleet-management-defaults to match fleet-tests

### Observe

#### What's Fixed

* **Check Analytics**: Improved performance and reliability of check analytics pages.
* **Data Visualization**: Fixed pipeline table data and hover issues.
* **Integration**: Better integration with Ascent Synthetics features.

### General Improvements

* **User Management**: Fixed internal server error when disabling pending users.
* **Documentation**: Enhanced Swagger documentation for Flash Bundles API.
* **Performance**: Various backend optimizations for better system stability.

***

### Component Versions - Ascent v2.10.6

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.15.9</td></tr><tr><td>Coffee</td><td>v3.16.12</td></tr><tr><td>ASM</td><td>13.35.1</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.1 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.0B</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.0</td></tr></tbody></table>

