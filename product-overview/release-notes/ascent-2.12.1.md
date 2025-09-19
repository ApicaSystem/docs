# Ascent 2.12.1

### 1. Observe <a href="#id-1-observe" id="id-1-observe"></a>

* **New ilert Integration**\
  Apica Ascent now natively integrates with ilert for alerting and incident management. This enables users to forward alerts from Ascent directly into ilert for on-call scheduling, escalation, and incident response.
  * Configuration is available under **Integrations > Alert Destinations > ilert** in Ascent.

#### Bug Fixes

* **Dashboard Widgets Lock Issue Resolved**\
  Newly created dashboard widgets are now editable after saving, addressing the problem where widgets were becoming locked.
* **Vault > Certificates – Button Functionality Restored**\
  The “Add Certificate” button in the Certificates section of the Vault now loads correctly, allowing users to add new certificate entries without issues.
* **Pipelines Dashboard Widget Legend Field Display Issue Fixed**\
  Addressed an issue where certain widget fields in the Pipelines Dashboard were displaying “NaN” values. Fields now render the correct data consistently.
* **IAM Settings Sorting Restored**\
  Fixed a bug where the sort functionality in IAM (Settings) was not working as expected. Sorting now applies correctly to all relevant columns.&#x20;

***

### 2. Ascent / Synthetics <a href="#id-2-ascent--synthetics" id="id-2-ascent--synthetics"></a>

#### Bug Fixes

*   **Check Analytics > Map View Fixed**

    Fixed an issue because to which checks were not getting rendered in the global map view and the counts were not matching the number of checks being rendered on the map.

***

### 3. Flow <a href="#id-3-flow" id="id-3-flow"></a>

#### Bug Fixes

* **Pipeline Rule Interaction**\
  Fixed an intermittent issue where some rules within pipelines were greyed out and unclickable after opening the Configure Pipeline screen.
* **Rule Detachment Behavior Fixed**\
  Resolved a problem where disabling a rule in one pipeline inadvertently detached it from another connected pipeline.
* **Forwarder Removal from Pipelines**\
  Fixed an issue preventing users from removing forwarders from pipelines, forwarders can now be added or removed as intended.
* **Filter Rule Label Warning Removed**\
  Fixed a problem where manually adding labels to a filter rule prompted an unnecessary warning when saving. Rules now save without false alerts.

***

### Component Versions - Ascent v2.12.1

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.17.1</td></tr><tr><td>Coffee</td><td>v3.18.2</td></tr><tr><td>ASM</td><td>13.36.3</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.0</td></tr></tbody></table>
