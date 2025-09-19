# Ascent 2.10.8

### Fixes and Improvements

This release focuses on improving reliability and consistency in Pipeline and Check Analytics behavior. The following issues have been resolved:

***

#### Pipeline & Data Flow Fixes

* **Missing Pipeline Visibility**\
  Resolved issue where a second pipeline intermittently disappeared from the Pipeline view, even though it was applied to the namespace. Both pipelines now appear correctly.
* **Pipeline Preview Fails**\
  Fixed a problem where the pipeline preview in Logs & Insights failed to display results, even when valid data existed.
* **Deleted Rules Still Visible**\
  Addressed a bug where deleted pipeline rules continued to appear in the UI, marked in red. These are now correctly removed from the view once deleted.

***

#### Synthetics / Check Analytics Fixes

* **Incorrect Fatal Check Messages**\
  Corrected misleading error messages shown in Ascent for failed synthetic checks. The system now shows accurate messages, in line with ASM.
* **Monitor Group User Assignment Bug**\
  Fixed an issue where assigning or un-assigning users to/from a monitor group appeared to have “no changes to apply,” even when actions were taken. User assignments now save and reflect correctly.

***

### Component Versions - Ascent v2.10.8

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.15.10</td></tr><tr><td>Coffee</td><td>v3.16.14</td></tr><tr><td>ASM</td><td>13.36.1</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.1 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.0B</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.0</td></tr></tbody></table>
