# Ascent 2.15.3

### Ascent Synthetics

* More reliable check cloning and configuration
  * Cloned checks now open correctly after creation, avoiding broken links and errors.
  * Check intervals now only allow valid options, preventing save errors and unexpected behavior.
* Clearer error insights
  * General errors in the Check Result Analysis page for browser checks are now shown in the correct step order, making it easier to understand and troubleshoot scenarios.
* Better protection of sensitive data
  * Values marked to be masked (maskapica) in scenarios are now consistently hidden in browser scenario details within Check Result Analysis for browser checks, preventing sensitive information from being exposed.

### Flow

#### Forwarders and sources

* The Elastic Forwarder create form now only requires the fields that are actually needed, instead of marking everything as mandatory, so setting up a forwarder is less confusing.
* You can now create Source Extensions without running into validation walls, because only the relevant fields are required instead of all of them.

***

### Component Version 2.15.3

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.20.3</td></tr><tr><td>Coffee</td><td>v3.21.3</td></tr><tr><td>ASM</td><td>13.39.2</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.1</td></tr></tbody></table>



