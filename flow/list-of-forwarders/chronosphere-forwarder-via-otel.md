# Chronosphere Forwarder (via OTel)

Configuring a forwarder from Apica Ascent to Chronosphere follows the OpenTelemetry (OTLP) standard but requires specific attention to Chronosphere's authentication headers and sub-path endpoint structure.

#### 1. Prerequisites from Chronosphere

Before configuring Apica, ensure you have the following from your Chronosphere instance:

* Service Account API Token: Generate an API token with `Upload` or `Write` permissions.
* Tenant Hostname: Your tenant URL (e.g., `company.chronosphere.io`).

#### 2. Configuration Strategy: The OTLP/HTTP Forwarder

In the Apica Flow interface, you will define Chronosphere as a target. Chronosphere uses a specific path for each telemetry type under its OTLP gateway.

| **Field**        | **Value**                                             |
| ---------------- | ----------------------------------------------------- |
| Destination Name | `Chronosphere_Forwarder`                              |
| Endpoint Base    | `https://<TENANT>.chronosphere.io/data/opentelemetry` |
| Protocol         | `http/protobuf`                                       |
| Compression      | `zstd` (Preferred) or `gzip`                          |

**Mandatory Authentication Header**

Chronosphere does not use standard Basic Auth; it requires a custom header:

* Header Key: `API-Token`
* Header Value: `<Your-Chronosphere-API-Token>`

#### 3. Detailed Reference: Pipeline Exporter Logic

If you are using the Apica configuration editor or a sidecar collector, use the following `exporters` block. Note that Chronosphere expects metrics, logs, and traces at distinct sub-endpoints.

YAML:

```
exporters:
  otlphttp/chronosphere:
    # Use the base path; OTel SDKs append /v1/metrics, /v1/logs, etc.
    endpoint: "https://<TENANT>.chronosphere.io/data/opentelemetry"
    compression: zstd
    headers:
      API-Token: "your_api_token_here"
      # Optional: Controls verbosity of rejected metric errors
      Chronosphere-Metrics-Validation-Response: "SHORT" 

service:
  pipelines:
    metrics:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlphttp/chronosphere]
    logs:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlphttp/chronosphere]
```

#### 4. Key Implementation Notes for Chronosphere

* Attribute Flattening: Chronosphere supports "Resource Attribute Merging." By default, it merges resource-level attributes (like `host.name`) into your metric labels. You can adjust this in the Chronosphere UI under Ingest > OTLP Settings if you encounter label collisions.
* Batching: Chronosphere highly recommends the `batch` processor. For high-volume data, set your `send_batch_size` to `1000` and `timeout` to `1s` in Apica to optimize network overhead.
* Validation: Chronosphere provides a specific header `Chronosphere-Metrics-Validation-Response`. Setting this to `DETAILED` during your initial setup in Apica will help you debug if any metrics are being dropped due to naming schema violations.

#### Summary Table: Forwarder Comparison

| **Feature**   | **BMC Helix**                   | **Chronosphere**           |
| ------------- | ------------------------------- | -------------------------- |
| Auth Header   | `X-Api-Key`                     | `API-Token`                |
| Endpoint Path | `/api/v1/otel`                  | `/data/opentelemetry`      |
| Compression   | Gzip                            | Zstd / Gzip                |
| Requirement   | Entity Mapping (`entityTypeId`) | Resource Attribute Merging |

Video: [Forwarding logs to Chronosphere](https://www.youtube.com/watch?v=YSKSVURiu7A)

This video provides a practical walkthrough of setting up a telemetry pipeline to forward log data into the Chronosphere platform, which complements the configuration steps outlined above.
