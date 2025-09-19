# OpenTelemetry Logs / Traces

Open telemetry logs and traces are supported in the telemetry pipeline. You can use the standard otel logs and traces endpoints in ascent to ingest data. More details on the OpenTelemetry collector configuration to send logs in OTLP format can be found in integration [here](../../integrations/list-of-integrations/opentelemetry.md).

For logs and traces, data flow groupings can be managed in the following ways

1. Provide namespace and application as url parameters when setting the endpoint url&#x20;
2. Provide namespace and application as resource attributes

If none of the above is set, the apica ingest will assign `default_namespace` and `service_name` from the otel payload for the `application`



### Example: Inserting Namespace and App Name through Resource Attributes

```
processors:
  resource/info:
    attributes:
      - key: namespace
        value: mymetrics
        action: insert
      - key: app_name
        value: myapp
        action: insert
```

This processor configuration ensures that:

* If `namespace` and `app_name` attributes are not present in incoming events, they will be inserted with values `mymetrics` and `myapp`, respectively.
* If the attributes are already present, they will remain unchanged.
* If no such processor is configured, the metrics/logs/traces will fall back to `default_namespace` and `default_app` in Ascent.
