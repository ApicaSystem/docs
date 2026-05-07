# Ascent 2.14.1

### Ascent Synthetics <a href="#ascent-synthetics" id="ascent-synthetics"></a>

#### New Features & Improvements

* Redirection to the checks page is now managed based on the user's license type, ensuring a tailored navigation experience.

#### Bug Fixes

* The `ChecksFillThroughASMAPI` function has been updated to prevent indefinite blocking if the ASM API returns 504 (Gateway Timeout) errors, ensuring subsequent sync attempts continue as expected.
* Resolved an issue where the page could crash in the checks list view, improving overall stability.
* Addressed dark theme rendering issues in the Details Analysis view and React Flow actions for a better visual experience.

***

### Observe <a href="#observe" id="observe"></a>

#### Bug Fixes

* Fixed a problem where the query page would crash when selecting a different schema, resulting in smoother transitions and improved usability.

***

Com

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.19.1</td></tr><tr><td>Coffee</td><td>v3.20.1</td></tr><tr><td>ASM</td><td>13.38.2</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.0</td></tr></tbody></table>
