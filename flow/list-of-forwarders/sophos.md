# Sophos

Apica Flow can support multiple Sophos products with different export mechanics:

### Path A — Sophos Firewall / UTM (native syslog export)

Sophos Firewall appliances push syslog natively, as follows.

1. On the firewall: enable Syslog Forwarding (System Services > Log Settings) and point it at Apica Flow's syslog listener IP. Set Facility to DAEMON, choose a Severity level, and — this is the key choice — select CEF as the log format rather than Sophos's proprietary "Device Standard Format." CEF is a structured, portable format Apica already parses out of the box.
2. On Apica Flow: Ascent's syslog listener requires TCP (UDP isn't supported, due to data loss risk) and has a dedicated CEF-formatted port — 515 (or 7515 for TLS) — separate from the generic RFC 5424 port (514/7514). Pointing Sophos's CEF output at 515/7515 means Flow parses the fields automatically rather than needing a custom key-value parser for Sophos's DSF syntax.
3. If the firewall sits at a remote or customer site (common in MSP/SI deployments), deploy an Apica Fleet agent locally as a syslog relay/buffer rather than exposing the Ascent tenant's listener directly to every branch office — this also gives you Fleet's centralized agent management and health visibility across many firewall sites.

### Path B — Sophos Central (endpoint/XDR/cloud-managed alerts)

Central doesn't do push syslog, rather it uses the Alerts/Events/SIEM REST APIs instead. So this side of "Sophos" has to come in as a pull, not a forwarder:

1. In Sophos Central, generate API credentials (My Products > General Settings > API Credentials Management) — this issues an OAuth2 Client ID/Secret.
2. Configure an Apica JSON Data Source against the Central Alerts and Events APIs, authenticating with those credentials on a scheduled poll — the same pattern Datadog and Splunk use for their Central integrations.

### Processing in Flow

Once both streams are landing in Flow, build a pipeline that filters noisy/low-value fields, normalizes the CEF firewall schema and the JSON Central schema into one common event model, redacts sensitive fields per policy, and enriches with asset/customer metadata. That normalization step supports Sophos's mix of custom logging formats.

### Routing downstream

From there it's ordinary Flow forwarder configuration — no new engineering: route to a SIEM (Splunk, Microsoft Sentinel, Google Chronicle, CrowdStrike Falcon LogScale), to S3-compatible cold storage, or to Apica Lake/InstaStore for retention and replay, which supports both “replay" and "data lake" use cases.

### Operational check

Once configured, verify ingestion through Explore > Logs & Insights to confirm both the firewall and Central streams are landing and parsing correctly before building out downstream routing rules.
