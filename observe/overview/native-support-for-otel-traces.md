# Native support for OTEL Traces

#### Native Support for OTEL Traces HTTP Request via OTLP HTTP Exporter

**Overview**

[OpenTelemetry](https://opentelemetry.io/) is becoming the standard for observability. OpenTelemetry is vendor-agnostic, and the 2nd most active community on GitHub after Kubernetes.

Support for OTEL traces is added under the `/v1/json_batch` endpoint as `/v1/json_batch/otlptraces`.

**Example OTEL Collector Configuration**

```yaml
codeexporters:
  otlphttp:
    traces_endpoint: https://apicainstance.url/v1/json_batch/otlptraces
    encoding: json
    compression: gzip
    headers:
      Authorization: "Bearer bearer_token_string"
    tls:
      insecure: false
      insecure_skip_verify: true
```

**Mandatory Fields**

* **traces\_endpoint**: The endpoint to which traces are sent.
* **encoding**: Must be set to `json`.

**Optional Fields**

* **compression**: Can be set to `gzip` for trace compression.
* **headers**: Headers for the HTTP request. It is recommended that this be used in production setups.
* **tls**: TLS configuration. It is recommended to enable TLS in production setups.

**Authentication**

Authentication is supported via bearer token authentication. Both TLS and non-TLS modes are supported.

**Handling of Namespaces/Application**

Namespaces and applications default to `tracing/default_app`. These values cannot be changed.

This documentation provides the setup and configuration of native support for OTEL traces using the OTLP HTTP exporter. Ensure that mandatory fields are correctly configured, and consider enabling optional fields for enhanced security and performance in production environments.
