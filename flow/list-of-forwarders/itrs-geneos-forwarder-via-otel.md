# ITRS Geneos Forwarder (via OTel)

This guide explains how to forward logs from **Apica Ascent / Flow** to **Geneos** using the **OpenTelemetry (OTLP) Logs Forwarder** over HTTPS.

The OpenTelemetry Logs Forwarder converts logs ingested into Apica into OTLP-compliant log data and forwards them to a remote OTLP/HTTP endpoint.

***

### Prerequisites

Before configuring the forwarder, ensure the following:

* Logs are already being ingested into **Apica Ascent**
* You have access to the **Ascent UI** with permissions to create forwarders
* You have a **Geneos deployment** with OpenTelemetry ingestion enabled
* You have a valid **Geneos API token or credentials** for OTLP ingestion

***

### Geneos OpenTelemetry Support

Geneos supports **OpenTelemetry ingestion** via **OTLP over HTTP**. OTLP endpoints and authentication details are **deployment-specific** and may vary depending on whether Geneos is deployed on-premises, in the cloud, or as part of a managed service.

> **Note:**\
> Confirm the exact OTLP logs endpoint and authentication requirements with your Geneos administrator or Geneos documentation before proceeding.

***

### Geneos OTLP Logs Endpoint

**Endpoint format (example):**

```
https://<GENEOS_HOST>/otlp/v1/logs
```

Authentication is typically performed using an API token or bearer token passed via HTTP headers.

***

### Create an OpenTelemetry Logs Forwarder

1. In the **Ascent UI**, navigate to **Forwarders**
2. Select **Create Forwarder**
3. Choose **OpenTelemetry Logs** as the forwarder type

***

### Configuration Fields

| Field             | Description                                                            |
| ----------------- | ---------------------------------------------------------------------- |
| **Name**          | A descriptive name for the forwarder (for example, `geneos-otlp-logs`) |
| **Endpoint**      | The Geneos OTLP logs endpoint                                          |
| **Headers**       | HTTP headers to include with each request                              |
| **Output Format** | OTLP payload format                                                    |

***

### Example Configuration

**Endpoint**

```
https://<GENEOS_HOST>/otlp/v1/logs
```

**Headers**

```
Authorization=Bearer <GENEOS_API_TOKEN>
```

**Output Format**

```
proto
```

> **Note:**\
> The OpenTelemetry Logs Forwarder sends OTLP payloads over HTTP. Geneos supports OTLP/HTTP and recommends using the `proto` format for efficient ingestion.

***

### Map the Forwarder to Log Sources

Creating a forwarder does not automatically forward logs. You must map the forwarder to the applications or namespaces whose logs you want to forward.

#### Map via Explore

1. Navigate to **Explore**
2. Select the application or namespace receiving logs
3. Open the **Actions (⋯)** menu
4. Select **Map Forwarder**
5. Choose the Geneos OTLP logs forwarder
6. Save the mapping

Once mapped, all logs for the selected application or namespace will be forwarded to Geneos.
