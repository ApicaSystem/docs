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
