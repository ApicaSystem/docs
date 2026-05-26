# Fortinet FortiSIEM Forwarder

As FortiSIEM receives logs via standard syslog, a good approach for forwarding logs from Apica Flow is the **Syslog TCP** forwarder.

#### Creating the FortiSIEM forwarder

Apica supports forwarding logs in Syslog CEF and ArcSight CEF formats via TCP. To create one: expand the **Create** menu from the navigation bar, click **Forwarder**, select the format type, click **New Forwarder**, provide the host and name, and click **Create**.

Since FortiSIEM listens on TCP/1470 for plain TCP syslog and TCP/6514 for TLS syslog, configure the forwarder as follows:

Navigate to **Integrations → Forwarders → Add Forwarder**

Select the forwarder type based on your FortiSIEM parser preference:

* **Syslog TCP (raw)** — use this if FortiSIEM is configured to receive standard RFC5424 syslog. FortiSIEM's native FortiGate parsers work directly on this format since it matches what FortiGate natively produces.
* **Syslog TCP CEF** — use this only if your FortiSIEM instance has been configured to ingest CEF-formatted events from third-party sources and you need to map Fortinet log fields to the CEF schema. The CEF syslog forwarder requires that the `message_raw` field starts with `CEF:` — messages that do not match this prefix are dropped with an error log. For FortiGate-to-FortiSIEM flows, **raw syslog TCP is the correct choice** because FortiSIEM's own FortiGate parsers already understand the native FortiGate syslog key-value format — CEF conversion adds no value and risks field-mapping errors.

Fill in the forwarder form:

| Field       | Value                                                     |
| ----------- | --------------------------------------------------------- |
| Name        | `fortisiem-prod`                                          |
| Host        | FortiSIEM Supervisor or Collector IP/FQDN                 |
| Port        | `1470` (plain TCP) or `6514` (TLS)                        |
| Type        | `syslog_tcp`                                              |
| Buffer size | `10485760` (10 MB — handles burst without dropping)       |
| Default     | unchecked (this is a targeted forwarder, not a catch-all) |

Click **Create**.

#### Map the forwarder to the namespace and application

There are two mapping methods depending on whether you want to forward all FortiGate logs or only security-relevant events:

**Method A — Full namespace forward (all logs)**

1. Navigate to **Explore → Logs & Insights**
2. Select the `fortinet-prod` namespace
3. Hover over the three-dot menu at the top right of the log list
4. Click **Map Forwarder**
5. Select `fortisiem-prod` from the forwarder list
6. Click **OK**

All logs ingested under the `fortinet-prod` namespace will now be forwarded to FortiSIEM after passing through the pipeline rules created in Flow.

**Method B — Pipeline-conditional forward (security events only)**

In the Pipelines page, hover over the three dots on your pipeline and click Map Forwarder, then select your forwarder. Deselect the default forwarder if you only want the new forwarder to receive the data, then click OK. This method requires pipelines.

1. Navigate to **Explore → Pipelines**
2. Select the pipeline created in Flow
3. Click the three-dot menu and select **Map Forwarder**
4. Select `fortisiem-prod`
5. Deselect the default forwarder if you do not want unfiltered logs also stored locally
6. Click **OK**

Using Method B in combination with the conditional Rule 5 from Phase 3 gives FortiSIEM only the `route_to_fortisiem = true` tagged events — UTM events, authentication events, critical alerts — while routine traffic logs remain in Apica Lake for cost-efficient long-retention without burdening FortiSIEM's ingestion capacity.

#### Configure FortiSIEM to receive the forwarded logs

FortiSIEM listens on UDP/514 for UDP syslog, TCP/1470 for TCP syslog, and TCP/6514 for TCP syslog over TLS on all Supervisor, Worker, and Collector nodes. No receiver-side configuration is needed for plain TCP syslog on port 1470 — FortiSIEM listens on this port by default.

For TLS, FortiSIEM supports receiving syslog over TLS. To enable it, locate the `listen_tls_port_list=6514` and `tls_certificate_file` entries in `phoenix_config.txt` on Supervisor/Worker and Collector nodes, then restart phParser as root.

To help FortiSIEM correctly identify and parse the Apica-forwarded logs as FortiGate-origin events (rather than as generic syslog from an unknown source), add Apica Ascent's IP address as a monitored device in FortiSIEM:

1. In FortiSIEM, navigate to **Admin → Setup → Credentials**
2. Add the Apica Ascent server IP with device type set to **Fortinet FortiGate** and transport **Syslog**
3. This ensures FortiSIEM's FortiGate-specific parsers are applied to the incoming log stream, preserving the full field structure that the enrichment rules in Phase 3 added

#### Verify and validate end-to-end

1. **In Apica Flow**: Navigate to **Explore → Pipelines → Visualize Pipeline** and confirm the FortiGate namespace node shows events flowing through the pipeline rules and out through the `fortisiem-prod` forwarder node. Check the savings figure — this should reflect the volume reduction from your deduplication and filter rules.
2. **In FortiSIEM**: Navigate to **Analytics → Raw Events** and search for events with `Device Type = FortiGate`. Confirm structured fields (srcIP, dstIP, service, action, policy, user) are correctly parsed and not appearing as raw unparsed strings.
3. **Validate the forwarder buffer**: If a forwarding destination becomes unavailable, the pipeline's persistence queue absorbs traffic bursts. Sources of data can cause sudden increases in data bursts, and a pipeline inadequately sized for storage will mean data loss — Apica's Never Block Never Drop architecture handles this elastically. Test this by temporarily stopping FortiSIEM's phParser service and confirming no events are lost when it resumes.
4. **Check CEF drop errors** if you chose the CEF forwarder variant: verify TCP listeners are active on the destination and check Apica logs if messages are getting dropped due to invalid payload or blocked network.

#### SUMMARY: A complete log flow from FortiGate to FortiSIEM

<table><thead><tr><th width="91.32421875">Phase</th><th width="353.328125">Action</th><th>Location</th></tr></thead><tbody><tr><td>1</td><td>FortiGate CLI: enable reliable syslog, RFC5424, point at Apica</td><td>FortiGate CLI</td></tr><tr><td>2</td><td>Verify ingestion, name namespace</td><td>Apica Flow → Explore</td></tr><tr><td>3</td><td>Create pipeline: dedupe, filter, PII-redact, enrich, route-tag</td><td>Apica Flow → Pipelines</td></tr><tr><td>4</td><td>Create Syslog TCP forwarder pointing at FortiSIEM port 1470</td><td>Apica Flow → Forwarders</td></tr><tr><td>5</td><td>Map forwarder to namespace (all logs) or pipeline (security-only)</td><td>Apica Flow → Explore or Pipelines</td></tr><tr><td>6</td><td>Confirm FortiSIEM TCP/1470 listener active; register Apica IP as FortiGate device</td><td>FortiSIEM Admin</td></tr><tr><td>7</td><td>Validate pipeline view, raw event parsing, buffer resilience</td><td>Both platforms</td></tr></tbody></table>
