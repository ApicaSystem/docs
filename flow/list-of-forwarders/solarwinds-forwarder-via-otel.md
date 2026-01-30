# SolarWinds Forwarder (via OTel)

This guide explains how to forward logs from **Apica Ascent / Flow** to **SolarWinds Observability** using the **OpenTelemetry (OTLP) Logs Forwarder** over HTTPS.

SolarWinds Observability supports **OpenTelemetry Protocol (OTLP) over HTTP** for direct ingestion of logs, metrics, and traces. You can configure Apica’s OTLP Logs Forwarder to push logs to SolarWinds’s OTLP logs endpoint without an intermediate collector.

***

### Prerequisites

Before configuring the forwarder:

* Logs must already be ingested into **Apica Ascent**
* You have permissions in the **Ascent UI** to create forwarders
* You are using a SolarWinds Observability SaaS account
* You have the **SolarWinds data center name** used by your organization (e.g., `na-01`, `na-02`, `eu-01`, `ap-01`) — visible in your SolarWinds SaaS URL (e.g., `https://my.na-01.cloud.solarwinds.com`)
* You have a valid **SolarWinds API token** capable of being used for direct OTLP ingestion (typically a bearer token)

***

### SolarWinds OTLP Endpoints

SolarWinds publishes the following OTLP ingestion endpoints. Whether you use these directly or through agents/collectors, the **OTLP/HTTP logs path** is supported.

#### OTLP/HTTP Logs Ingestion

```
https://otel.collector.<DC>.cloud.solarwinds.com/v1/logs
```

Where `<DC>` is your data center (for example, `na-01`, `na-02`, `eu-01`, `ap-01`).

**Example**

```
https://otel.collector.na-01.cloud.solarwinds.com/v1/logs
```

SolarWinds also publishes a separate “HTTPS logs collector” endpoint (`logs.collector.<DC>.cloud.solarwinds.com/v1/logs`), but the **OTLP/HTTP ingress documented for telemetry** includes the OTLP paths under `otel.collector`.

***

### How It Works with Apica

Apica’s OpenTelemetry Logs Forwarder supports **OTLP over HTTP** endpoints and can send logs using the same OTLP/HTTP path that SolarWinds documents for OTLP ingestion. This means you can point the forwarder at SolarWinds’s OTLP logs endpoint (`v1/logs`) and pass your API token in the authorization header.

> ✔ Apica’s forwarder **only** supports OTLP/HTTP — not OTLP gRPC.\
> ✔ The SolarWinds OTLP/HTTP endpoint listed above **does** support OTLP over HTTPS.

***

### Configure the OTLP Logs Forwarder in Apica

#### 1) Create a Forwarder

In the Apica Ascent UI:

1. Go to **Forwarders**
2. Click **Create Forwarder**
3. Select **OpenTelemetry Logs** as the type

#### 2) Enter Forwarder Settings

| Field             | Configuration                                              |
| ----------------- | ---------------------------------------------------------- |
| **Name**          | `solarwinds-otlp-logs`                                     |
| **Endpoint**      | `https://otel.collector.<DC>.cloud.solarwinds.com/v1/logs` |
| **Headers**       | `authorization=Bearer <SOLARWINDS_API_TOKEN>`              |
| **Output Format** | `proto`                                                    |

**Important**

* Replace `<DC>` with your SolarWinds data center (e.g., `na-01`).
* Use a valid **authorization token** for SolarWinds OTLP ingestion
* Set `output_format` to `proto` for optimal compatibility

***

### Map Forwarder to Log Sources

After creating the forwarder:

1. Navigate to **Explore**
2. Choose the application or namespace whose logs you want to send
3. Click the **Actions (⋯)** menu
4. Select **Map Forwarder**
5. Choose the newly created `solarwinds-otlp-logs`
6. Click **Save**

Logs from the mapped application will now be forwarded to SolarWinds using OTLP/HTTP.
