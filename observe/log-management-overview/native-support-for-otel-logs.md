# Native support for OTEL Logs

### Native Support for OTEL Logs HTTP Request via OTLP HTTP Exporter

**Overview**

[OpenTelemetry](https://opentelemetry.io/) is becoming the standard for observability. OpenTelemetry is vendor-agnostic, and the 2nd most active community on GitHub after Kubernetes.\
\
Support for OTEL logs is added under the `/v1/json_batch` endpoint as `/v1/json_batch/otlplogs`.

**Example OTEL Collector Configuration**

```yaml
codeexporters:
  otlphttp:
    logs_endpoint: https://apicainstance.url/v1/json_batch/otlplogs?namespace=foobar2
    encoding: json
    compression: gzip
    headers:
      Authorization: "Bearer bearer_token_string"
    tls:
      insecure: false
      insecure_skip_verify: true
```

**Mandatory Fields**

* **logs\_endpoint**: The endpoint to which logs are sent.
* **encoding**: Must be set to `json`.

**Optional Fields**

* **compression**: Can be set to `gzip` for log compression.
* **headers**: Headers for the HTTP request. It is recommended that this be used in production setups.
* **tls**: TLS configuration. It is recommended to enable TLS in production setups.

**Authentication**

Authentication is supported via bearer token authentication. Both TLS and non-TLS modes are supported.

**Handling of Namespaces/Application**

Namespaces and applications default to `default_namespace/default_application`. They can be customized using either of the following methods:

* **Query Parameters**: Override URL and namespace using query parameters.
* **Explicit Keywords**: Include "namespace" and "application" keywords in the attributes.

This documentation covers the setup and configuration of native support for OTEL logs using the OTLP HTTP exporter. Ensure that mandatory fields are correctly configured, and consider enabling optional fields for enhanced security and performance in production environments.
