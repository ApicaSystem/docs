# SolarWinds Forwarder (via OTel)

Building a forwarder from Apica Ascent to SolarWinds Observability using OpenTelemetry (OTel) is a standardized process that requires specific "Service Keys" and regional endpoint mapping. SolarWinds uses a unified OTLP ingestion point but differentiates traffic based on the API token and the protocol version.

### 1. Prerequisites from SolarWinds

SolarWinds Observability requires a Service Key, which is a combination of an API Ingestion Token and a Service Name.

1. Ingestion Token: Log in to SolarWinds Observability, go to Settings > API Tokens, and generate a token with "Ingestion" permissions.
2. Service Name: Decide on a name for the service (e.g., `Apica-Forwarder`).
3. Service Key Format: Your key must be formatted as `<Ingestion-Token>:<Service-Name>`.
4. Regional Endpoint: Identify your data center (e.g., `na-01`, `eu-01`).
   * OTLP/HTTP: `https://otel.collector.<region>.cloud.solarwinds.com/v1/traces` (or `/v1/metrics`, `/v1/logs`)

### 2. Configuration Strategy: The Forwarder

In the Apica Flow (Ascent) UI, create a Target Destination using the OTLP/HTTP protocol. SolarWinds is strict about path-based ingestion for HTTP.

| **Field**         | **Value**                                              |
| ----------------- | ------------------------------------------------------ |
| Destination Name  | `SolarWinds_Forwarder`                                 |
| Endpoint          | `https://otel.collector.<region>.cloud.solarwinds.com` |
| Protocol          | `http/protobuf`                                        |
| Auth Header Key   | `Authorization`                                        |
| Auth Header Value | `Bearer <Your-Service-Key>`                            |

> Note: SolarWinds sometimes accepts the service key directly in the `sw.api.key` header if the `Authorization` bearer is already in use by a proxy.

### 3. Detailed Reference: Metadata & Enrichment (OTTL)

SolarWinds relies on Resource Attributes to build its "Entity Explorer." Without the correct attributes, your data will appear as "Unassociated Telemetry."

#### Mandatory Mapping Logic

Use the Apica transformation layer to ensure the following attributes are attached to every span or metric:

SQL

```
# 1. Set the mandatory SolarWinds Service Key if not in header
set(resource.attributes["sw.api.key"], "YOUR_INGESTION_TOKEN:YOUR_SERVICE_NAME")

# 2. Map Host information for Infrastructure correlation
set(resource.attributes["host.name"], attributes["hostname"])

# 3. Define the service name explicitly (High priority in SolarWinds)
set(resource.attributes["service.name"], "Apica-Data-Stream")

# 4. Map Environment (appears as a filter in SolarWinds UI)
set(resource.attributes["deployment.environment"], "production")
```

### 4. Implementation Reference: Exporter Configuration

If you are defining the forwarder via a configuration bridge or an OTel Collector instance managed by Apica:

YAML

```
exporters:
  otlphttp/solarwinds:
    # SolarWinds requires specific endpoints per signal type
    endpoint: "https://otel.collector.na-01.cloud.solarwinds.com"
    headers:
      Authorization: "Bearer <YOUR_TOKEN>:<YOUR_SERVICE_NAME>"

service:
  pipelines:
    traces:
      receivers: [otlp]
      processors: [batch, attributes/sw_mapping]
      exporters: [otlphttp/solarwinds]
    metrics:
      receivers: [otlp]
      processors: [batch, attributes/sw_mapping]
      exporters: [otlphttp/solarwinds]
```

### 5. Key Implementation Notes

* Endpoint Selection: Ensure you include the versioning in the endpoint if your collector doesn't append it automatically. For metrics, the path is `/v1/metrics`.
* Entity Linking: SolarWinds automatically creates entities (Services, Hosts, etc.) based on the `service.name` and `host.name`. If you see multiple entities for the same host, verify that the case sensitivity of the `host.name` attribute matches across all Apica pipelines.
* Trace Context: SolarWinds supports W3C Trace Context. If you are forwarding traces from Apica that originated in another instrumented system, SolarWinds will seamlessly stitch them together.
