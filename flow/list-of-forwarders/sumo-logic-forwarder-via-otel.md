---
hidden: true
---

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
* OpenTelemetry clients send data to this URL using signal-specific paths

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

After saving, click **Show URL** to copy the **Presigned URL**.

This URL will look similar to:

```
https://endpoint4.collection.sumologic.com/receiver/v1/otlp/AUTH_TICKET
```

***

### Configure the OpenTelemetry Logs Forwarder in Apica

In the **Ascent UI**, create a new forwarder:

1. Navigate to **Forwarders**
2. Select **Create Forwarder**
3. Choose **OpenTelemetry Logs**

***

### Forwarder Configuration

**NOTE: In order for Sumo Logic to correctly receive logs, in your endpoint URL, change "otlp" to "http".**&#x20;

#### Required Fields

<table><thead><tr><th>Field</th><th width="386">Value</th></tr></thead><tbody><tr><td><strong>Name</strong></td><td><code>sumologic-otlp-logs</code></td></tr><tr><td><strong>Endpoint</strong></td><td><code>&#x3C;OTLP_HTTP_SOURCE_URL>/v1/http/AUTH_TOKEN</code></td></tr><tr><td><strong>Headers</strong></td><td>ApicaID=Sumo</td></tr><tr><td><strong>Output Format</strong></td><td><code>proto</code></td></tr></tbody></table>

#### Example Endpoint&#x20;

Don't forget to change "otlp" to "http"!

```
https://endpoint4.collection.sumologic.com/receiver/v1/http/AUTH_TICKET
```

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
