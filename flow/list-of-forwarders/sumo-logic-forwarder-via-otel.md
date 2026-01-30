# Sumo Logic Forwarder (via OTel)

This guide explains how to forward logs from **Apica Ascent / Flow** to **Sumo Logic** using the **OpenTelemetry (OTLP) Logs Forwarder** over HTTPS.

Sumo Logic supports **OTLP over HTTP ingestion** for logs through an **OTLP/HTTP Source** that you create in the Sumo Logic UI. Apica’s OpenTelemetry Logs Forwarder can send logs directly to this endpoint without deploying an intermediate OpenTelemetry Collector.

***

### Prerequisites

Before configuring the forwarder, ensure the following:

* Logs are already being ingested into **Apica Ascent**
* You have access to the **Ascent UI** with permissions to create forwarders
* You have a **Sumo Logic account**
* You can create or modify **Hosted Collectors and Sources** in Sumo Logic

***

### How Sumo Logic Ingests OpenTelemetry Logs

Sumo Logic ingests OpenTelemetry data using **OTLP/HTTP Sources** that are attached to a **Hosted Collector**.

Key points:

* You must create an **OTLP/HTTP Source** in Sumo Logic
* Sumo Logic generates a **unique source URL**
* OpenTelemetry clients send data to this URL using signal-specific paths:
  * `/v1/logs` for logs
  * `/v1/metrics` for metrics
  * `/v1/traces` for traces
* Authentication is handled by the **source URL itself** (no API token header is required)

> **Important**\
> You cannot use a generic or static Sumo Logic OTLP endpoint.\
> The **generated OTLP/HTTP Source URL is required** to associate data with your account.

***

### Create an OTLP/HTTP Source in Sumo Logic

1. Log in to **Sumo Logic**
2. Navigate to **Manage Data → Collection**
3. Select an existing **Hosted Collector** (or create one)
4. Click **Add Source**
5. Choose **OTLP/HTTP**
6. Enter a **Name** (for example, `Apica OTLP Logs`)
7. (Optional) Set metadata such as _Source Category_
8. Click **Save**

After saving, click **Show URL** to copy the **OTLP/HTTP Source base URL**.

This URL will look similar to:

```
https://<unique-id>.collection.<region>.sumologic.com/otlp
```

***

### Configure the OpenTelemetry Logs Forwarder in Apica

In the **Ascent UI**, create a new forwarder:

1. Navigate to **Forwarders**
2. Select **Create Forwarder**
3. Choose **OpenTelemetry Logs**

***

### Forwarder Configuration

#### Required Fields

| Field             | Value                            |
| ----------------- | -------------------------------- |
| **Name**          | `sumologic-otlp-logs`            |
| **Endpoint**      | `<OTLP_HTTP_SOURCE_URL>/v1/logs` |
| **Headers**       | _(none required)_                |
| **Output Format** | `proto`                          |

#### Example Endpoint

```
https://abcd1234.collection.us2.sumologic.com/otlp/v1/logs
```

> **Notes**
>
> * Do **not** omit `/v1/logs`
> * Do **not** add authentication headers
> * Use `proto` for optimal compatibility and performance

***

### Map the Forwarder to Log Sources

Creating the forwarder does not automatically forward logs.

To enable forwarding:

1. Go to **Explore**
2. Select the application or namespace receiving logs
3. Open the **Actions (⋯)** menu
4. Select **Map Forwarder**
5. Choose `sumologic-otlp-logs`
6. Save

Only mapped sources will send logs to Sumo Logic.
