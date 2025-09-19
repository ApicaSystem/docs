# Ascent 2.12.0

\
We’re excited to announce the release of Apica One Platform 2.12.0, delivering enhanced features, improved security, better integrations, and important fixes across all major products.

### Observe <a href="#observe" id="observe"></a>

#### New Features & Improvements

* **User Management Enhancements**
  * Improved workflows for disabling and enabling users, with clear warnings if an action cannot be completed.
  * Introduced a new API for retrieving full user lists.
  * Built-in policies, permissions, and roles are now loaded from default CSV files for improved security and easier out-of-the-box configuration.
  * Built-in/default policies are now visible when initializing policy lists.
* Dashboards
  * Dashboards now load using the last executed query for greater efficiency.
* **Security Enhancements**
  * Enforced stronger password requirements.
  * Application session cookies now include ‘SameSite’ attributes for additional browser security.
* **Notifications & Alerting**
  * Introduced integration with ilert alerting platform.
* **UI and Data Explorer**
  * Data Explorer now supports column-based filters for raw data view, improving the metric explorer.
  * Improvements throughout Data Explorer.
* **API and Integration**
  * Resolved UI inconsistencies with the action buttons in the Integrations tab.

#### Bug Fixes

* License details are now displayed correctly after SAML-based login.
* Fixed API access issue coming because of broken authentication header support.
* Queries now support searching with the ‘%’ and other characters.
* Fixed general user interface issues in Check Management.
* Improved pipeline component reliability and migration file handling.
* Pattern enable/disable logic in the UI now correctly uses the exclusion list.
* Fixed errors that could occur when assigning pipelines.
* Fixed a bug where when anomaly column is disabled, the alert picks a random field from the query result. Now correct columns will be rendered.&#x20;

### Ascent / Synthetics <a href="#ascent--synthetics" id="ascent--synthetics"></a>

#### New Features & Improvements

* **Analytics**
  * Analytics can now be filtered by check identifier.
  * Added auto-refresh in all check views.
  * Enhanced split view features make analytics more actionable.
* **Scenario Management**
  * Scenario files now keep consistent names when downloaded.
  * Backend enforcement has been added for improved scenario and summary security.
  * Improved usability in the scenario location dropdown and file upload process.
  * Sorting by scenario name is now accurate.
* **Check Details & Scheduling**
  * Schedule information is now visible in the check details view.
  * Corrected issues with showing multiple Stockholm locations on maps and lists.
* **User-to-Group Role Assignment**
  * Assigning a user to a group now correctly applies the appropriate role permissions.
* **Netapp Sub-account**
  * Sub-account location sharing is now supported.

#### Bug Fixes

* Improved check details performance.
* Fixed issues with the “Hide Scenario Details” option.
* Resolved errors when editing or saving pending invitation details in user/group management.

### Flow <a href="#flow" id="flow"></a>

#### New Features & Improvements

* **Forwarding & Integration**
  * **Now supports sending data to multiple destinations from a single dataflow.**
* **Usability & Error Handling**
  * Improved prompts for incorrect username/password entries.
  * Resolved issues where some rules lost dynamic values in rule names.

#### Bug Fixes

* Users can now reliably remove rules from pipelines.
* Fixed pod crashes when specific advanced filter settings were enabled.
* Dashboards on pipeline pages now load without errors.

### Fleet <a href="#fleet" id="fleet"></a>

#### New Features & Improvements

* **Agent Management & Infra View**
  * New Infra View in the Honeycomb dashboard supports visibility and management for more than 50,000 agents.
  * “Group By” functionality added to the Infra View.
  * Tooltips for agent details are now available.
  * The Fleet repository page now features a reload button and easy-copy install scripts.
* **UI & Workflow Improvements**
  * Updated the Fleet UI create configuration modal for better usability.
  * Reduced unnecessary API calls and improved overall Fleet page reliability.
  * Confirmation messages for agent actions now only appear when the agent manager is connected.

#### Bug Fixes

* Resolved layout and overlapping issues in agent group display.
* The main Fleet page now loads reliably every time.

### Additional Improvements <a href="#additional-improvements" id="additional-improvements"></a>

* Added ASM subscription details as a 2nd tab in the license details page.

***

### Component Versions - Ascent v2.12.0

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.17.0</td></tr><tr><td>Coffee</td><td>v3.18.0</td></tr><tr><td>ASM</td><td>13.36.3</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.0</td></tr></tbody></table>
