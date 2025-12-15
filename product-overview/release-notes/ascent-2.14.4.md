# Ascent 2.14.4

### Observe

#### General Changes

* Configuration for SAML in certain environments now supports correcting the Assertion Consumer Service (ACS) URL.
* Handling of uploaded SAML certificates has been refined to avoid adding unwanted prefixes before saving them.
* SSO users whose access relies on mapped SAML groups can now access their resources reliably, ensuring group-based access control works as configured.

### Flow

#### Bug Fixes

* Pipeline preview now supports page size. Helpful with very big payloads.

### Ascent Synthetics

#### General Changes

* Slowest URLs and waterfall graph sections now display the correct links, improving navigation and analysis from synthetic results.

***

### Component Versions - Ascent v2.14.4

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.19.5</td></tr><tr><td>Coffee</td><td>v3.20.3</td></tr><tr><td>ASM</td><td>13.38.2</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.0</td></tr></tbody></table>
