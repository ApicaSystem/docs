# Ascent 2.16.0

### SLO <a href="#slo" id="slo"></a>

This release introduces a new SLO experience that makes it easier to see which services are meeting their targets. The SLO list view, backed by recorded SLO metrics and integrated with dashboards and tracing, gives teams a single place to track health, error budgets, and overall reliability.

***

### Flow <a href="#flow" id="flow"></a>

### New Features <a href="#new-features" id="new-features"></a>

* Data Explore dashboards now support static text and counter widgets, making it easier to add explanations and highlight key KPIs alongside charts.

### Improvements <a href="#improvements" id="improvements"></a>

**Forwarder persistence and safety**

* Forwarder configuration and delete behavior has been refined so buffer settings are clearer in the UI and the internal delete flow is more robust against data loss, with safer handling of persisted buffers.

**Check‑aware Flash filtering**

* Flash APIs can filter checks by namespace and application, helping narrow down data flows for specific checks when inspecting or managing log pipelines.

### Bug Fixes <a href="#bug-fixes" id="bug-fixes"></a>

**Random logout hardening**

* A set of changes across Flow and shared authentication components addresses random logout issues, improving session stability when working in the UI.

***

### Observe <a href="#observe" id="observe"></a>

### New Features <a href="#new-features" id="new-features"></a>

**Out‑of‑the‑box LLM monitoring dashboard**

* An LLM monitoring dashboard is available out of the box so teams can start tracking key signals for LLM workloads without building dashboards from scratch.

**Dashboard sharing**

* Dashboards can be shared using generated links backed by API keys with configurable expiry, allowing access to dashboards through a URL while still enforcing permissions.

### Improvements <a href="#improvements" id="improvements"></a>

**Forwarder configuration and persistence**

* Forwarder persistence queue fields are fully represented in the UI with the right layout and controls, making it easier to configure persistence behavior for Observe data flows.

**Value display controls**

* Visualizations support switching between exponential and base value display, so charts can be viewed in the numeric format that is easiest to interpret for the situation.

**Authentication and access management**

* API key management includes an option to create keys without an expiration date for long‑lived integrations.
* Flash APIs accept both ingest tokens and API keys, giving more flexibility when connecting external systems.
* Policy management now explains how wildcard usage works for each resource, making it clearer how policy rules apply.
* Idle session timeout is configurable in the UI so administrators can set session lifetime to match their security and usability needs.
* Password reset behavior has been tightened so administrators can manage user passwords safely without needing the current password.
* The invitation flow allows assigning roles when inviting a user, instead of having to update roles after the user is created.

**Security hygiene**

* HTTP Strict Transport Security settings for Ascent Frontend endpoints have been strengthened to align with best practices for HTTPS‑only access.

**New visualizations**

* A pivot‑style visualization is available for dashboards, enabling more flexible breakdowns and summaries of metric data.

### Bug Fixes <a href="#bug-fixes" id="bug-fixes"></a>

**Random logouts and sessions**

* Random logout issues affecting Observe users have been addressed as part of the shared session stability work, reducing unexpected sign‑outs during active use.

**Password and account administration**

* Admin‑initiated password resets no longer require knowledge of a user’s current password, so user accounts can be recovered or updated more smoothly.

**Dashboard sharing polish**

* The share dashboard experience reliably generates working links with correct permissions, so recipients can access dashboards as intended.

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
