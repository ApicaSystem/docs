# Chronosphere Forwarder (via OTel)

This guide explains how to forward logs from **Apica Ascent / Flow** to **Chronosphere** using the **OpenTelemetry (OTLP) Logs Forwarder** over HTTPS.

The OpenTelemetry Logs Forwarder converts logs ingested into Apica into OTLP-compliant log data and forwards them to a remote OTLP/HTTP endpoint.

***

### Prerequisites

Before configuring the forwarder, ensure the following:

* Logs are already being ingested into **Apica Ascent**
* You have access to the **Ascent UI** with permissions to create forwarders
* You have a **Chronosphere tenant** with OTLP logs ingestion enabled
* You have a valid **Chronosphere API token** with write permissions

***

### Chronosphere OTLP Logs Endpoint

Chronosphere accepts OpenTelemetry logs over HTTPS using the OTLP/HTTP protocol.

**Endpoint format:**

```
https://<TENANT>.chronosphere.io/data/opentelemetry/v1/logs
```

Authentication is performed using an HTTP header containing an API token.

***

### Create an OpenTelemetry Logs Forwarder

1. In the **Ascent UI**, navigate to **Forwarders**
2. Select **Create Forwarder**
3. Choose **OpenTelemetry Logs** as the forwarder type

#### Configuration Fields

| Field             | Description                                                                  |
| ----------------- | ---------------------------------------------------------------------------- |
| **Name**          | A descriptive name for the forwarder (for example, `chronosphere-otlp-logs`) |
| **Endpoint**      | The Chronosphere OTLP logs endpoint                                          |
| **Headers**       | HTTP headers to include with each request                                    |
| **Output Format** | Proto/JSON                                                                   |

#### Example Configuration

**Endpoint**

```
https://<TENANT>.chronosphere.io/data/opentelemetry/v1/logs
```

**Headers**

```
API-Token=<CHRONOSPHERE_API_TOKEN>
```

**Output Format**

```
proto
```

> **Note:**\
> The OpenTelemetry Logs Forwarder uses **HTTP only**. Chronosphere OTLP log ingestion supports OTLP over HTTP and requires TLS.

***

### Map the Forwarder to Log Sources

Creating a forwarder does not automatically forward all logs. You must map the forwarder to the applications or namespaces whose logs you want to forward.

#### Map via Explore

1. Navigate to **Explore**
2. Select the application or namespace receiving logs
3. Open the **Actions (⋯)** menu
4. Select **Map Forwarder**
5. Choose the Chronosphere OTLP logs forwarder
6. Save the mapping

Once mapped, all logs for the selected application or namespace will be forwarded to Chronosphere.
