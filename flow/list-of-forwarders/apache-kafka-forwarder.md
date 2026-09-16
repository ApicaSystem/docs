---
description: >-
  Send Apica Ascent logs to Kafka with configurable security, batching, and
  record formats.
---

# Apache Kafka Forwarder

The Apache Kafka forwarder sends log data from Apica Ascent to a Kafka topic. It supports plaintext, TLS, and SASL authentication, message compression, configurable batching, and three record formats: **flattened**, **nested**, and **raw**.

### Prerequisites

* A running Kafka broker, version 0.10 or later.
* A Kafka topic to forward logs to.
* `DESCRIBE` and `WRITE` permissions for the forwarder principal on the target topic.
* Network access from Apica Ascent to the broker.
* Optional TLS certificates or SASL credentials.

### Creating a Kafka Forwarder

#### Step 1 — Fill in Basic Configuration

| Field                | Required | Description                                                                                                                                |
| -------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| **Name**             | Yes      | A unique name for this forwarder.                                                                                                          |
| **Brokers**          | Yes      | Comma-separated `host:port` addresses. Example: `broker-1.example.com:9092,broker-2.example.com:19093`. Use hostnames when TLS is enabled. |
| **Topic**            | Yes      | Target Kafka topic name.                                                                                                                   |
| **Max Payload Size** | No       | Maximum bytes read from the queue per message. Default: `10000`.                                                                           |
| **Type**             | No       | Data format for forwarding. Always `_json`.                                                                                                |
| **Filter forward**   | No       | `true` applies forward filter rules. `false` sends unfiltered data. Set this to `false` for `raw` output.                                  |

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-10-25.png" alt="Kafka forwarder basic configuration"><figcaption></figcaption></figure>

#### Step 2 — Configure Security Protocol

Select the appropriate **Security Protocol** for your Kafka cluster.

| Option           | Description                              |
| ---------------- | ---------------------------------------- |
| `PLAINTEXT`      | No authentication or TLS. Default.       |
| `SSL`            | TLS encryption only. No authentication.  |
| `SASL_PLAINTEXT` | SASL authentication without TLS.         |
| `SASL_SSL`       | SASL authentication with TLS encryption. |

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-11-58.png" alt="Kafka forwarder security protocol"><figcaption></figcaption></figure>

**Step 2a — SASL Configuration**

This section appears for `SASL_PLAINTEXT` and `SASL_SSL`.

| Field              | Required | Description                                                     |
| ------------------ | -------- | --------------------------------------------------------------- |
| **SASL Username**  | Yes      | SASL username.                                                  |
| **SASL Password**  | Yes      | SASL password.                                                  |
| **SASL Mechanism** | Yes      | `PLAIN`, `SCRAM-SHA-256`, or `SCRAM-SHA-512`. Default: `PLAIN`. |

{% hint style="info" %}
Use `SCRAM-SHA-256` or `SCRAM-SHA-512` instead of `PLAIN`.
{% endhint %}

**Step 2b — TLS Configuration**

This section appears for `SSL` and `SASL_SSL`.

| Field                  | Required | Description                                                                           |
| ---------------------- | -------- | ------------------------------------------------------------------------------------- |
| **TLS Skip Verify**    | No       | Disables certificate verification. Use only for development or testing. Default: off. |
| **CA Certificate**     | No       | PEM CA certificate for broker verification. Leave empty to use the system CA pool.    |
| **Client Certificate** | No       | PEM client certificate. Required only for mTLS.                                       |
| **Client Private Key** | No       | PEM private key. Provide it with the client certificate.                              |

{% hint style="info" %}
Paste certificates directly or use **Import**. Provide both client certificate and private key, or neither.
{% endhint %}

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-22-37.png" alt="Kafka forwarder TLS configuration"><figcaption></figcaption></figure>

#### Step 3 — Buffer Configuration

The buffer queues logs locally before sending them to Kafka. It prevents loss during outages.

| Field              | Default                | Description                                                              |
| ------------------ | ---------------------- | ------------------------------------------------------------------------ |
| **Persist Buffer** | Off                    | Writes queued messages to disk. Messages survive process restarts.       |
| **Buffer Size**    | `10485760` (10 MiB)    | Maximum queue size in bytes. Visible when **Persist Buffer** is enabled. |
| **Queue Policy**   | `Drop incoming events` | Action when the buffer is full.                                          |

