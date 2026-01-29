# ScienceLogic Forwarder (via OTel)

Building a forwarder from Apica Ascent to ScienceLogic SL1 using OpenTelemetry (OTel) is a powerful way to feed high-fidelity telemetry into SL1’s AI-driven platform. ScienceLogic supports OTLP ingestion primarily through its Skylar Automated RCA (formerly Zebrium) or its SL1 OTLP Acceptor service.

### 1. Prerequisites from ScienceLogic SL1

Depending on whether you are using the Skylar AI/Log layer or the core SL1 platform, you will need:

1. Ingestion URL: \* Skylar (Logs): Usually `https://<tenant-id>.zebrium.com/api/v2/common/otlp`
   * SL1 (Core): Your specific regional OTLP collector endpoint provided by ScienceLogic support.
2. Authentication Token: \* Obtain your Log Collector Token (for Skylar) or API Key from the Integrations & Collectors page in the ScienceLogic UI.

### 2. Configuration Strategy: The OTLP Forwarder

In the Apica Flow (Ascent) UI, configure an OTLP/HTTP destination. ScienceLogic specifically looks for a proprietary token header to authorize the stream.

| **Field**        | **Value**                                  |
| ---------------- | ------------------------------------------ |
| Destination Name | `ScienceLogic_SL1_Forwarder`               |
| Endpoint         | `https://<your-url>/api/v1/otlp`           |
| Protocol         | `http/protobuf`                            |
| Header Key       | `ze_token` (for Skylar) or `Authorization` |
| Header Value     | `<Your-ScienceLogic-Token>`                |

### 3. Detailed Reference: Metadata & Enrichment (OTTL)

ScienceLogic SL1 uses "Device Fingerprinting." If the incoming data from Apica does not contain specific resource attributes, SL1 may struggle to align the data with the correct device in its Infrastructure Map.

#### Mandatory Mapping Logic

Use the Apica transformation layer to inject the following "ScienceLogic-friendly" attributes:

SQL

```
# 1. Map the host to ensure SL1 aligns it with the correct device
set(resource.attributes["host.name"], attributes["hostname"])
set(resource.attributes["sl1.device.id"], attributes["sl1_id"]) # If known

# 2. Add Organization/Deployment tags (Required for Skylar logs)
set(resource.attributes["ze_deployment_name"], "Production-Apica-Cluster")

# 3. Tag the source as 'apica' to allow filtering in SL1 Event Policies
set(resource.attributes["data_source"], "apica_forwarder")
```

### 4. Implementation Reference: Exporter Configuration

If you are deploying this via the Apica collector configuration or a YAML-based bridge:

YAML

```
exporters:
  otlphttp/sciencelogic:
    endpoint: "https://<tenant>.zebrium.com/api/v2/common/otlp"
    headers:
      # Use ze_token for Skylar/Log ingestion
      ze_token: "your_log_collector_token"
      # Use Authorization for core SL1 OTLP ingestion
      # Authorization: "Bearer <your_token>"

service:
  pipelines:
    logs:
      receivers: [otlp]
      processors: [batch, attributes/sl1_mapping]
      exporters: [otlphttp/sciencelogic]
    metrics:
      receivers: [otlp]
      processors: [batch, attributes/sl1_mapping]
      exporters: [otlphttp/sciencelogic]
```

### 5. Key Implementation Notes

* Data Flattening: ScienceLogic’s AI platform prefers flat log structures. If Apica is sending deeply nested JSON, use a Flatten Processor in your Apica Flow before sending it to SL1 to improve automated root-cause analysis (RCA).
* Beta Features: ScienceLogic frequently updates its OTel Collector components (available on [GitHub](https://github.com/ScienceLogic/otel-components)). If you are an enterprise customer, you may need to request the specific Zebrium-OTLP binary for optimized log parsing.
* Event Correlation: Once the forwarder is live, you can create Event Policies in SL1 that trigger specifically when the `data_source` attribute from Apica indicates a "Critical" status.
