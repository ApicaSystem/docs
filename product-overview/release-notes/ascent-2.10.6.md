# Ascent 2.10.7

This release includes a number of fixes and improvements across the platform. Here's a breakdown of what’s been addressed, organized by product area.

***

### **Ascent Synthetics**

* **Improved Check Cloning**\
  Cloned checks now behave more predictably:
  * The aggregator view no longer shows the original check name.
  * Manual run messages are now accurate.
  * Deleting cloned checks works as expected.
  * Checks created via Postman no longer fail silently.
* **Private Location Fixes**
  * The correct private location name now displays.
  * Access group information is now visible in the Private Locations settings.
* **Download Issues Resolved**
  * Downloaded browser scenarios now retain their original names and extensions.

***

### **Observe**

* **Dashboard and Data Explorer Stability**
  * Dashboards created from logs or alerts now load properly.
  * Tabs and widgets in Data Explorer no longer disappear after dashboard creation.
* **UI Improvements**
  * A warning popup now appears when enabling tech preview features.
  * The Tag Management list no longer hides pagination controls.
  * The Pending Users detail page now loads correctly.
* **System Status**
  * Clicking on outdated queries no longer breaks the page.

***

### **Flow**

* **Pipeline Usability**
  * You can now rearrange pipeline sequences and see the updated order.
  * Creating pipelines with duplicate names is now blocked.
  * Pipeline preview works consistently on every click.
  * Most dashboard widgets now show data as expected.
  * Sorting in the Rules section now works.
* **Rule Execution and Filtering**
  * Rule execution in the pipeline engine has been fixed.
  * Filtered names in the Topological View no longer overflow their containers.
* **Documentation Updates**
  * Added guidance on setting `namespace` and `app_name` in dataflows.
  * Documentation on replay feature is now available.
* **Other Fixes**
  * The “Download Complete Report” button in Report page now works.

***

### **Fleet**

* **Agent and Configuration Management**
  * Sorting by name in Fleet configurations now works across all pages.
  * You can now delete configuration files reliably.
  * The agent list filter dropdown updates dynamically based on selections.
  * The agents list now uses the backend API for filtering, improving performance.
* **Package Management**
  * The package assignment table now shows historical data.
  * The install script now detects the Linux flavor (Rocky Linux) and uses the correct package manager.
* **Documentation Enhancements**
  * Added instructions for updating the Fleet GitHub repository, including agent types, configurations, and packages.

***

### Component Versions - Ascent v2.10.7

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.15.10</td></tr><tr><td>Coffee</td><td>v3.16.13</td></tr><tr><td>ASM</td><td>13.36.0</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.1 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.0B</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.0</td></tr></tbody></table>