**Queue Policy options**

| Option                    | Behavior                                                                                      |
| ------------------------- | --------------------------------------------------------------------------------------------- |
| **Drop incoming events**  | Discards new data until backpressure clears. The pipeline continues.                          |
| **Block incoming events** | Returns `429 Too Many Requests` until backpressure clears. Ingest pauses without losing data. |

{% hint style="info" %}
Enable **Persist Buffer** in production. Use **Drop** for high-throughput pipelines. Use **Block** when completeness is critical.
{% endhint %}

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-29-52.png" alt="Kafka forwarder buffer configuration"><figcaption></figcaption></figure>

#### Step 4 — Output Format

**Output Format** controls every record written to the topic.

| Option      | What each record contains                                                                                                                                   | Use when                                                           |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| `flattened` | A flat JSON object. Nested fields use dot notation, such as `user.address.city`. Plain-value arrays stay arrays. Object arrays use keys like `items.0.sku`. | Consumers read top-level fields, including SIEMs and flat schemas. |
| `nested`    | A JSON object with log fields at the top level. Original nesting remains. This is the default when unset.                                                   | Consumers expect ingested log structure with Ascent metadata.      |
| `raw`       | The ingested payload, without a JSON envelope or Ascent metadata. JSON stays JSON. Text stays text. Pipeline rewrites still apply.                          | Replaying the original stream unchanged.                           |

The dropdown is empty for a new forwarder. An empty value uses `nested`.

The following switches appear for `flattened` and `nested`:

| Field                        | Default | Description                                                                                                                                                         |
| ---------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Include meta**             | On      | Adds `source`, `sourcetype`, `host`, `severityString`, and `timestamp`. When off, the record contains log fields only. A timestamp is added when the log lacks one. |
| **Include original message** | Off     | Adds the original line as `message`. Plain-text logs always retain `message`.                                                                                       |

Keep these behaviors in mind:

* `timestamp` uses epoch milliseconds from ingest time.
* Metadata overrides log fields with the same name.
* Fields beginning with `_`, such as `_size`, are never forwarded.
* Format changes affect only logs entering the buffer after the change.

**`raw` requires Filter forward off.** Raw mode sends the ingested line verbatim. Saving with `raw` and **Filter forward** set to `true` fails:

```
output_format 'raw' bypasses forward filtering (the original log line is sent verbatim); set filter_forward to false to use it
```

**Record examples**

Ingested log, with host `HOST_28` and source `app`:

```json
{"service":"payment","user":{"id":123,"name":"Alex","address":{"city":"BLR"}},"tags":["a","b"]}
```

`nested` with **Include meta** on:

```json
{
  "source": "app",
  "sourcetype": "_json",
  "host": "HOST_28",
  "severityString": "info",
  "timestamp": 1781026402592,
  "service": "payment",
  "user": { "id": 123, "name": "Alex", "address": { "city": "BLR" } },
  "tags": ["a", "b"]
}
```

`flattened` with **Include meta** on:

```json
{
  "source": "app",
  "sourcetype": "_json",
  "host": "HOST_28",
  "severityString": "info",
  "timestamp": 1781026402592,
  "service": "payment",
  "user.id": 123,
  "user.name": "Alex",
  "user.address.city": "BLR",
  "tags": ["a", "b"]
}
```

`flattened` with **Include meta** off:

```json
{
  "timestamp": 1781026402592,
  "service": "payment",
  "user.id": 123,
  "user.name": "Alex",
  "user.address.city": "BLR",
  "tags": ["a", "b"]
}
```

`raw`, with **Filter forward** set to `false`:

```json
{"service":"payment","user":{"id":123,"name":"Alex","address":{"city":"BLR"}},"tags":["a","b"]}
```

A plain-text line like `ERROR disk full` is sent as `{"message":"ERROR disk full", ...metadata}` in `nested` and `flattened`. Raw mode sends bare `ERROR disk full`.

#### Step 5 — Advanced Configuration

