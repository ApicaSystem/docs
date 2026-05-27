# Redpanda Connect

A user guide for setting up, configuring, and operating a Redpanda Connect source extension in Ascent.

### What is this source extension

The Redpanda Connect source extension runs an embedded [Redpanda Connect](https://docs.redpanda.com/redpanda-connect/) pipeline that you control with a YAML configuration. Whatever the pipeline produces gets posted into Ascent's ingest endpoint, routed, and stored like any other event.

In practice it gives you a programmable pipeline stage that sits in front of Ascent. You decide where the data comes from (HTTP, Kafka, S3, Pub/Sub, syslog, files, and [many more](https://docs.redpanda.com/connect/components/inputs/about/)), what transforms run on it (filter, dedupe, enrich, group, stitch, normalise, and [many more](https://docs.redpanda.com/connect/components/processors/about/)), and how it gets batched and sent to Ascent.

### When to use it

Pick this source extension when you need one or more of these:

* **Noise reduction before ingest.** Drop empty lines, deduplicate identical events, collapse high-cardinality fields. Reduces the volume Ascent has to index and the bill that follows.
* **Stitch fragmented events back together.** Many sources fragment a single logical event across rows. Group by correlation ID, sort by sequence, and forward a coherent event to Ascent.
* **Format conversion.** Take whatever shape the source sends (CSV, raw text, syslog, Avro, protobuf, etc.) and emit clean JSON for Ascent.
* **Enrichment.** Look up additional fields from a cache, KV store, or static map before forwarding.
* **Bridge from another transport.** Pull from Kafka topics, S3 buckets, GCP Pub/Sub, Azure Event Hub, or any other source Connect supports, and push to Ascent.

If your source already produces clean JSON and POSTs it to Ascent's HTTP ingest directly, you do not need this. Use it when a stage of pre-processing actually buys you something.

### Creating a source extension

In the Ascent UI:

1. Go to **Integrations -> Source Extensions -> Add Source Extension**.
2. Pick **Redpanda Connect** from the list of source types.
3. Give it a name. The name becomes part of the Kubernetes object names and shows up in pod logs, so use lowercase letters, digits, and hyphens. Examples: `noise-reduction`, `kafka-orders`, `stitch-app-logs`.
4. Fill in the configuration fields below.
5. Click **Save**. Ascent provisions a pod and a load balancer IP within a minute or two.

#### Configuration fields

| Field                                       | What it does                                                                                                                                                                                                                            |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Memory / Memory limit**                   | Pod memory request and limit. Default 2Gi/2Gi. Increase if you stitch or buffer a lot of events. See "Sizing" below.                                                                                                                    |
| **CPU / CPU limit**                         | Pod CPU request and limit. Default 1000m/1000m (one vCPU).                                                                                                                                                                              |
| **Replicas**                                | Default 1. Increase only when your upstream is partitioned by the same key your pipeline groups on (e.g. Kafka with `consumer_group` keyed on correlation ID). _**Multi-replica without partition awareness produces garbled output.**_ |
| **Container image**                         | The pre-published image. Leave as the default unless you have a reason to pin a specific older version.                                                                                                                                 |
| **Connect pipeline YAML**                   | The full Connect pipeline. See "Writing the YAML" below. **Required**.                                                                                                                                                                  |
| **Default namespace / Default application** | Fallbacks for Ascent routing. Only used when the incoming event does not carry its own `namespace` / `app_name`. See "How routing works".                                                                                               |
| **Custom environment variables**            | Key/value pairs available to the YAML as `${VAR}`. Use for broker addresses, API keys, credentials, custom field names, certificate content.                                                                                            |
| **Log level**                               | `INFO` for production, `DEBUG` while you are setting things up.                                                                                                                                                                         |

### Writing the Connect pipeline YAML

A Connect pipeline always has three sections:

```yaml
input:           # where events come from
  ...
pipeline:        # what transforms run on each event
  processors:
    - ...
output:          # where events go (almost always: http_client to Ascent)
  http_client:
    url: ${APICA_INGEST_URL}
    ...
```

You can also add `buffer:`, `cache_resources:`, `metrics:`, and `logger:` sections. Full reference at the [Redpanda Connect docs](https://docs.redpanda.com/redpanda-connect/). [More references](https://docs.redpanda.com/connect/configuration/about/).

#### Variables available in the YAML

Ascent injects these automatically. Reference them in the YAML as `${VAR}`.

| Variable              | What it is                                                                                                       |
| --------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `${X_API_KEY}`        | API token Ascent generates for this source extension. Use as `Authorization: Bearer ${X_API_KEY}` on the output. |
| `${APICA_INGEST_URL}` | The full URL to Ascent's batched-JSON ingest endpoint. Use as the output `url`.                                  |
| `${APICA_FLASH_HOST}` | The Ascent service hostname, if you need to build the URL yourself.                                              |
| `${APICA_FLASH_PORT}` | The Ascent service port.                                                                                         |
| `${NAMESPACE}`        | Value of the **Default namespace** field from the source-extension config.                                       |
| `${APP_NAME}`         | Value of the **Default application** field.                                                                      |
| `${LOG_LEVEL}`        | Value of the **Log level** field.                                                                                |

Any variable you add in **Custom environment variables** is also visible as `${YOUR_VAR}` and can be used in the YAML.

#### The shape of the output block

For the pipeline output to reach Ascent correctly, the `output` section must look like this (we use the http\_client output):

```yaml
output:
  http_client:
    url: ${APICA_INGEST_URL}
    verb: POST
    headers:
      Authorization: "Bearer ${X_API_KEY}"
      Content-Type: "application/json"
    batch_as_multipart: false
    max_in_flight: 4
    batching:
      count: 100
      period: 1s
      processors:
        - archive:
            format: json_array
```

Note: the body must be a top-level JSON array. **Do not wrap the array under a `batch_payload` key**. Wrapping the array makes Ascent treat the whole payload as a single event and route everything to `default_namespace`.

### How routing works

Every event in Ascent is keyed by `(namespace, app_name)`. The Redpanda Connect pipeline can supply these in two ways, and **source-provided values always win**:

1. **If the incoming event already has `namespace` and `app_name` fields**, those values are used. Coming from Kafka with these fields already stamped? They flow through untouched.
2. **Otherwise**, the **Default namespace** and **Default application** you configured in the form are stamped on each event before forwarding.

The starter examples include this snippet near the end of the pipeline, which implements the fallback:

```yaml
- mapping: |
    root = this
    root.namespace = this.namespace.or(env("NAMESPACE").or("default"))
    root.app_name  = this.app_name.or(env("APP_NAME").or("default"))
```

If you want every event from this source to land in a specific namespace regardless of what the source says (forced relabel), replace the `.or()` calls with direct assignments:

```yaml
- mapping: |
    root = this
    root.namespace = env("NAMESPACE")
    root.app_name  = env("APP_NAME")
```

### Sending data to your source extension

Once the source extension is running, the **expanded** section of the source extension in the Ascent UI shows a **LoadBalancer** field with a public IP address (something like `140.245.xx.113`).

#### HTTP-style inputs

If your YAML uses `http_server` as the input, the pipeline accepts HTTP POSTs at:

```
http://<LoadBalancer-IP>:8080<your-configured-path>
```

The path is whatever you set as `path:` under `http_server` in the YAML. Common values: `/events`, `/fragments`, `/logs`.

Example (using the `dedupe-noise-reduction` example, which listens on `/events`):

```sh
curl -X POST http://140.245.29.113:8080/events \
  -H "Content-Type: application/json" \
  -d '{"message":"my first event","namespace":"orders","app_name":"checkout"}'
```

The pipeline will accept any JSON body. If the source already includes `namespace` and `app_name`, those values flow through; otherwise the configured defaults are stamped.

#### Pull-style inputs (Kafka, S3, Pub/Sub, etc.)

If your YAML pulls from a remote source (Kafka, S3, GCP Pub/Sub, Azure Event Hub, etc.), there is nothing to POST to. The pipeline connects out to the source on its own. The LoadBalancer is unused in this case; you can either leave it (small cost) or, if the cost matters, ask the Apica team to disable the LB for this deployment.

### Verifying it works

#### Did the event reach Ascent

Open the Ascent UI, navigate to **Search**, set the filter to:

* **Namespace** = the namespace your event carries (or your configured Default namespace).
* **Application** = same for application.

Set a short time range covering when you sent the event. The event should appear within a second or two.

#### Did the pipeline come up at all?

Check the logs of the source extension.

Look for the `=== Linting config ===` block. A pass shows `Lint OK`. A fail prints the YAML error and the pod crashes - fix the YAML and re-save.

### Troubleshooting

**The pod is in CrashLoopBackOff** Almost always a YAML problem. Open the pod logs and look for the `=== Linting config ===` block. Connect's lint output will name the offending field. Fix the YAML and re-save. Common causes:

* A `${VAR}` reference for a variable that does not exist on the pod.
* A processor name typo (e.g. `dedup` vs `dedupe`).

**HTTP requests to the LB hang or get connection refused** Check that the load balancer has actually been provisioned. In the source extension's UI **expanded** view, the **LoadBalancer** field shows the IP once cloud provisioning completes (typically 30-60 seconds after first save). If the field is still empty after a few minutes, contact your Apica admin.

**Memory keeps climbing** The pipeline is holding more state than the pod can fit. Most common cause: stitching or dedupe with too long a window for the cardinality. Either shorten the window, narrow the input upstream, or increase the memory limit on the source extension.

### Where to learn more

* [Redpanda Connect documentation](https://docs.redpanda.com/redpanda-connect/) - the canonical reference for inputs, processors, outputs, and Bloblang.
* [Example pipelines](https://github.com/ApicaSystem/ApicaHub/tree/master/source-extensions/redpanda-connect) - starter YAMLs for reference.
* [Bloblang reference](https://docs.redpanda.com/redpanda-connect/guides/bloblang/about/) - the mapping language used inside `mapping` processors.

