---
description: >-
  The Apache Kafka forwarder sends log data from Apica Ascent to a Kafka topic.
  It supports plaintext, TLS, and SASL authentication, message compression, and
  configurable batching.
---

# Apache Kafka Forwarder

### Prerequisites

* A running Kafka broker (version 0.10+)
* A Kafka topic to forward logs to
* Network access from Apica Ascent to the broker(s)
* (Optional) TLS certificates and/or SASL credentials

### Creating a Kafka Forwarder

#### Step 1 — Fill in Basic Configuration

| Field                | Required | Description                                                                                                                                                       |
| -------------------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Name**             | Yes      | A unique name for this forwarder                                                                                                                                  |
| **Brokers**          | Yes      | Comma-separated broker addresses (`host:port`). Example: `broker-1.example.com:9092,broker-2.example.com:19093`. Use hostnames, not bare IPs, when TLS is enabled |
| **Topic**            | Yes      | Target Kafka topic name                                                                                                                                           |
| **Max Payload Size** | No       | Maximum bytes read from the queue per message. Default: `10000`                                                                                                   |
| **Message Format**   | No       | Message format. Always `_json`                                                                                                                                    |

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-10-25.png" alt=""><figcaption></figcaption></figure>

#### Step 2 — Configure Security Protocol

Select the appropriate **Security Protocol** for your Kafka cluster.

| Option           | Description                             |
| ---------------- | --------------------------------------- |
| `PLAINTEXT`      | No authentication or TLS. Default.      |
| `SSL`            | TLS encryption only. No authentication. |
| `SASL_PLAINTEXT` | SASL authentication without TLS         |
| `SASL_SSL`       | SASL authentication with TLS encryption |

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-11-58.png" alt=""><figcaption></figcaption></figure>

#### Step 2a — SASL Configuration (SASL\_PLAINTEXT / SASL\_SSL only)

Visible only when `SASL_PLAINTEXT` or `SASL_SSL` is selected.

| Field              | Required | Description                                                    |
| ------------------ | -------- | -------------------------------------------------------------- |
| **SASL Username**  | Yes      | SASL username                                                  |
| **SASL Password**  | Yes      | SASL password                                                  |
| **SASL Mechanism** | Yes      | `PLAIN`, `SCRAM-SHA-256`, or `SCRAM-SHA-512`. Default: `PLAIN` |

> **Recommendation:** Use `SCRAM-SHA-256` or `SCRAM-SHA-512` over `PLAIN` for stronger security.

#### Step 2b — TLS Configuration (SSL / SASL\_SSL only)

Visible only when `SSL` or `SASL_SSL` is selected.

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-22-37.png" alt=""><figcaption></figcaption></figure>

| Field                  | Required | Description                                                                            |
| ---------------------- | -------- | -------------------------------------------------------------------------------------- |
| **TLS Skip Verify**    | No       | Disables TLS certificate verification. **Use only in dev or test.** Default: off       |
| **CA Certificate**     | No       | PEM-format CA certificate to verify broker identity. Leave empty to use system CA pool |
| **Client Certificate** | No       | PEM-format client certificate. Required only for mutual TLS (mTLS)                     |
| **Client Private Key** | No       | PEM-format private key. Must be provided with the client certificate                   |

> **Note:** CA certificate, client certificate, and client private key can be pasted directly or imported from a file using the **Import** button.

#### Step 3 — Buffer Configuration

The buffer controls how Apica Ascent queues log data locally before sending it to Kafka. This helps prevent data loss during broker downtime or network interruptions.

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-29-52.png" alt=""><figcaption></figcaption></figure>

| Field              | Default                | Description                                                                                                                   |
| ------------------ | ---------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **Persist Buffer** | Off                    | When enabled, queued messages are written to disk and survive process restarts. When disabled, the queue stays in memory only |
| **Buffer Size**    | `10485760` (10 MiB)    | Maximum size of the buffer queue in bytes. Visible only when Persist Buffer is enabled                                        |
| **Queue Policy**   | `Drop incoming events` | Action taken when the buffer is full due to backpressure                                                                      |

