# Sumo Logic Forwarder (via OTel)

Building a forwarder from Apica Ascent to Sumo Logic using OpenTelemetry (OTel) utilizes Sumo Logic's native OTLP/HTTP Source. Unlike some legacy integrations, Sumo Logic has fully embraced OTLP as a first-class ingestion method, providing a unique URL for each collector that acts as the entry point for logs, metrics, and traces.

### 1. Prerequisites from Sumo Logic

To receive data, you must first create a "Hosted Collector" and an "OTLP/HTTP Source" in your Sumo Logic portal:

1. Create Hosted Collector: Go to Manage Data > Collection > Collection and click Add Collector > Hosted Collector.
2. Add OTLP Source: Within that Collector, click Add Source and select OTLP/HTTP.
3. Capture the URL: Once saved, Sumo Logic will provide a unique endpoint URL.
   * _Example:_ `https://endpoint4.collection.us2.sumologic.com/receiver/v1/otlp/your-unique-token`
4. Define Fields: Ensure any resource attributes you want to use as metadata in Sumo Logic (e.g., `service.name`, `deployment.environment`) are added to the Fields list in Sumo Logic settings.

### 2. Configuration Strategy: The Forwarder

In the Apica Flow (Ascent) UI, you will configure a target destination using the OTLP/HTTP protocol.

| **Field**        | **Value**                        |
| ---------------- | -------------------------------- |
| Destination Name | `SumoLogic_OTLP_Forwarder`       |
| Endpoint         | `https://<your-sumo-unique-url>` |
| Protocol         | `http/protobuf`                  |
| Content-Type     | `application/x-protobuf`         |

> Note: Sumo Logic’s OTLP/HTTP source automatically handles the sub-paths for each signal (e.g., appending `/v1/logs`, `/v1/metrics`). You typically only need to provide the base URL in the Apica destination.

### 3. Detailed Reference: Metadata & Mapping (OTTL)

Sumo Logic maps OpenTelemetry Resource Attributes directly to its internal Fields. This is crucial for searching and categorizing logs in the Sumo Logic UI.

#### Mandatory Mapping Logic

Use the Apica transformation layer to ensure the data is "Sumo-ready."

SQL

```
# 1. Map 'service.name' to Sumo Logic's _sourceName (optional but recommended)
set(resource.attributes["_sourceName"], resource.attributes["service.name"])

# 2. Assign the Source Category for logical grouping in Sumo Logic
# Format: <Environment>/<App>/<Service>
set(resource.attributes["_sourceCategory"], "Production/Apica/Logs")

# 3. Add Custom Fields for indexing
set(resource.attributes["deployment.environment"], "prod")
set(resource.attributes["cluster.name"], "us-east-1-apica")
```

### 4. Implementation Reference: Exporter Configuration

If you are manually configuring a collector bridge or utilizing Apica's YAML-based configuration:

YAML

```
exporters:
  otlphttp/sumologic:
    # Use the unique URL generated in the Sumo Logic UI
    endpoint: "https://endpoint4.collection.us2.sumologic.com/receiver/v1/otlp/xxxxxxxxxxxx"
    # Sumo Logic highly recommends Gzip compression
    compression: gzip

service:
  pipelines:
    logs:
      receivers: [otlp]
      processors: [batch, transform/sumo_mapping]
      exporters: [otlphttp/sumologic]
    metrics:
      receivers: [otlp]
      processors: [batch, transform/sumo_mapping]
      exporters: [otlphttp/sumologic]
```

### 5. Key Implementation Notes

* Structured Logs: Sumo Logic treats OTLP logs as structured JSON. If your Apica data contains `log-level-attributes`, Sumo Logic will automatically parse them, making them immediately searchable via the `| json` operator.
* Source Category vs. Fields: Use `_sourceCategory` for high-level organization and Fields (Resource Attributes) for granular filtering (e.g., `container_id`).
* Batching: For production traffic, use a `send_batch_size` of `1024` and a `timeout` of `1s` in your Apica pipeline. This optimizes the number of HTTP POST requests sent to the Sumo Logic endpoint.
