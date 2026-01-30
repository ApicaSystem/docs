# IBM Instana (via OTel)

This guide explains how to forward logs from Apica Ascent / Flow to IBM Instana using the OpenTelemetry (OTLP) Logs Forwarder over HTTPS.

The OpenTelemetry Logs Forwarder converts logs ingested into Apica into OTLP-compliant log data and forwards them to Instana.

***

#### Prerequisites

Before configuring the forwarder, ensure the following:

* Logs are already being ingested into Apica Ascent
* You have access to the Ascent UI with permissions to create forwarders
* You have an IBM Instana account
* You have a valid Instana agent key
* You know your Instana backend region

***

#### Instana OTLP Logs Endpoint (Direct to Backend)

Instana supports OTLP/HTTP ingestion directly into its SaaS backend.

**Endpoint format**

```
https://otlp-<COLOR>-saas.instana.io:4318/v1/logs
```

**Example**

```
https://otlp-blue-saas.instana.io:4318/v1/logs
```

***

#### Authentication

Instana requires the agent key to be sent as a custom HTTP header.

**Required header**

```
x-instana-key: <INSTANA_AGENT_KEY>
```

Instana also requires host identity metadata.

This can be provided using **either**:

* HTTP header:

```
x-instana-host: <HOST_ID>
```

**OR**

* OpenTelemetry resource attribute:

```
host.id
```

***

#### Example Configuration

**Endpoint**

```
https://otlp-blue-saas.instana.io:4318/v1/logs
```

**Headers**

```
x-instana-key=<INSTANA_AGENT_KEY>
```

**Output Format**

```
proto
```

***

#### Map the Forwarder to Log Sources

Use **Explore → Map Forwarder** to attach the Instana OTLP logs forwarder to the desired applications or namespaces.
