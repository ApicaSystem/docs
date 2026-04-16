# OpenText SIEM (via OTel)

To create a data forwarder from Apica Flow to OpenText SIEM (typically ArcSight) using OpenTelemetry (OTel), you need to set up a pipeline where Apica Flow acts as the "intelligent buffer" and the OpenTelemetry Collector acts as the "delivery agent" to the SIEM.

Once a Flow pipeline is created, here is the process forward data to OpenText SIEM. Key steps:

1. Forwarding (sending to an OTel Collector), and
2. Exporting (the OTel Collector sending data to OpenText).

### 1. Configure Apica Flow for SIEM Offloading

In the Apica Ascent/Flow platform, you must first define the logic for what data should be sent to the SIEM.

* Filter Data: Use Apica Flow to filter out "noise" and only keep security-relevant logs (e.g., login failures, firewall blocks, or specific application errors).
* Transform: Normalize the logs into a format the SIEM understands. While OpenText SIEM (ArcSight) prefers CEF (Common Event Format), OpenTelemetry usually handles JSON or OTLP.
* Create a Forwarder: In the Flow UI, navigate to the "Forwarding" or "Pipelines" section and create a new OTLP/HTTP or OTLP/gRPC forwarder.
* Destination: Point this to the address where your OTel Collector will be hosted.
* Token: Use an Ingest Token or Bearer Token if your OTel collector requires authentication.

### 2. Set Up the OpenTelemetry Collector

The OpenTelemetry Collector acts as the bridge. Since OpenText SIEM often requires specific protocols (like Syslog or CEF), the Collector will receive OTLP from Apica and export it in a format the SIEM can ingest.

**Configuration (config.yaml):**

In your OTel Collector configuration, you need to define the Receiver (to hear from Apica) and the Exporter (to talk to OpenText).

**YAML**

```
receivers:
otlp:
    protocols:
      http: # This matches the forwarder you set up in Apica
        endpoint: 0.0.0.0:4318
 
exporters:
  # Option A: Sending via Syslog (Common for OpenText ArcSight)
  syslog:
    endpoint: <OPENTEXT_SIEM_IP>:514
    protocol: tcp # or udp
    format: rfc5424
 
  # Option B: Sending via OTLP (If using modern OpenText ingestion)
  otlphttp/opentext:
    endpoint: "https://<OPENTEXT_ENDPOINT>/v1/logs"
    headers:
      Authorization: "Bearer <YOUR_OPENTEXT_TOKEN>"
 
service:
  pipelines:
    logs:
      receivers: [otlp]
      processors: [batch]
      exporters: [syslog] # or otlphttp/opentext

```

### 3. OpenText SIEM (ArcSight) Ingestion

On the OpenText side, you must ensure the SIEM is ready to receive the data:

* SmartConnector: If sending via Syslog, ensure an ArcSight SmartConnector (Syslog Daemon) is configured to listen on the port you specified in the OTel exporter.
* Mapping: If the data arrives as JSON via OTLP, you may need to use an OpenText FlexConnector or a mapping file to parse the fields into the ArcSight Schema.

### 4. Verification & Optimization

1. Check Flow Metrics: In the Apica Flow dashboard, verify that the "Forwarded" count is increasing.
2. Collector Logs: Check the OTel Collector logs (journalctl -u otelcol) to ensure there are no "Export failed" errors.
3. SIEM Search: In OpenText, search for the DeviceProduct or Namespace you assigned in Apica to confirm the events are searchable.

### Immediate value from this architecture?

* Cost Control: Apica Flow allows you to drop 90% of non-security logs before they reach the SIEM, significantly reducing data storage costs.
* Vendor Neutrality: Using OpenTelemetry means if you ever switch from one SIEM to another, you only change the "Exporter" in the OTel Collector, not your entire application infrastructure.

