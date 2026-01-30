# Honeycomb Forwarder (via OTel)

This guide explains how to forward logs from Apica Ascent / Flow to Honeycomb using the OpenTelemetry (OTLP) Logs Forwarder over HTTPS.

The OpenTelemetry Logs Forwarder converts logs ingested into Apica into OTLP-compliant log data and forwards them to a remote OTLP/HTTP endpoint.

***

#### Prerequisites

Before configuring the forwarder, ensure the following:

* Logs are already being ingested into Apica Ascent
* You have access to the Ascent UI with permissions to create forwarders
* You have a Honeycomb account
* You have a valid Honeycomb API key with permissions to ingest telemetry

***

#### Honeycomb OTLP Logs Endpoint

Honeycomb supports OpenTelemetry log ingestion over HTTPS using the OTLP/HTTP protocol.

**Endpoint format**

```
https://api.honeycomb.io/v1/logs
```

**EU region**

```
https://api.eu1.honeycomb.io/v1/logs
```

Authentication is performed using a Honeycomb-specific HTTP header.

**Required header**

```
x-honeycomb-team: <HONEYCOMB_API_KEY>
```

**Optional header**

```
x-honeycomb-dataset: <DATASET_NAME>
```

If the dataset header is omitted, Honeycomb uses the default dataset associated with the API key.

**Note:**\
Honeycomb requires TLS for all ingest traffic and recommends OTLP/HTTP using the `proto` format for best performance.

***

#### Create an OpenTelemetry Logs Forwarder

1. In the Ascent UI, navigate to **Forwarders**
2. Select **Create Forwarder**
3. Choose **OpenTelemetry Logs** as the forwarder type

***

#### Configuration Fields

| Field         | Description                                                               |
| ------------- | ------------------------------------------------------------------------- |
| Name          | A descriptive name for the forwarder (for example, `honeycomb-otlp-logs`) |
| Endpoint      | The Honeycomb OTLP logs endpoint                                          |
| Headers       | HTTP headers required by Honeycomb                                        |
| Output Format | OTLP payload format                                                       |

***

#### Example Configuration

**Endpoint**

```
https://api.honeycomb.io/v1/logs
```

**Headers**

```
x-honeycomb-team=<HONEYCOMB_API_KEY>
```

**Output Format**

```
proto
```

***

#### Map the Forwarder to Log Sources

Creating a forwarder does not automatically forward logs. You must map the forwarder to the applications or namespaces whose logs you want to forward.

**Map via Explore**

1. Navigate to **Explore**
2. Select the application or namespace receiving logs
3. Open the **Actions (⋯)** menu
4. Select **Map Forwarder**
5. Choose the Honeycomb OTLP logs forwarder
6. Save the mapping

Once mapped, all logs for the selected application or namespace will be forwarded to Honeycomb.
