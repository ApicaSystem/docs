# IBM Instana (via OTel)

This guide explains how to forward logs from **Apica Ascent / Flow** to **Instana** using the **OpenTelemetry (OTLP) Logs Forwarder** over HTTPS.

The OpenTelemetry Logs Forwarder converts logs ingested into Apica into OTLP-compliant log data and forwards them to a remote OTLP/HTTP endpoint.

***

### Prerequisites

Before configuring the forwarder, ensure the following:

* Logs are already being ingested into **Apica Ascent**
* You have access to the **Ascent UI** with permissions to create forwarders
* You have an **Instana tenant**
* You have a valid **Instana API token** with permissions to ingest telemetry

***

### Instana OTLP Logs Endpoint

Instana supports OpenTelemetry log ingestion over HTTPS using the OTLP/HTTP protocol.

**Endpoint format:**

```
https://<INSTANA_TENANT>/api/otlp/v1/logs
```

> **Note:**\
> The exact endpoint hostname and path may vary depending on your Instana region and deployment model. Refer to Instana documentation for the correct OTLP endpoint for your tenant.

Authentication is performed using an API token passed in an HTTP header.

***

### Create an OpenTelemetry Logs Forwarder

1. In the **Ascent UI**, navigate to **Forwarders**
2. Select **Create Forwarder**
3. Choose **OpenTelemetry Logs** as the forwarder type

***

### Configuration Fields

| Field             | Description                                                             |
| ----------------- | ----------------------------------------------------------------------- |
| **Name**          | A descriptive name for the forwarder (for example, `instana-otlp-logs`) |
| **Endpoint**      | The Instana OTLP logs endpoint                                          |
| **Headers**       | HTTP headers to include with each request                               |
| **Output Format** | OTLP payload format                                                     |

***

### Example Configuration

**Endpoint**

```
https://<INSTANA_TENANT>/api/otlp/v1/logs
```

**Headers**

```
Authorization=apiToken <INSTANA_API_TOKEN>
```

**Output Format**

```
proto
```

> **Note:**\
> The OpenTelemetry Logs Forwarder sends OTLP payloads over HTTP. Instana supports OTLP/HTTP and recommends using the `proto` format for optimal performance.

***

### Map the Forwarder to Log Sources

Creating a forwarder does not automatically forward logs. You must map the forwarder to the applications or namespaces whose logs you want to forward.

#### Map via Explore

1. Navigate to **Explore**
2. Select the application or namespace receiving logs
3. Open the **Actions (⋯)** menu
4. Select **Map Forwarder**
5. Choose the Instana OTLP logs forwarder
6. Save the mapping

Once mapped, all logs for the selected application or namespace will be forwarded to Instana.
