# Microsoft Sentinel (via OTel)

Building a forwarder from Apica Ascent (Flow) to Microsoft Sentinel via OpenTelemetry (OTel) follows the same architectural pattern as other OTLP destinations, but with a unique twist: Sentinel's ingestion is powered by Azure Monitor’s Logs Ingestion API.

Because Sentinel is built on a Log Analytics Workspace, your Apica forwarder must be configured to talk to a Data Collection Endpoint (DCE) using a Data Collection Rule (DCR).

### 1. Prerequisites in Azure/Sentinel

Before you touch the Apica UI, you must prepare the Azure environment to receive the OTel stream:

1. Register an App (Service Principal):
   * Go to Microsoft Entra ID > App Registrations.
   * Note your `Client ID`, `Tenant ID`, and create a `Client Secret`.
2. Create a Data Collection Endpoint (DCE):
   * In the Azure Portal, search for Data Collection Endpoints.
   * Note the Logs Ingestion URI (e.g., `https://my-dce-xxxx.eastus-1.ingest.monitor.azure.com`).
3. Create a Custom Table & Data Collection Rule (DCR):
   * In your Log Analytics Workspace (where Sentinel is enabled), create a new DCR-based custom table.
   * Ensure the table name starts with `Custom-` (e.g., `Custom-ApicaLogs_CL`).
   * Note the Immutable ID (Rule ID) of the DCR.
4. Assign Permissions:
   * In the DCR, go to Access Control (IAM) and assign the Monitoring Metrics Publisher role to your App Registration.

### 2. Configuration Strategy: The OTLP/HTTP Forwarder

In Apica Ascent, you will create a target destination using the OTLP/HTTP protocol.

| **Field**        | **Value**                                                                                                                 |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Destination Name | `Microsoft_Sentinel_Forwarder`                                                                                            |
| Endpoint         | `https://<DCE-Ingestion-URI>/dataCollectionRules/<DCR-Immutable-ID>/streams/<Stream-Name>?api-version=2021-11-01-preview` |
| Protocol         | `http/protobuf`                                                                                                           |
| Auth Strategy    | OAuth2 / Client Credentials                                                                                               |

#### Authentication Header Mapping

Since Azure requires a Bearer token from Microsoft Entra ID, you can use the Apica Flow Vault to handle the OAuth2 handshake, or manually inject the headers if using a sidecar:

* Header Key: `Authorization`
* Header Value: `Bearer <Entra-ID-Token>`

### 3. Detailed Reference: Metadata & Enrichment (OTTL)

Sentinel requires your data to match the schema defined in your DCR. You must use Apica's transformation layer to map OTel logs to your custom Sentinel columns.

SQL

```
# 1. Map OTel body to a specific Sentinel column
set(attributes["RawData"], body)

# 2. Add mandatory Sentinel metadata
set(attributes["TimeGenerated"], timestamp)
set(attributes["SourceSystem"], "Apica_Ascent")

# 3. Categorize logs for Sentinel's ASIM (Advanced Security Information Model)
set(attributes["EventCategory"], "Authentication") where attributes["log.type"] == "login"
```

### 4. Implementation Reference: Exporter Configuration

If you are defining the forwarder via a configuration bridge, your YAML will look like this:

YAML

```
exporters:
  otlphttp/sentinel:
    # The endpoint points to your specific DCR stream
    endpoint: "https://<DCE-URI>/dataCollectionRules/<DCR-ID>/streams/Custom-ApicaLogs_CL?api-version=2021-11-01-preview"
    auth:
      authenticator: oauth2client

extensions:
  oauth2client:
    client_id: "<AZURE_CLIENT_ID>"
    client_secret: "<AZURE_CLIENT_SECRET>"
    token_url: "https://login.microsoftonline.com/<TENANT_ID>/oauth2/v2.0/token"
    scopes: ["https://monitor.azure.com//.default"]

service:
  pipelines:
    logs:
      receivers: [otlp]
      processors: [batch, transform/sentinel_mapping]
      exporters: [otlphttp/sentinel]
```

### 5. Key Implementation Notes

* API Versioning: Ensure you use the correct `api-version` query parameter in the endpoint URL; otherwise, Azure Monitor will reject the OTLP payload.
* Schema Matching: Sentinel is extremely strict. If your Apica data contains a field that isn't defined in the DCR schema, the entire batch may be dropped. Use the `keep_keys` OTTL function in Apica to only send exactly what Sentinel expects.
* Cost Filtering: Sentinel ingestion costs can be significant. Use Apica Flow to filter out "Heartbeat" or "Info" logs before they leave your network.

Video: [Microsoft Sentinel Log Ingestion API tutorial](https://www.youtube.com/watch?v=DicSLv0xPnw)

This video explains how to transform telemetry data into a format suitable for complex security platforms like Sentinel, ensuring your log schemas align perfectly with the target destination.