| Field                       | Default           | Description                                                                                                                               |
| --------------------------- | ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| **Compression**             | `none`            | Codec: `none`, `gzip`, `snappy`, `lz4`, or `zstd`.                                                                                        |
| **Max Attempts**            | `10`              | Maximum write retries before a batch is dropped.                                                                                          |
| **Write Timeout (seconds)** | `30`              | Timeout for one write request.                                                                                                            |
| **Dial Timeout (seconds)**  | `10`              | Time to establish one broker connection. This includes TCP, TLS, and the first round-trip. Raise it for remote brokers.                   |
| **Batch Size**              | `100`             | Maximum messages per network batch.                                                                                                       |
| **Batch Bytes**             | `1048576` (1 MiB) | Maximum bytes per network batch.                                                                                                          |
| **Partition Key**           | _(empty)_         | Fixed key for all messages. Leave empty for round-robin. Supports `{forwarder_name}` and `{forwarder_id}`, such as `logs-{forwarder_id}`. |

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-33-55.png" alt="Kafka forwarder advanced configuration"><figcaption></figcaption></figure>

#### Step 6 — Test Connection

Click **Test Connection** before saving.

Success displays **Connection successful** with “Broker is reachable and authentication passed.” Failure displays **Connection failed** with the cause.

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-40-46.png" alt="Kafka connection successful"><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-43-47.png" alt="Kafka connection error"><figcaption></figcaption></figure>

#### Step 7 — Save the Forwarder

Click **Create** to save. Select **Make this configuration default** if needed. **Successfully created the forwarder** confirms the save.

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-57-52.png" alt="Kafka forwarder save"><figcaption></figcaption></figure>

### Common Errors

| Error                                                                            | Cause                                            | Fix                                                                           |
| -------------------------------------------------------------------------------- | ------------------------------------------------ | ----------------------------------------------------------------------------- |
| `Connection refused at <host:port>`                                              | Broker is down or the port is incorrect.         | Verify the broker address and port.                                           |
| `Connection to <host:port> timed out`                                            | Firewall, routing, or broker reachability issue. | Check connectivity and firewall rules. Raise **Dial Timeout** for slow links. |
| `Cannot resolve hostname`                                                        | DNS resolution failed.                           | Check hostname spelling and DNS.                                              |
| `Connection reset by <host:port>`                                                | Broker rejected the connection.                  | Match **Security Protocol** to the broker listener.                           |
| `Authentication failed — check SASL username and password`                       | Incorrect SASL credentials.                      | Re-enter the username and password.                                           |
| `SASL mechanism is not supported by the broker`                                  | SASL mechanism mismatch.                         | Check `sasl.enabled.mechanisms` and select a matching mechanism.              |
| `TLS: Broker certificate is not trusted`                                         | CA certificate is missing or incorrect.          | Provide the correct **CA Certificate**.                                       |
| `TLS: Broker certificate has expired or is not yet valid`                        | Broker certificate is expired.                   | Renew the broker certificate.                                                 |
| `TLS: Certificate hostname mismatch`                                             | TLS uses an IP address.                          | Use a hostname matching the certificate CN or SAN.                            |
| `TLS: Broker requires a client certificate (mTLS)`                               | The broker requires mutual TLS.                  | Provide **Client Certificate** and **Client Private Key**.                    |
| `Not authorized to access topic metadata`                                        | The SASL user lacks ACLs.                        | Grant the forwarder principal topic `WRITE` permission.                       |
| `tls_client_cert and tls_client_key must both be set or both be empty`           | Only one client key-pair value is set.           | Provide both values, or neither.                                              |
| `output_format 'raw' bypasses forward filtering ... set filter_forward to false` | Raw output uses filtering.                       | Set **Filter forward** to `false`, or choose `nested` or `flattened`.         |
| `Request body exceeds 1 MiB limit`                                               | Configuration payload is too large.              | Reduce certificate sizes.                                                     |

### Security Recommendations

* Use `SASL_SSL` in production.
* Prefer `SCRAM-SHA-256` or `SCRAM-SHA-512` over `PLAIN`.
* Never enable **TLS Skip Verify** in production.
* Provide a CA certificate for self-signed broker certificates.
* Leave **Partition Key** empty for round-robin distribution.
* Use a fixed **Partition Key** only for same-partition ordering.

### Protocol Quick Reference

| Protocol         | Encryption | Authentication |
| ---------------- | ---------- | -------------- |
| `PLAINTEXT`      | No         | No             |
| `SSL`            | Yes, TLS   | No             |
| `SASL_PLAINTEXT` | No         | Yes, SASL      |
| `SASL_SSL`       | Yes, TLS   | Yes, SASL      |
