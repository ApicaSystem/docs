# Exabeam Forwarder

Building a forwarder from Apica Ascent to Exabeam involves integrating with the Exabeam Security Operations Platform (New-Scale). Exabeam ingests data primarily through its Site Collector or via a direct Ingestion API. For an OpenTelemetry-based approach, the most efficient method is using the OTLP-to-HTTP bridge, targeting Exabeam's Common Ingestion Service.

### 1. Prerequisites from Exabeam

To authenticate and route data to the correct "Log Stream" in Exabeam, you need:

1. Ingestion API Key: Generated in the Exabeam Settings under Inbound Integrations.
2. Product/Vendor Names: Exabeam uses these to apply the correct LIME (Log Ingestion & Messaging Engine) parsers.
   * Vendor: `Apica`
   * Product: `Ascent`
3. Endpoint URL: This is specific to your Exabeam region (e.g., `https://api.<region>.exabeam.com/ingest/v1/log-entries`).

### 2. Configuration Strategy: The Forwarder

In the Apica Flow (Ascent) UI, you will configure a Target Destination using the OTLP/HTTP protocol. However, since Exabeam expects a specific JSON envelope for its API, you will use Apica's transformation layer to wrap the OTel data.

| **Field**         | **Value**                                                |
| ----------------- | -------------------------------------------------------- |
| Destination Name  | `Exabeam_SIEM_Forwarder`                                 |
| Endpoint          | `https://api.<region>.exabeam.com/ingest/v1/log-entries` |
| Protocol          | `http/protobuf`                                          |
| Auth Header Key   | `Authorization`                                          |
| Auth Header Value | `Bearer <Your-Exabeam-API-Token>`                        |

### 3. Detailed Reference: Metadata & Enrichment (OTTL)

Exabeam’s UEBA (User and Entity Behavior Analytics) relies on identifying the "User" and the "Host." You must map OTel attributes to fields that Exabeam’s parsers recognize.

#### Mandatory Mapping Logic

Use the Apica transformation layer to ensure the telemetry is categorized for Exabeam’s advanced analytics.

SQL

```
# 1. Set the Vendor and Product for Exabeam Parsing
set(resource.attributes["exabeam.vendor"], "Apica")
set(resource.attributes["exabeam.product"], "Ascent")

# 2. Map User and Host (Crucial for UEBA)
set(attributes["user_id"], attributes["enduser.id"])
set(attributes["dest_host"], resource.attributes["host.name"])

# 3. Format the log for Exabeam's Common Information Model
set(attributes["event_time"], timestamp)
set(attributes["message"], body)
```

### 4. Implementation Reference: Exporter Configuration

If you are deploying this via a standalone OTel Collector or the Apica configuration bridge:

YAML

```
exporters:
  otlphttp/exabeam:
    endpoint: "https://api.us-east-1.exabeam.com/ingest/v1/log-entries"
    headers:
      Authorization: "Bearer ${EXABEAM_API_KEY}"
    # Exabeam prefers structured JSON for high-fidelity parsing
    encoding: json

service:
  pipelines:
    logs:
      receivers: [otlp]
      processors: [batch, transform/exabeam_mapping]
      exporters: [otlphttp/exabeam]
```

### 5. Key Implementation Notes

* Parser Alignment: Exabeam uses LIME parsers to break down logs. If your Apica logs are formatted as OTel JSON, ensure you have enabled the "Generic JSON" parser in Exabeam or contacted Exabeam support to map the `Apica` vendor fields.
* Batching: Exabeam’s Ingestion API has rate limits based on the number of HTTP requests. Use the `batch` processor in Apica to send large groups of logs (e.g., 512–1024 logs) in a single POST request.
* Security Context: If you are forwarding results from Apica’s security-focused synthetic tests, tag them with `category: security` in the OTTL layer so they are prioritized by Exabeam's correlation engine.