**Queue Policy options:**

| Option                    | Behavior                                                                                              |
| ------------------------- | ----------------------------------------------------------------------------------------------------- |
| **Drop incoming events**  | Discards new data until backpressure is relieved. The pipeline continues processing                   |
| **Block incoming events** | Returns `429 Too Many Requests` until backpressure is relieved. No data is lost, but ingest is paused |

> **Recommendation:** Enable **Persist Buffer** in production to reduce data loss when the Kafka broker is temporarily unavailable. Use **Drop** for high-throughput pipelines where some loss is acceptable. Use **Block** where data completeness matters most.

#### Step 4 — Advanced Configuration

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-33-55.png" alt=""><figcaption></figcaption></figure>

| Field                       | Default           | Description                                                                                            |
| --------------------------- | ----------------- | ------------------------------------------------------------------------------------------------------ |
| **Compression**             | `none`            | Compression codec: `none`, `gzip`, `snappy`, `lz4`, `zstd`                                             |
| **Max Attempts**            | `10`              | Maximum write retries before a batch is dropped                                                        |
| **Write Timeout (seconds)** | `30`              | Timeout for a single write request to the broker                                                       |
| **Batch Size**              | `100`             | Maximum messages per network batch                                                                     |
| **Batch Bytes**             | `1048576` (1 MiB) | Maximum bytes per network batch                                                                        |
| **Partition Key**           | _(empty)_         | Fixed key for all messages. Same key = same partition = ordered delivery. Leave empty for round-robin. |

#### Step 5 — Test Connection

Click **Test Connection** to verify broker reachability before saving.

{% hint style="success" %}
Connection successful
{% endhint %}

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-40-46.png" alt=""><figcaption></figcaption></figure>

{% hint style="danger" %}
Connection failed — SASL mechanism is misconfigured.
{% endhint %}

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-43-47.png" alt=""><figcaption></figcaption></figure>

The success message confirms that the broker is reachable and authentication passed.\
The error message shows a specific failure, such as wrong credentials, an unreachable host, or a TLS mismatch.

#### Step 6 — Save the Forwarder

Click **Create** to save. Optionally check **Make this configuration default** before saving.

<figure><img src="../../.gitbook/assets/Screenshot from 2026-05-19 18-57-52.png" alt=""><figcaption></figcaption></figure>

### Common Errors

| Error                                 | Cause                            | Fix                                                        |
| ------------------------------------- | -------------------------------- | ---------------------------------------------------------- |
| `Connection refused`                  | Broker not running or wrong port | Verify broker address and port                             |
| `Cannot resolve hostname`             | DNS resolution failed            | Check hostname spelling and DNS                            |
| `Authentication failed`               | Wrong SASL credentials           | Re-enter username and password                             |
| `TLS: broker certificate not trusted` | CA cert missing or wrong         | Provide correct CA certificate in **CA Certificate** field |
| `Certificate hostname mismatch`       | Connecting via IP with TLS       | Use hostname matching the broker's certificate CN/SAN      |
| `SASL mechanism not supported`        | Mechanism mismatch               | Check broker's `sasl.enabled.mechanisms` config            |
| `Request body exceeds 1 MiB limit`    | Config payload too large         | Reduce certificate sizes                                   |

### Security Recommendations

* Use `SASL_SSL` in production for both authentication and encryption
* Prefer `SCRAM-SHA-256` or `SCRAM-SHA-512` over `PLAIN`
* Never enable **TLS Skip Verify** in production
* Provide a CA certificate instead of skipping verification with self-signed broker certificates
* Leave **Partition Key** empty for round-robin distribution across partitions
* Set a fixed **Partition Key** only if you want all messages from this forwarder on the same partition

### Protocol Quick Reference

| Protocol         | Encryption | Authentication |
| ---------------- | ---------- | -------------- |
| `PLAINTEXT`      | No         | No             |
| `SSL`            | Yes (TLS)  | No             |
| `SASL_PLAINTEXT` | No         | Yes (SASL)     |
| `SASL_SSL`       | Yes (TLS)  | Yes (SASL)     |
