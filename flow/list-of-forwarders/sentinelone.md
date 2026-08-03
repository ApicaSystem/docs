# SentinelOne

Here is the process for forwarding syslog data from Apica Flow to SentinelOne:

### **1. Generate a SentinelOne Event Collector token**

In the SentinelOne console, under Singularity Data Lake, create an HTTP Event Collector source — this issues a bearer token and tells you your ingest region (e.g., `us1`, `eu1`). Note the region; it determines your ingest URL.

### **2. Identify the ingest endpoint**

SentinelOne exposes two HEC paths at `https://ingest.<region>.sentinelone.net`:

* `/services/collector/event` — for structured JSON events (the one to use for Apica-processed telemetry)
* `/services/collector/raw` — for raw/unstructured text (used by integrations like Cloudflare Logpush that ship pre-formatted logs)

For data coming out of Flow, `/services/collector/event` is the right target since Flow is already emitting structured JSON.

### **3. Configure the forwarder in Apica Flow**

Go to Integrations > Forwarders > Add Forwarder > **Splunk HTTP Event Collector (HEC)** and point it at SentinelOne instead of Splunk:

<table data-header-hidden><thead><tr><th width="173.3125"></th><th></th></tr></thead><tbody><tr><td><strong>Field</strong></td><td><strong>Value</strong></td></tr><tr><td>Host</td><td><code>https://ingest.&#x3C;region>.sentinelone.net</code></td></tr><tr><td>Port</td><td>443 (HTTPS — override the Splunk default of 8088)</td></tr><tr><td>Password</td><td>Your SentinelOne Event Collector token</td></tr><tr><td>Type</td><td><code>_json</code></td></tr></tbody></table>

**One thing to verify before treating this as turnkey:** Splunk's HEC protocol sends the token as `Authorization: Splunk <token>`, while SentinelOne's HEC expects `Authorization: Bearer <token>`. If Apica's Splunk HEC forwarder hardcodes the `Splunk` prefix rather than letting you set the scheme, the reused forwarder will authenticate incorrectly. Two ways to resolve, depending on what engineering confirms:

* If the auth header prefix is configurable in the Splunk HEC forwarder, this is a pure configuration exercise — no new build.
* If it's hardcoded, fall back to the **JS Code Forwarder** (already generic and open in Flow) pointed at the same `/services/collector/event` URL, explicitly setting `Authorization: Bearer <token>` in the request headers — this guarantees compatibility regardless of how the Splunk-specific forwarder is coded.

### **4. Tag a source type**

Set a `sourcetype` value (e.g., `apica-flow`) on the outbound events — SentinelOne uses this the same way Splunk does, to route parsing and to make the data findable in Data Lake queries and dashboards.

### **5. Verify**

Send a test batch and confirm the events land in Singularity Data Lake's Log Analytics view under the configured source type before wiring up production pipelines.

**One scope note:** this covers Flow → SentinelOne (getting Apica-processed telemetry into Data Lake). Pulling SentinelOne's own EDR alerts _into_ Apica would be a separate, reverse-direction integration against SentinelOne's Management Console API — not something this HEC forwarder handles — worth keeping distinct if that's ever needed.
