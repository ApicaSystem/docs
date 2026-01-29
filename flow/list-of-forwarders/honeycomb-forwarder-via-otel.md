# Honeycomb Forwarder (via OTel)

Building a forwarder from Apica Ascent to Honeycomb using OpenTelemetry (OTLP) is unique because Honeycomb organizes data into "Environments" and "Datasets" via headers. While many modern OTLP targets infer service names automatically, Honeycomb relies heavily on specific `x-honeycomb` headers to route your traffic correctly.

### 1. Prerequisites from Honeycomb

Before configuring the Apica pipeline, collect these details from your Honeycomb Team settings:

* API Key: Found under Environment Settings.
* API Endpoint: \* US: `https://api.honeycomb.io`
  * EU: `https://api.eu1.honeycomb.io`
* Dataset Name: (Required for Metrics and Logs) The name of the bucket where you want this data to land.

### 2. Configuration Strategy: The OTLP Forwarder

In the Apica Flow (Ascent) UI, you will create a target destination using the OTLP/HTTP protocol.

| **Field**        | **Value**                  |
| ---------------- | -------------------------- |
| Destination Name | `Honeycomb_Forwarder`      |
| Endpoint         | `https://api.honeycomb.io` |
| Protocol         | `http/protobuf`            |
| Header 1 Key     | `x-honeycomb-team`         |
| Header 1 Value   | `<Your-Honeycomb-API-Key>` |
| Header 2 Key     | `x-honeycomb-dataset`      |
| Header 2 Value   | `<Your-Dataset-Name>`      |

> Note: For Honeycomb, if you are using a "Modern" API key (shorter, mixed case), the `x-honeycomb-dataset` header is only strictly required for Metrics. For Traces, Honeycomb will automatically create datasets based on the `service.name` attribute.

### 3. Detailed Reference: Pipeline Transformation logic

Using OTTL (OpenTelemetry Transformation Language) within Apica, you can ensure your data is "Honeycomb-ready." Honeycomb excels when data is "flat" and contains high-cardinality fields.

#### Step A: Mapping Attributes

Ensure the `service.name` is set, as this is how Honeycomb identifies distinct services in its UI.

SQL

```
# Set service name if it's missing to avoid "unknown_service" in Honeycomb
set(resource.attributes["service.name"], "Apica-Forwarder-Service") 
    where resource.attributes["service.name"] == nil

# Flatten nested attributes for better Honeycomb query performance
set(attributes["http.client_ip"], attributes["net.peer.ip"])
```

#### Step B: The Exporter Configuration

If you are manually editing the Apica collector YAML or using a sidecar:

YAML:

```
exporters:
  otlphttp/honeycomb:
    endpoint: "https://api.honeycomb.io"
    headers:
      "x-honeycomb-team": "YOUR_API_KEY"
      "x-honeycomb-dataset": "apica-metrics-dataset"

service:
  pipelines:
    traces:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlphttp/honeycomb]
    metrics:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlphttp/honeycomb]
```

### 4. Key Implementation Notes

* Batching is Critical: Honeycomb’s API performance is significantly better with the `batch` processor enabled in your Apica pipeline. This reduces the number of HTTP calls and prevents rate-limiting.
* Dataset Routing: If you want to route logs to one dataset and metrics to another, you must create two separate exporters in Apica, each with a different `x-honeycomb-dataset` header value.
* Visualizing Traces: Once data flows, go to the New Query tab in Honeycomb and group by `service.name`. If you don't see data, check if your Apica forwarder is using `http/protobuf`—Honeycomb’s OTLP endpoint is strictly version-compliant.

**Video**: [Using OpenTelemetry With Honeycomb](https://www.youtube.com/watch?v=owMtlMDLbzE)

This video provides an excellent deep dive into how Honeycomb handles OpenTelemetry data, which will help you understand how to structure your Apica transformations for the best observability results.
