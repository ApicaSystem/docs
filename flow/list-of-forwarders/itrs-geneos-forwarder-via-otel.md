# ITRS Geneos Forwarder (via OTel)

Forwarding data from Apica Ascent to ITRS Geneos using OpenTelemetry (OTel) typically utilizes the ITRS Geneos OpenTelemetry Plugin. Unlike some cloud-native targets, Geneos ingests OTel data through its Gateway Hub or a Netprobe configured with the OTel collector plugin, which then maps the data into the classic Geneos "Entity-Sampler-Dataview" hierarchy.

### 1. Prerequisites from ITRS Geneos

Before configuring Apica, you must ensure the ITRS side is ready to receive OTLP traffic:

1. Geneos Gateway Hub: Ensure your environment has the Gateway Hub and Ingestion Service running.
2. OTLP Endpoint: Obtain the URL for the Ingestion Service.
   * Standard: `https://<hub-host>:<port>/ingestion/v1/otel`
3. Authentication: Geneos often uses Service Account Tokens or basic credentials (username/password) configured within the Gateway Hub’s IAM.

### 2. Configuration Strategy: The OTLP Forwarder

In the Apica Flow (Ascent) UI, you will set up a forwarder that targets the Geneos Ingestion Service.

| **Field**        | **Value**                                     |
| ---------------- | --------------------------------------------- |
| Destination Name | `ITRS_Geneos_Forwarder`                       |
| Endpoint         | `https://<hub-host>:<port>/ingestion/v1/otel` |
| Protocol         | `http/protobuf`                               |
| Authentication   | `Bearer <Token>` or `Basic <Credentials>`     |

#### Step A: Metadata Mapping (Mandatory)

ITRS Geneos requires specific resource attributes to correctly place the data in its Active Console tree. If these are missing, the data may be ingested but will not appear in any dataviews.

Use the Apica transformation layer (OTTL) to inject these mandatory Geneos dimensions:

* `itrs.managed.entity`: The name of the entity in Geneos.
* `itrs.sampler.name`: The name of the sampler (e.g., "Apica\_Metrics").
* `itrs.type.name`: (Optional) The Geneos Type.

### 3. Detailed Reference: Pipeline Transformation (OTTL)

Because Geneos maps OTel data to its internal model, you must explicitly define where the metrics should "land."

SQL

```
# Map Apica attributes to ITRS Geneos internal dimensions
set(resource.attributes["itrs.managed.entity"], resource.attributes["host.name"])
set(resource.attributes["itrs.sampler.name"], "Apica_Monitoring")

# Ensure service name is set as a fallback
set(resource.attributes["service.name"], "Apica_Forwarder")

# (Optional) Map specific metrics to Geneos Dataview rows
set(attributes["geneos.row.name"], attributes["metric.name"])
```

#### Exporter Configuration Example

If you are defining the forwarder via a configuration bridge:

YAML

```
exporters:
  otlphttp/geneos:
    endpoint: "https://geneos-hub.internal:443/ingestion/v1/otel"
    headers:
      # Geneos specific ingestion credentials
      "Authorization": "Bearer ${env:GENEOS_TOKEN}"
    # Geneos Hub requires specific TLS settings if using self-signed certs
    tls:
      insecure_skip_verify: true 

service:
  pipelines:
    metrics:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlphttp/geneos]
    logs:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlphttp/geneos]
```

### 4. Key Implementation Notes

* Dimensionality: ITRS Geneos is very sensitive to "Dimensional Ingestion." Ensure that you do not send high-cardinality tags (like unique session IDs) as primary dimensions, as this can cause the Gateway Hub to drop data to protect the Gateway's memory.
* Dataview Creation: Once data arrives in the Hub, you must go into the Gateway Setup Editor (GSE) and ensure there is an "OpenTelemetry" sampler configured to pull those specific metrics from the Hub into your Active Console.
* Log Ingestion: For logs, Geneos supports OTel LogRecords. These will typically appear in the ITRS Analytics view or can be routed to a specific log-viewing sampler in the Active Console.
