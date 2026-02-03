# Fluent-bit Opentelemetry Forwarder

### How to Integrate Fluent-bit Opentelemetry output Plugin with Apica Ascent

#### 1. Introduction

This guide explains how to send logs with the Opentelemetry output plugin to Apica Ascent with Fluent-bit, and how to view them.

This plugin can be combined with inputs and filters such as the [HTTP](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-http-input-plugin) input and modify filter plugins.

#### 2. Configure the Opentelemetry output Plugin in Fluent-bit

Update your Fluent-bit.conf with an output for the Opentelemetry output Plugin:

```
[OUTPUT]
    Name                 opentelemetry
    Match                ascent_logs
    Host                 localhost
    Port                 4319
    Metrics_uri          /v1/metrics
    Logs_uri             /v1/logs
    Traces_uri           /v1/traces
    Log_response_payload True
    Tls                  Off
```

You could use any free port, port 4319 is not required, it was chosen for this example.

Restart Fluent-bit with `systemctl restart fluent-bit` and check the status with `systemctl status fluent-bit` to verify that it’s running correctly.

[Official Plugin documentation.](https://docs.fluentbit.io/manual/data-pipeline/outputs/opentelemetry)

[Set up Fluent-bit for Apica Ascent.](https://docs.apica.io/integrations/list-of-integrations/fluent-bit#fluent-bit-configuration)

#### 3. Verify Logs in your end destination

In this example we’re testing it locally with an OpenTelemetry collector in docker.

1\.     Install any required applications

2\.     Run the following command to start your detached colletor: `docker run -d --network host -v ~/otel-test/otel-config.yaml:/etc/otel-config.yaml --name otel-collector otel/opentelemetry-collector-contrib:latest --config /etc/otel-config.yaml`

3\.     Run the following command to see your logs: `docker logs -f otel-collector`

#### 4. Example logs

{% code overflow="wrap" %}
```
2026-01-28T14:05:25.193Z        info    Logs    {"resource": {"service.instance.id": "054e1513-1ec4-4102-ac15-e3b5c6a77ac5", "service.name": "otelcol-contrib", "service.version": "0.143.1"}, "otelcol.component.id": "debug", "otelcol.component.kind": "exporter", "otelcol.signal": "logs", "resource logs": 1, "log records": 54}
```
{% endcode %}

#### 5. Troubleshooting

[Fluent-bit Troubleshooting](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

If logs are not being sent verify that the port is open and that the server can receive data there.

Verify that the logs are in a format that the Opentelemetry output plugin can read.
