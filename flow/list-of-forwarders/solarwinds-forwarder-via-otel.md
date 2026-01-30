# SolarWinds Forwarder (via OTel)

This guide explains how to forward logs from Apica Ascent / Flow to SolarWinds Observability using the OpenTelemetry (OTLP) Logs Forwarder over HTTPS.

The OpenTelemetry Logs Forwarder converts logs ingested into Apica into OTLP-compliant log data and forwards them to a remote OTLP/HTTP endpoint.

***

### Prerequisites

Before configuring the forwarder, ensure the following:

* Logs are already being ingested into Apica Ascent
* You have access to the Ascent UI with permissions to create forwarders
* You have a SolarWinds Observability account
* You have a valid SolarWinds ingestion API token

***

### SolarWinds OTLP Logs Endpoint

SolarWinds supports OpenTelemetry log ingestion over HTTPS using the OTLP/HTTP protocol.

**Endpoint format**

```
https://otel.collector.<DATA_CENTER>.cloud.solarwinds.com/v1/logs
```

**Example**

```
https://otel.collector.na-01.cloud.solarwinds.com/v1/logs
```

Authentication is performed using an HTTP authorization header.

**Required header**

```
Authorization: Bearer <SOLARWINDS_API_TOKEN>
```

**Note:**\
SolarWinds also exposes a non-OTLP HTTPS logs endpoint, but Apica uses the OTLP-specific collector endpoint shown above.

***

### Create an OpenTelemetry Logs Forwarder

1. In the Ascent UI, navigate to **Forwarders**
2. Select **Create Forwarder**
3. Choose **OpenTelemetry Logs** as the forwarder type

***

### Configuration Fields

| Field         | Description                                                                |
| ------------- | -------------------------------------------------------------------------- |
| Name          | A descriptive name for the forwarder (for example, `solarwinds-otlp-logs`) |
| Endpoint      | The SolarWinds OTLP logs endpoint                                          |
| Headers       | HTTP headers to include with each request                                  |
| Output Format | OTLP payload format                                                        |

***

### Example Configuration

**Endpoint**

```
https://otel.collector.na-01.cloud.solarwinds.com/v1/logs
```

**Headers**

```
Authorization=Bearer <SOLARWINDS_API_TOKEN>
```

**Output Format**

```
proto
```

**Note:**\
SolarWinds supports OTLP/HTTP and recommends using the `proto` format for best performance.

***

### Map the Forwarder to Log Sources

Creating a forwarder does not automatically forward logs. You must map the forwarder to the applications or namespaces whose logs you want to forward.

#### Map via Explore

1. Navigate to **Explore**
2. Select the application or namespace receiving logs
3. Open the **Actions (⋯)** menu
4. Select **Map Forwarder**
5. Choose the SolarWinds OTLP logs forwarder
6. Save the mapping

Once mapped, all logs for the selected scope will be forwarded to SolarWinds.
