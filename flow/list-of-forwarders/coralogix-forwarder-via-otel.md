# Coralogix Forwarder (via OTel)

Creating a forwarder from Apica Ascent to Coralogix utilizes the OpenTelemetry (OTel) protocol to stream high-fidelity logs, metrics, and traces. Coralogix is highly optimized for OTel, offering a dedicated ingestion endpoint that supports both gRPC and HTTP/Protobuf.

By routing data through Apica Flow first, you can perform critical governance tasks—like redacting PII or filtering out "noisy" debug logs—before they reach Coralogix, helping you manage your TCO (Total Cost of Ownership).

### 1. Prerequisites from Coralogix

To authenticate the stream, you need the following from your Coralogix dashboard:

1. Send-Your-Data API Key: Found under Settings > API Keys.
2. Application & Subsystem Names: Coralogix uses these for high-level categorization.
   * Application: e.g., `Apica_Production`
   * Subsystem: e.g., `Flow`
3. Regional Endpoint: Coralogix has moved to a new regional domain format (e.g., `ingress.us1.coralogix.com:443`).

### 2. Configuration Strategy: The Forwarder

In the Apica Flow (Ascent) UI, configure a Target Destination using the OTLP/HTTP protocol.

| **Field**         | **Value**                                        |
| ----------------- | ------------------------------------------------ |
| Destination Name  | `Coralogix_Forwarder`                            |
| Endpoint          | `https://ingress.<region>.coralogix.com/v1/otel` |
| Protocol          | `http/protobuf`                                  |
| Auth Header Key   | `Authorization`                                  |
| Auth Header Value | `Bearer <Your-Coralogix-API-Key>`                |

### 3. Detailed Reference: Metadata & Enrichment (OTTL)

Coralogix maps OTel resource attributes directly to its internal metadata fields. Use Apica Flow's transformation layer to ensure your data is correctly "labeled."

#### Mandatory Label Mapping

SQL

```
# 1. Define Coralogix-Specific Metadata
set(resource.attributes["cx.application.name"], "Apica_Ascent")
set(resource.attributes["cx.subsystem.name"], "Observability_Flow")

# 2. Enrich with Host and Service Info
set(resource.attributes["service.name"], "apica-forwarder")
set(resource.attributes["host.name"], resource.attributes["host.name"])

# 3. Handle Severity (Coralogix uses standard OTel mapping)
set(attributes["severity_text"], severity_text)
```

### 4. Implementation Reference: Exporter Configuration

If you are managing this via the Apica Fleet Agent or a standalone OTel Collector:

YAML

```
exporters:
  coralogix:
    # Use the new regional domain format
    domain: "us1.coralogix.com" 
    private_key: "${CORALOGIX_API_KEY}"
    application_name: "Apica"
    subsystem_name: "Ascent"
    # Optional: Use HTTP if gRPC is blocked by your firewall
    protocol: "http"

service:
  pipelines:
    logs:
      receivers: [otlp]
      processors: [batch, transform/coralogix_enrichment]
      exporters: [coralogix]
```

### 5. Key Implementation Notes

* Regional Endpoints: Ensure you are using the correct regional URL (e.g., `us1`, `eu1`, `ap1`). Using the wrong region will result in "403 Forbidden" errors.
* TCO Optimization: Coralogix offers different pricing tiers (High, Medium, Low). You can use Apica Flow to tag logs with a `tier` attribute, allowing Coralogix to automatically route them to the most cost-effective storage level.
* Payload Limits: Coralogix recommends a batch size of 2MB and has a hard limit of 10MB. Ensure the `batch` processor in your Apica pipeline is tuned to keep requests within this range.
