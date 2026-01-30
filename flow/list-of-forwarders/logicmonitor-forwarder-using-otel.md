# LogicMonitor Forwarder (using OTel)

This guide explains how to forward logs from **Apica Ascent / Flow** to **LogicMonitor** using the **OpenTelemetry (OTLP) Logs Forwarder** over HTTPS.

The OpenTelemetry Logs Forwarder converts logs ingested into Apica into OTLP-compliant log data and forwards them to a remote OTLP/HTTP endpoint.

***

### Prerequisites

Before configuring the forwarder, ensure the following:

* Logs are already being ingested into **Apica Ascent**
* You have access to the **Ascent UI** with permissions to create forwarders
* You have a **LogicMonitor account**
* You have:
  * A **LogicMonitor API token** with ingest permissions
  * Your **LogicMonitor company name** (account identifier)

***

### LogicMonitor OpenTelemetry Support

LogicMonitor supports **OpenTelemetry ingestion** via **OTLP over HTTP** for logs. Authentication and tenant identification are handled using HTTP headers.

***

### LogicMonitor OTLP Logs Endpoint

**Endpoint**

```
https://otlp.logicmonitor.com/otlp/v1/logs
```

> **Note:**\
> LogicMonitor requires both authentication and tenant identification headers for OTLP ingest.

***

### Create an OpenTelemetry Logs Forwarder

1. In the **Ascent UI**, navigate to **Forwarders**
2. Select **Create Forwarder**
3. Choose **OpenTelemetry Logs** as the forwarder type

***

### Configuration Fields

| Field             | Description                                                                  |
| ----------------- | ---------------------------------------------------------------------------- |
| **Name**          | A descriptive name for the forwarder (for example, `logicmonitor-otlp-logs`) |
| **Endpoint**      | The LogicMonitor OTLP logs endpoint                                          |
| **Headers**       | HTTP headers required for authentication and tenant identification           |
| **Output Format** | OTLP payload format                                                          |

***

### Example Configuration

**Endpoint**

```
https://otlp.logicmonitor.com/otlp/v1/logs
```

**Headers**

```
Authorization=Bearer <LOGICMONITOR_API_TOKEN>,X-LM-Company=<LOGICMONITOR_COMPANY_NAME>
```

**Output Format**

```
proto
```

> **Note:**\
> The OpenTelemetry Logs Forwarder sends OTLP payloads over HTTP. LogicMonitor supports OTLP/HTTP and recommends using the `proto` format for optimal performance.

***

### Map the Forwarder to Log Sources

Creating a forwarder does not automatically forward logs. You must map the forwarder to the applications or namespaces whose logs you want to forward.

#### Map via Explore

1. Navigate to **Explore**
2. Select the application or namespace receiving logs
3. Open the **Actions (⋯)** menu
4. Select **Map Forwarder**
5. Choose the LogicMonitor OTLP logs forwarder
6. Save the mapping

Once mapped, all logs for the selected application or namespace will be forwarded to LogicMonitor.
