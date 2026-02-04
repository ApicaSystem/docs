# Ascent 2.15.1

#### General Changes

* Ascent users can now be given access to all groups through a simplified configuration, making access management easier where broad visibility is required.
* Group visibility has been adjusted so users see only the groups they manage, addressing scenarios where all groups were previously visible to some users.
* Assignment of Ascent users to groups in IAM now works as expected.

### Flow

#### Bug Fixes & Improvements

* Edges between non-forwarder pipelines and forwarders are now handled correctly, preventing unintended connections in pipeline graphs.
* Pipeline preview no longer clears the drop flag when multiple drop rules are configured, so drop behavior is accurately reflected during preview.
* Logs dropped by code rules are now visible in pipeline preview, giving a correct view of how rules affect data.
* Existing pipeline mappings are preserved when a new pipeline is created on a data flow in the pipeline graph view, avoiding accidental loss of mappings.
* The “Visualize Pipeline” view now loads reliably, improving troubleshooting and design of pipeline flows.

### Ascent Synthetics

#### Bug Fixes & Improvements

* Fixed an issue where users briefly encountered an Access Denied error while accessing the /check/{checkId} endpoint in the Ascent API.

### Observe

#### Bug Fixes & Improvements

* Pipeline preview now correctly handles multiple drop rules and no longer clears drop flags unexpectedly, matching runtime behavior.
* Login page no longer crash due to redirection issues when opening an environment, improving stability when switching or loading environments.
* The improved group-access model ensures users only see the groups they manage, while admins can still grant broad access where needed.

***

### Component Version 2.15.1

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.20.1</td></tr><tr><td>Coffee</td><td>v3.21.1</td></tr><tr><td>ASM</td><td>13.39.1</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.1</td></tr></tbody></table>
