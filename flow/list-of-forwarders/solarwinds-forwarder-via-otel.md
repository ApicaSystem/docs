# SolarWinds Forwarder (via OTel)

This guide explains how to forward logs from **Apica Ascent / Flow** to **SolarWinds Observability** using the **OpenTelemetry (OTLP) Logs Forwarder** over HTTPS.

SolarWinds Observability provides a **dedicated HTTPS Logs Collector endpoint** that supports **OTLP over HTTP** for log ingestion. Apica’s OpenTelemetry Logs Forwarder can send logs directly to this endpoint without deploying an intermediate OpenTelemetry Collector.

***

### Prerequisites

Before configuring the forwarder, ensure the following:

* Logs are already being ingested into **Apica Ascent**
* You have access to the **Ascent UI** with permissions to create forwarders
* You have a **SolarWinds Observability account**
* You have a valid **SolarWinds Observability API token** with log ingestion permissions
* You know your **SolarWinds data center** (for example, `na-01`, `eu-01`, `ap-01`)

***

### SolarWinds OpenTelemetry Log Ingestion

SolarWinds Observability supports **direct log ingestion over HTTPS** using **OpenTelemetry Protocol (OTLP) over HTTP**.

For logs, SolarWinds exposes a **signal-specific HTTPS Logs Collector endpoint**, which accepts OTLP log payloads at the standard `/v1/logs` path.

> **Important**\
> Apica’s OpenTelemetry Logs Forwarder supports **OTLP over HTTP only**.\
> OTLP/gRPC endpoints and generic OTEL collector endpoints are **not supported** by this forwarder.

***

### SolarWinds HTTPS Logs Collector Endpoint

Use the HTTPS Logs Collector endpoint for your SolarWinds data center.

#### Endpoint format

```
https://logs.collector.<DC>.cloud.solarwinds.com/v1/logs
```

#### Examples

```
https://logs.collector.na-01.cloud.solarwinds.com/v1/logs
https://logs.collector.eu-01.cloud.solarwinds.com/v1/logs
```

Replace `<DC>` with the data center assigned to your SolarWinds Observability account.

***

### Create an OpenTelemetry Logs Forwarder

1. In the **Ascent UI**, navigate to **Forwarders**
2. Select **Create Forwarder**
3. Choose **OpenTelemetry Logs** as the forwarder type

***

### Configuration Fields

| Field             | Description                                                                |
| ----------------- | -------------------------------------------------------------------------- |
| **Name**          | A descriptive name for the forwarder (for example, `solarwinds-otlp-logs`) |
| **Endpoint**      | The SolarWinds HTTPS Logs Collector endpoint                               |
| **Headers**       | HTTP headers required for authentication                                   |
| **Output Format** | OTLP payload format                                                        |

***

### Example Configuration

**Endpoint**

```
https://logs.collector.<DC>.cloud.solarwinds.com/v1/logs
```

**Headers**

```
authorization=Bearer <SOLARWINDS_API_TOKEN>
```

**Output Format**

```
proto
```

> **Notes**
>
> * Header keys are case-insensitive.
> * Multiple headers can be specified using a comma-separated list.
> * The `proto` output format is recommended for performance and compatibility.

***

### Map the Forwarder to Log Sources

Creating a forwarder does not automatically forward logs. You must map it to the applications or namespaces whose logs you want to send to SolarWinds Observability.

1. Navigate to **Explore**
2. Select the application or namespace receiving logs
3. Open the **Actions (⋯)** menu
4. Select **Map Forwarder**
5. Choose the SolarWinds OTLP logs forwarder
6. Save the mapping

Only mapped sources will forward logs to SolarWinds.
