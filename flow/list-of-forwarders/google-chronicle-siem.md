# Google Chronicle SIEM

Forwarding data from Apica Ascent to Google Chronicle SIEM (now part of Google Security Operations) is transitioning from legacy Docker-based forwarders to a modern OpenTelemetry (OTel) architecture. Google has officially designated OTel—specifically managed via BindPlane OP—as the primary ingestion method, with legacy forwarders set for deprecation by January 2027.

#### 1. Prerequisites in Google Chronicle

Before configuring Apica, you must establish the "landing zone" in Google Cloud:

1. Service Account: Create a Google Cloud Service Account with the Chronicle API Admin (or `roles/chroniclesm.admin`) role.
2. Generate JSON Key: Download the service account's JSON key file. This is the credential Apica will use to authenticate.
3. Capture IDs: Note your Customer ID (found in Chronicle under _Settings > Profile_) and your Project ID.
4. Identify Log Type: Determine the standard Google Chronicle `log_type` (e.g., `WINEVTLOG`, `SYSLOG`, or `CUSTOM_JSON`) for your data.

#### 2. Configuration Strategy: The Forwarder

In the Apica Flow (Ascent) UI, you will configure a target destination using the OTLP/HTTP protocol. Google’s modern ingestion path uses the DataPlane API.

| **Field**        | **Value**                                                                                                                              |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| Destination Name | `Google_Chronicle_Forwarder`                                                                                                           |
| Endpoint         | `https://<region>-chronicle.googleapis.com/v1/projects/<project-id>/locations/<region>/instances/<customer-id>/logEntries:batchCreate` |
| Protocol         | `http/protobuf`                                                                                                                        |
| Authentication   | Google Service Account (JSON Key)                                                                                                      |

#### 3. Detailed Reference: Metadata & Mapping (OTTL)

Chronicle relies on the `chronicle_log_type` label to route data to the correct parser. If this label is missing, logs will fall back to unstructured data.

**Mandatory Mapping Logic in Apica Flow**

SQL

```
# 1. Assign the Chronicle Log Type (CRITICAL)
# This tells Chronicle which parser to apply to the raw data
set(resource.attributes["chronicle_log_type"], "APICA_SYNTHETICS")

# 2. Define the Namespace (Optional)
# Helps segment data from different environments or business units
set(resource.attributes["chronicle_namespace"], "Production")

# 3. Map the Log Body
# Ensure the raw message is in a field Chronicle can index
set(attributes["log_text"], body)
```

#### 4. Implementation Reference: Exporter Configuration

If using the Apica Fleet Agent (which manages an OTel Collector), your YAML configuration will utilize the `googlecloudlog` or a generic `otlphttp` exporter configured for Chronicle:

YAML

```
exporters:
  googlecloud/chronicle:
    project: "your-gcp-project-id"
    log_config:
      # Maps OTel attributes to Chronicle-specific ingestion labels
      log_type: "APICA_SECURITY_EVENTS"
    sending_queue:
      enabled: true

service:
  pipelines:
    logs:
      receivers: [otlp]
      processors: [batch, transform/chronicle_mapping]
      exporters: [googlecloud/chronicle]
```

***

#### 5. Key Implementation Notes

* Data Limits: Chronicle has a 1MB maximum size limit per uncompressed batch. Ensure your Apica batch processor is tuned to respect this limit.
* Encoding: Google Chronicle only supports UTF-8 encoding. Apica Flow handles this conversion automatically when using the standard OTLP ingestion.
* Smart Filtering: Since SIEM pricing is volume-sensitive, use Apica Flow to filter out routine "Success" logs. For example, only forward synthetic check failures or detected security anomalies (like prompt injections) to Chronicle.
* BindPlane Transition: If you are migrating from the legacy forwarder, you can use the BindPlane OP management console directly within Apica to manage these OTel agents across your fleet.
