# IBM Instana (via OTel)

Building a forwarder from Apica Ascent to IBM Instana using OpenTelemetry (OTel) is highly effective because Instana provides a native OTLP Acceptor. You can choose between two main architectural paths: forwarding directly to the Instana SaaS Backend or routing through a local Instana Host Agent.

### 1. Prerequisites from IBM Instana

To connect, you need your specific regional endpoint and your Agent Key.

1. Agent Key: Log in to Instana, go to Settings > Agents > Configurations, and copy your `Your Agent Key`.
2. SaaS Region Endpoint: Instana uses region-specific endpoints (e.g., `blue`, `red`, `orange`).
   * OTLP/gRPC: `otlp-<region>-saas.instana.io:4317`
   * OTLP/HTTP: `otlp-<region>-saas.instana.io:4318`
   * _Example (Blue Region):_ `otlp-blue-saas.instana.io:4317`

### 2. Configuration Strategy: The Forwarder

In the Apica Flow (Ascent) UI, create a Target Destination using the OTLP/gRPC or OTLP/HTTP protocol. OTLP/gRPC is generally preferred for Instana due to its performance with high-volume trace data.

#### Step A: Destination Settings

| **Field**        | **Value**                                 |
| ---------------- | ----------------------------------------- |
| Destination Name | `Instana_SaaS_Forwarder`                  |
| Endpoint         | `otlp-<region>-saas.instana.io:4317`      |
| Protocol         | `grpc` (or `http/protobuf` for port 4318) |
| Header Key       | `x-instana-key`                           |
| Header Value     | `<Your-Instana-Agent-Key>`                |

#### Step B: The Local Agent Alternative

If you have an Instana Agent running in your infrastructure, you can point the Apica forwarder to that agent instead of the SaaS backend. This is useful for automatic infrastructure correlation (linking metrics to a specific host).

* Endpoint: `http://<instana-agent-ip>:4317`
* Auth: No headers are typically required for the local agent if it is in a trusted network.

### 3. Detailed Reference: Pipeline Transformation

Instana relies on specific OpenTelemetry Semantic Conventions to map data to its "Dynamic Graph" (the infrastructure map). Use the Apica transformation layer to ensure these attributes are present.

#### Mandatory Metadata (OTTL)

If your source data lacks host or service identifiers, Instana may treat it as "unlinked." Add these via Apica:

SQL

```
# Ensure service.name is set for proper APM grouping
set(resource.attributes["service.name"], "Apica-Data-Forwarder") 
    where resource.attributes["service.name"] == nil

# (Optional) Link to a specific host in Instana's Infrastructure map
set(resource.attributes["host.id"], attributes["instance.id"])
```

#### Exporter Configuration Example

If manually configuring the Apica bridge or a standalone collector:

YAML

```
exporters:
  otlp/instana:
    endpoint: "otlp-blue-saas.instana.io:4317"
    headers:
      x-instana-key: "YOUR_INSTANA_AGENT_KEY"

service:
  pipelines:
    traces:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlp/instana]
    metrics:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlp/instana]
```

### 4. Key Implementation Notes

* Logs Ingestion: To send logs via OTLP, ensure you have the Instana Logs Add-on active. Instana will automatically parse OTLP logs and link them to the services identified in your traces.
* Infrastructure Correlation: One of Instana's unique features is the "Context Guide." To ensure Apica data appears correctly on the infrastructure map, verify that the `host.name` or `container.id` attributes match those already discovered by Instana.
* Mixed Tracing: If you are using Instana AutoTrace alongside Apica, the forwarder will automatically support W3C Trace Context propagation, allowing you to see a single end-to-end trace even if it passes through multiple systems.
