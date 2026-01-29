# LogicMonitor Forwarder (using OTel)

Building a forwarder from Apica Ascent to LogicMonitor using OpenTelemetry (OTel) leverages LogicMonitor’s OTLP ingestion capabilities. LogicMonitor typically ingests traces and metrics through its own "LogicMonitor OTel Collector," but you can point the Apica forwarder directly to LogicMonitor’s cloud ingestion endpoints by using the correct authentication headers and resource attributes.

### 1. Prerequisites from LogicMonitor

You need your account-specific ingestion details, which differ depending on whether you are sending traces or metrics/logs.

1. Bearer Token: Log in to LogicMonitor and navigate to Settings > Users/Roles > API Tokens. Generate a Bearer Token (preferred for OTLP) or an LMv1 Token (Access ID/Key).
2. Endpoint: LogicMonitor uses a centralized OTLP endpoint:
   * OTLP/HTTP: `https://<accountname>.logicmonitor.com/rest/otlp`
   * _Note: Replace `<accountname>` with your actual LogicMonitor portal name._

### 2. Configuration Strategy: The Forwarder

In the Apica Flow (Ascent) UI, create a Target Destination using the OTLP/HTTP protocol.

| **Field**         | **Value**                                          |
| ----------------- | -------------------------------------------------- |
| Destination Name  | `LogicMonitor_Forwarder`                           |
| Endpoint          | `https://<accountname>.logicmonitor.com/rest/otlp` |
| Protocol          | `http/protobuf`                                    |
| Auth Header Key   | `Authorization`                                    |
| Auth Header Value | `Bearer <Your-Bearer-Token>`                       |

### 3. Detailed Reference: Metadata & Transformation (OTTL)

LogicMonitor uses Resource Attributes to map telemetry to the correct device or service in your resources tree. If these attributes don't match an existing device, LogicMonitor may create a new "unmanaged" resource.

#### Mandatory Mapping Logic

Use the Apica transformation layer to ensure your data is correctly "homed" in LogicMonitor.

SQL

```
# 1. Map the service name (Visible in the LogicMonitor Traces UI)
set(resource.attributes["service.name"], "Apica-Pipeline-Service")

# 2. Link telemetry to a specific LogicMonitor device
# LogicMonitor matches based on 'host.name' or 'system.displayname'
set(resource.attributes["host.name"], attributes["instance.id"])

# 3. Add custom tags for filtering in LogicMonitor dashboards
set(resource.attributes["lmotel.library.version"], "1.0.0")
set(resource.attributes["env"], "production")
```

#### Exporter Configuration Example

If you are manually configuring a collector bridge or using the Apica YAML editor:

YAML

```
exporters:
  otlphttp/logicmonitor:
    endpoint: "https://<accountname>.logicmonitor.com/rest/otlp"
    headers:
      Authorization: "Bearer <Your_Bearer_Token>"
    # LogicMonitor expects standard OTLP paths (/v1/traces, etc.) 
    # which otlphttp appends automatically.

service:
  pipelines:
    traces:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlphttp/logicmonitor]
    metrics:
      receivers: [otlp]
      processors: [batch]
      exporters: [otlphttp/logicmonitor]
```

### 4. Key Implementation Notes

* Resource Matching: LogicMonitor’s "Resource Mapping" is critical. If your traces are not showing up under the correct device, verify that the `host.name` or `ip` attribute sent by Apica matches the IP Address or DNS Name of the device already added to LogicMonitor.
* Log Ingestion: For OTLP Logs, ensure your LogicMonitor account has LM Logs enabled. Logs are typically routed to the `https://<accountname>.logicmonitor.com/rest/log/ingest` endpoint if not using the unified OTLP path.
* Batching: LogicMonitor highly recommends using the `batch` processor to avoid hitting rate limits on their REST API.
