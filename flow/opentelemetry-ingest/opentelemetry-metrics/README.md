---
description: >-
  Apica Flow supports OpenTelemetry metrics in telemetry pipelines for both
  receiving from OpenTelemetry compatible metrics sources and forwarding to
  OpenTelemetry Compatible Metric destinations.
---

# OpenTelemetry Metrics

{% hint style="info" %}
Apica Flow exclusively supports telemetry pipelines through the OTLP metrics endpoints. You can confidently utilize the OTLP-compatible endpoint hosted at **/v1/metrics**.
{% endhint %}

### Turning on OpenTelemetry compatible metrics in the telemetry pipeline

Navigate to **Settings -> Admin Settings -> Ingest Configuration** and enable the metrics ingest into the pipeline. You can also disable the metrics going to the Ascent Prometheus storage backed by InstaStore, but if you want to view metrics in the Apica Ascent UI, keep this option disabled. This setup allows you to send metrics to the telemetry pipeline and visualize them in the Ascent UI seamlessly.

* Enable the **`METRICS_TO_PIPELINE_EVENTS`** toggle to activate metrics flow in the telemetry pipeline. This feature is initially turned off
* `METRICS_STORE_DISABLE` - Enable this option to skip storing metrics in InstaStore. By default, it is off. Activate this when the telemetry pipeline forwards metrics to an external forwarder

<figure><img src="../../../.gitbook/assets/Screenshot 2025-05-12 at 2.45.19 PM.png" alt=""><figcaption><p>Apica Ascent Settings page for Ingest configuration</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot 2025-05-12 at 2.45.06 PM.png" alt=""><figcaption><p>OpenTelemetry Metrics settings for telemetry pipeline</p></figcaption></figure>



***

## OpenTelemetry to Ascent Ingest Configuration

Below are examples of how to configure processors for OTLP exporters while exporting to Ascent. These help ensure that events are correctly tagged with the desired `namespace` and `app_name` attributes.\
\
This ensures that your metrics land up in your own respective `namespace` and `app_name`.

### Example: Inserting Namespace and App Name

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

***

### When to Use

Use this pattern when you want to ensure your forwarded OTLP data is always tagged correctly with the appropriate metadata, even if the source does not provide it explicitly.

This is especially useful for:

* Testing environments
* Ingesting raw OTLP data from third-party agents
* Normalizing inputs before routing

Make sure this processor is configured upstream (e.g., in OpenTelemetry Collector).
