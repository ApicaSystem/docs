# Ascent 2.16.1

### Flow

#### Improvements

**Ingest Improvements**

* Increased JSON processing performance and reduction of memory used
* Dependency updates for security, hardening, and performance

#### Bug Fixes

**SLO API example**

* The example body for the POST `/v1/slos` endpoint in the API docs has been corrected so it uses a valid slo\_window format that passes validation when executed from the API.

**Policy API documentation and behavior**

* Policy management APIs now have proper documentation, examples, and required fields in Swagger, making it possible to work with policies from tools like Postman.

**Alert destination duplication**

* The alerts API now prevents the same destination from being added repeatedly to a single alert, so each user or endpoint appears only once per alert subscription.

***

### Observe

#### Improvements

**Splunk OTLP metrics bridge (Source Extension)**

* Observe benefits from the Splunk OTLP metrics bridge integration, which enables metrics from Splunk to flow into dashboards and SLOs through the new source extension.

**SLO resilience and access control**

* An endpoint has been added to trigger Thanos Ruler reloads so newly applied SLO rules can be picked up when an automatic reload has failed.
* Casdoor policies are now enforced for SLO dashboard access, ensuring only authorized users can view and manage SLOs, with UI behavior updated to hide or disable actions when permissions are missing.

**Savings aggregation timing**

* The SLO savings aggregation worker has been corrected to use the intended 24‑hour window boundaries and timestamps when calculating daily savings, improving accuracy of cost and efficiency reporting.

#### Bug Fixes

**SLO and savings calculations**

* Savings aggregation now passes and uses the correct time range for PromQL queries, so daily savings are computed for the intended period instead of relying on current-time defaults.

**Invite email correctness**

* Invite emails now include recipient names and generate correct links instead of placeholder or malformed URLs, improving the first‑time user experience.

***

### Ascent Synthetics

#### Improvements

**Audit and certificate tracking**

* Audit logs for SAML group mappings now focus on the actual fields that changed, and certificate-related actions are captured in audit logs so access changes are more traceable.

#### Bug Fixes

**Browser check stability**

* Editing browser checks now picks up and displays the correct location and browser version.
* Blocked URLs configured in browser checks are now populated correctly in Ascent’s browser check settings.
* Clicking Next in Browser check settings sub‑tabs no longer crashes the page; the check edit flow remains stable across all browser settings panels.

**Scenario creation and association**

* Uploading a ZebraTester scenario directly in the check creation form no longer crashes the page.
* Disassociating a check from a scenario no longer returns server errors; the check cleanly detaches from the scenario as expected.

**Check management on legacy private agents**

* Saving checks which are running on legacy private agents in Ascent no longer alters unrelated settings in a way that prevents agents from running them, so checks continue to run correctly after being edited in Ascent.

**Reporting reliability**

* SLA Graph Summary reports now generate valid PDFs when multiple checks are selected, fixing prior failures in multi‑check report generation.

***

### Component Version 2.16.1

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.21.1</td></tr><tr><td>Coffee</td><td>v3.22.1</td></tr><tr><td>ASM</td><td>13.40.0</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.1</td></tr></tbody></table>
