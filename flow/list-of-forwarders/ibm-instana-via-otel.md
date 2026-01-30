# IBM Instana (via OTel)

This guide explains how to forward logs from **Apica Ascent / Flow** to **Instana** using the **OpenTelemetry (OTLP) Logs Forwarder**.

Instana supports receiving OpenTelemetry logs in **two supported deployment models**:

1. **Via the Instana Host Agent (recommended and most common)**
2. **Directly to the Instana Backend OTLP Acceptor (agentless)**

Both approaches are supported by Apica’s OpenTelemetry Logs Forwarder and are described below.

***

### Prerequisites

Before configuring the forwarder, ensure the following:

* Logs are already being ingested into **Apica Ascent**
* You have access to the **Ascent UI** with permissions to create forwarders
* You have an **Instana environment**
* You have:
  * An **Instana agent key**
  * OpenTelemetry log ingestion **enabled and licensed** in Instana

> **Important**\
> OpenTelemetry log ingestion in Instana requires a **licensed add-on**. Verify entitlement before proceeding.

***

### Instana OpenTelemetry Ingestion Models

Instana does **not** expose a single global OTLP endpoint like `https://…/v1/logs`. Instead, it supports OpenTelemetry ingestion through the following models.

***

### Option 1: Forward Logs via the Instana Host Agent (Recommended)

In this model, Apica forwards logs to an OpenTelemetry endpoint exposed by the **Instana host agent**, which then forwards data to the Instana backend.

#### Architecture

```
Apica Ascent → OTLP (HTTP/gRPC) → Instana Host Agent → Instana Backend
```

#### When to use this option

* You already run the Instana agent on hosts or Kubernetes nodes
* You want Instana to manage authentication, routing, and enrichment
* You want the most common and supportable configuration

***

#### Instana Agent OTLP Listener

The Instana host agent can accept OTLP traffic on:

* **OTLP/HTTP**: port `4318`
* **OTLP/gRPC**: port `4317`

These listeners must be enabled in the agent configuration.

***

#### Apica Forwarder Configuration (Agent-Based)

**Endpoint**

```
http://<INSTANA_AGENT_HOST>:4318
```

**Headers**

```
(none required for local agent endpoint)
```

**Output Format**

```
proto
```

***

### Option 2: Forward Logs Directly to the Instana Backend (Agentless)

Instana also supports sending OpenTelemetry data **directly to its backend OTLP acceptor**, without routing through a host agent.

This model is typically used when:

* Agents cannot be installed
* A centralized OTLP pipeline is preferred
* Instana support has enabled backend OTLP ingestion for your tenant

***

#### Instana Backend OTLP Acceptor

Instana provides **region-specific OTLP acceptor endpoints** (sometimes referred to as _color environments_). These endpoints are documented by Instana and vary by deployment.

**Example endpoint format**

```
https://otlp-<region>.saas.instana.io:4318
```

> **Note**\
> The exact hostname depends on your Instana region and must be confirmed in Instana documentation or with Instana support.

***

#### Required Authentication and Identity

When sending OTLP data directly to the backend, Instana requires:

* **Agent key** via HTTP header
* **Host identity**, provided either as:
  * an OTLP `host.id` resource attribute, **or**
  * the `x-instana-host` HTTP header

***

#### Apica Forwarder Configuration (Backend OTLP)

**Endpoint**

```
https://otlp-<region>.saas.instana.io:4318
```

**Headers**

```
x-instana-key=<INSTANA_AGENT_KEY>,x-instana-host=<STABLE_HOST_IDENTIFIER>
```

**Output Format**

```
proto
```

> **Path handling note**\
> Some OTLP implementations append `/v1/logs` automatically. If required by your configuration, use:
>
> ```
> https://otlp-<region>.saas.instana.io:4318/v1/logs
> ```

***

### Map the Forwarder to Log Sources

After creating the forwarder, you must map it to the logs you want to send.

1. Navigate to **Explore**
2. Select the application or namespace receiving logs
3. Open the **Actions (⋯)** menu
4. Select **Map Forwarder**
5. Choose the Instana OTLP logs forwarder
6. Save the mapping

Only mapped applications or namespaces will forward logs to Instana.
