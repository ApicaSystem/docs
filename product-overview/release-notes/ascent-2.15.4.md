# Ascent 2.15.4

### Flow

#### Performance and connection handling

* Distributed tracing now runs faster and more reliably, after a round of performance improvements focused on how traces are fetched and processed.

#### Port management and events

* The port management feature in Ascent is restored, so you can again manage ports from the application.
* Logs that were being aggregated into the event table are now redirected to console logging, so the event table keeps only real event data and no longer grows unnecessarily.

***

### Observe

#### Distributed tracing

* Distributed tracing now respects the result limit you set when searching for traces, instead of loading a random number above that limit.
* Performance for distributed tracing has also been improved from the Flow side, so trace searches feel more predictable end to end.

#### Port management and platform image

* The Ports Management page in Admin Settings now loads correctly without 500 errors, and the list of enabled ports appears as expected so you can view and enable ports from the UI.

***

### Componenet Version 2.15.4

<table><thead><tr><th>Components</th><th width="410">Version</th></tr></thead><tbody><tr><td>Flash</td><td>v3.20.4</td></tr><tr><td>Coffee</td><td>v3.21.4</td></tr><tr><td>ASM</td><td>13.39.2</td></tr><tr><td>NG Private Agent</td><td>1.0.9</td></tr><tr><td>Check Execution Container: Browser</td><td>fpr-c-130n-10.2.1-716-r-2025.04.02-0-base-2.0.0</td></tr><tr><td>Check Execution Container: Zebratester</td><td>zt-7.5a-p0-r-2025.04.02-0-base-1.2.0</td></tr><tr><td>Check Execution Container: Runbin</td><td>runbin-2025.04.17-0-base-2.2.1</td></tr><tr><td>Check Execution Container: Postman</td><td>postman-2025.04.17-0-base-1.4.1</td></tr><tr><td>Bnet (Chrome Version)</td><td>10.2.2 (Chrome 130)</td></tr><tr><td>Zebratester</td><td>7.5A</td></tr><tr><td>ALT</td><td>6.13.3.240</td></tr><tr><td>IronDB</td><td>1.5.1</td></tr></tbody></table>
