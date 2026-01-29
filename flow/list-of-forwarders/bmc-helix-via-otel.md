# BMC Helix (via OTel)

Building a forwarder from Apica Ascent (Flow) to BMC Helix using OpenTelemetry (OTel) involves a specific configuration because BMC Helix requires a unique authentication header and mandatory metadata tags (attributes) to accept telemetry data.

BMC Helix relies on an API key that combines your tenant ID and secret, and it strictly requires `entityName` and `entityTypeId` for metric mapping.

### 1. Prerequisites from BMC Helix

To authenticate the forwarder, you must generate an API Key from your BMC Helix instance:

1. Log in to **BMC Helix Operations Management**.
2. Go to Administration > Repository.
3. Click Copy API Key.
   * _Note: The key format is usually `<Tenant ID>::<Access Key>::<Secret Key>::<Source>`._
4. Identify your Base URL (e.g., `https://customer-name.onbmc.com`).

### 2. Configuration Strategy: The Forwarder Pipeline

In the Apica Flow interface, you will configure an OpenTelemetry Forwarder targeting the BMC Helix REST API. Because BMC has specific requirements for metric ingestion, the forwarder must perform two main tasks: Authentication and Resource Mapping.

#### Step A: Metadata Enrichment (Mandatory)

BMC Helix will reject data if it cannot map the telemetry to a "CI" (Configuration Item). You must ensure your Apica pipeline adds these attributes:

* `entityName`: The name of the host or service.
* `entityTypeId`: The type (e.g., `Host`, `Service`, or `Database`).

#### Step B: The Forwarder Setup

In Apica Ascent, create a new Target Destination using the OTLP/HTTP protocol.

| **Field**         | **Value**                                     |
| ----------------- | --------------------------------------------- |
| Destination Name  | `BMC_Helix_Forwarder`                         |
| Endpoint          | `https://<your-tenant>.onbmc.com/api/v1/otel` |
| Protocol          | `http/protobuf`                               |
| Auth Header Key   | `X-Api-Key`                                   |
| Auth Header Value | `<Your-BMC-API-Key>`                          |

### 3. Implementation Reference (OTel Collector Style)

If you are defining this via a custom configuration or an OTel-native bridge within Apica, use the following `exporters` logic:

YAML

```
# 1. Transform data to meet BMC Helix requirements
processors:
  attributes/bmc_mapping:
    actions:
      - key: entityName
        from_attribute: host.name
        action: insert
      - key: entityTypeId
        value: "Host" # or dynamic based on service type
        action: insert

# 2. Define the BMC Helix Exporter
exporters:
  otlphttp/bmchelix:
    endpoint: "https://<your-tenant>.onbmc.com/api/v1/otel"
    headers:
      X-Api-Key: "<tenant_id>::<access_key>::<secret_key>"

service:
  pipelines:
    metrics:
      receivers: [otlp]
      processors: [attributes/bmc_mapping, batch]
      exporters: [otlphttp/bmchelix]
```

### 4. Key Differences from Other Destinations

* Authentication Key: BMC uses `X-Api-Key` instead of the standard `Authorization: Bearer` or `Basic` headers.
* AIOps Integration: Once the forwarder is active, the data appears in BMC Helix Discovery under "External Elements." You may need to enable the OTel Service Blueprint in BMC Helix AIOps to visualize the topology.
* Log Forwarding: While metrics and traces are standard OTLP, ensure your BMC Helix version supports OpenTelemetry Logs (typically version 24.2+), otherwise, logs should be routed via the BMC Helix Fluentbit or Logstash integrations.

## Dynamically Mapping Tags

To dynamically map your tags, you will use OTTL (OpenTelemetry Transformation Language) within the Apica Flow transformation layer. This ensures that the data arriving in BMC Helix is categorized correctly, allowing their AIOps engine to correlate metrics to the right infrastructure components.

#### 1. The Mapping Logic

BMC Helix requires a specific "Entity Type" to place data in the correct bucket. You can use a `route` or `set` logic to transform Apica metadata (like `namespace` or `container_name`) into BMC-friendly attributes.

| **If Apica Tag Contains...** | **Set entityTypeId to...** |
| ---------------------------- | -------------------------- |
| `k8s.pod.name`               | `KubernetesPod`            |
| `db.system`                  | `Database`                 |
| `host.name` (and no k8s)     | `Host`                     |
| `service.name`               | `Service`                  |

#### 2. OTTL Transformation Reference

In your Apica pipeline configuration, add the following transformation statements. These act as the "logic board" for your forwarder.

SQL

```
# Set the entityName from the most relevant source
set(attributes["entityName"], attributes["host.name"]) where attributes["entityName"] == nil
set(attributes["entityName"], attributes["k8s.pod.name"]) where attributes["k8s.pod.name"] != nil

# Map Entity Type IDs for BMC Helix
set(attributes["entityTypeId"], "Host") where attributes["host.name"] != nil
set(attributes["entityTypeId"], "KubernetesPod") where attributes["k8s.pod.name"] != nil
set(attributes["entityTypeId"], "Database") where attributes["db.system"] != nil

# Ensure the BMC Tenant ID is tagged if required by your specific workspace
set(resource.attributes["bmc.tenant.id"], "YOUR_TENANT_ID")
```

#### 3. Validating the Forwarder

Once the forwarder is active in Apica, you should verify the data flow within BMC Helix:

1. Check the Gateway: Navigate to BMC Helix Operations Management > Monitor > Devices.
2. Filter by Source: Look for devices where the "Source" attribute matches the name you gave the Apica forwarder.
3. Trace the Header: If data isn't appearing, check your Apica logs for `401 Unauthorized`. This usually means the `X-Api-Key` string (the one with the `::` separators) was pasted incorrectly or has trailing spaces.

#### 4. Advanced: Handling Log Levels

BMC Helix handles log severity differently than standard OTel. If you are forwarding logs, use this OTTL snippet to ensure your "Critical" alerts in Apica don't show up as "Info" in Helix:

SQL

```
set(severity_text, "Critical") where severity_number >= 17
set(severity_text, "Error") where severity_number >= 13 and severity_number <= 16
```
