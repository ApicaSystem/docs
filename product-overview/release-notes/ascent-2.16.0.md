# Ascent 2.16.0

### Flow

#### New Features

* Data Explore dashboards now support static text and counter widgets so teams can add explanations and highlight important KPIs alongside query‑based charts.

#### Improvements

**Forwarder persistence and safety**

* Forwarder configuration and deletion flows have been strengthened so buffered data is flushed or explicitly dropped before removal, with clearer persistence options in the UI and better test coverage to lower the risk of silent data loss.

#### Bug Fixes

* Forwarder updates now handle changes in default buffer sizes correctly so editing a forwarder no longer fails with a buffer size error.
* Cluster updates in the Settings section now save as expected, and edited clusters reflect their changes after reload.

***

### Observe

#### New Features

**SLO experience (Preview Feature)**

* A complete SLO experience is available, including REST APIs, list view, creation and edit forms, detail dashboards, service and metric discovery endpoints, and automatic SLO dashboards, all powered by Thanos‑backed recorded metrics so teams can define and observe SLOs without managing PromQL by hand.

**RUM Dashboard**

* A new RUM (Real User Monitoring) dashboard has been introduced within Ascent, expanding visibility into real user performance. The instrumentation script collects key web performance and reliability metrics such as TTFB, LCP, INP, CLS and various error rates, using injected JavaScript and a polling model that avoids slowing down page loads while supporting alerting and downstream processing.

**Dashboard sharing**

* Dashboard sharing allows users to generate shareable links backed by API keys with configurable expiry, so dashboards can be opened via a link while respecting access controls.

#### Improvements

**Permissions and frontend security**

* Permissions APIs are fully documented in Swagger with updated policy namespace coverage and a Postman collection, and frontend security has been improved by tightening HTTP Strict Transport Security and changing password handling so passwords are no longer sent via GET query strings.

#### Bug Fixes

**Platform hardening**

* Query result tables in Observe now support sorting after execution again, multiple access tokens are no longer created for the same user on new deployments, Ports Management no longer fails with server errors, and Redash Admin access is restricted to the intended paths.

**Admin and settings**

* Port Management in Admin Settings now loads enabled ports correctly and allows new ports to be enabled without 500 errors.

***

### Ascent Synthetics

#### New Features

**Adhoc and Subscription Reports**

* Expanded capabilities for subscription based scheduled reports and adhoc report generation. The new reporting capabilities provide clearer visibility into check performance and SLA compliance.
* Following report templates have been added:
  * SLA graph summary
  * General HTML performance summary
  * Quick Summary A4
  * Summary by Group and Status
  * Summary by Site and Group
  * Check Summary by Site and Priority
  * Excel summary reports
* These reports provide multiple ways to review monitoring performance and share insights with stakeholders.

**Analyze Metrics**

New capabilities include:

* Export to PDF for easy sharing of analysis results
* Custom threshold analysis to evaluate checks against user-defined thresholds
* Shareable views that allow teams to collaborate on analysis
* Improved image (JPEG, PNG) downloads from charts

**Alert Destination Management**

* A new alert destination dashboard has been introduced for improved visibility.
* Streamlined configuration and management of Webhook, Email, and SMS destinations for checks has been added.

#### Improvements

**Audit Trail**

* Audit trail capabilities have been expanded to improve operational transparency and security compliance.
* Improved filtering and visibility of audit trail events.
* Expanded audit coverage for identity and access management operations like SAML group or role mapping changes, role and policy assignments etc.
* Improved auditing for Ascent Synthetics operations like check management, scenario management, monitor group or tag assignments etc.

**Check management**

* After creating a new check, the Edit Check page automatically opens for faster configuration.
* A new Edit Scenario button is available directly within scenario details in check result analysis page.
* Validation improvements prevent saving checks with incomplete fields.
* Improvements to severity mapping configuration and saving for browser checks.

**Scenario visibility**

* ZebraTester scenario messages are now visible after upload.

#### Bug Fixes

**Shared private locations**

* Browser checks that use shared private locations between parent and sub‑customers now fetch their scenarios correctly instead of discarding runs due to “Request to resource service failed” errors.
* Private locations appear in the check creation flow correctly.

**Check analytics correctness**

* Scenario debug actions work correctly during check creation.
* SLA values show correctly in Groups and Split views.
* Search in Group and Split view returns only matching check groups.
* Fixes for deleting checks immediately after creation.

**Check result visualization fixes**

* Browser check screenshots keep the correct order even on reload.
* Failed executions in graphs stay visually consistent as failures on hover.
* Request and response headers are displayed for URLs in Error section.

***

### Components Version 2.16.0

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.21.0</td></tr><tr><td>Coffee</td><td>v3.22.0</td></tr><tr><td>ASM</td><td>13.39.3</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.1</td></tr></tbody></table>
