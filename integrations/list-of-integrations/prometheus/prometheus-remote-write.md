# Prometheus Remote Write

Apica Ascent can collect Prometheus metrics from externally hosted Prometheus. Apica Ascent uses the `remote_write` capabilities to help you do so.

### **Prometheus configuration**

To send metrics from Prometheus to Apica Ascent endpoint, use the configuration below.

{% hint style="info" %}
You may also want to add a relabel configuration section to make sure the metrics from your prometheus instance are prefixed for easier identification See Section below.
{% endhint %}

<pre><code><strong>remote_write:
</strong>  - url: https://&#x3C;apica-ascent-endpoint>/v1/receive/prometheus
    tls_config:
        insecure_skip_verify: true
        # Optional - ca_file: &#x3C;file-name>
        # Optional - cert_file: &#x3C;file-name>
        # Optional - key_file: &#x3C;file-name>
    authorization:
        type: "Bearer"
        credentials: "&#x3C;Ingest-Token>"
</code></pre>

#### Prometheus Remote Write in Helm Chart

Prometheus helm

Helm Chart for Prometheus document is found here:

{% embed url="https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus" %}

The configuration for remote write in the Helm _**values.yaml**_ file differs slightly from that in the _**prometheus.yml**_ file. Note that in the _**values.yaml**_ file, the configuration file under the _**server section**_ uses the _**remoteWrite**_ keyword instead of _**remote\_write**_, which is used in the _**prometheus.yml**_ file. This distinction in syntax is important to ensure that the remote write functionality is correctly configured in your deployment.

```
server:
  remoteWrite:
  - url: https://<apica-ascent-endpoint>/v1/receive/prometheus
    tls_config:
        insecure_skip_verify: true
        # Optional - ca_file: <file-name>
        # Optional - cert_file: <file-name>
        # Optional - key_file: <file-name>
```

#### Adding relabel configuration to prefix your metrics

To ensure that your metrics are easily identifiable, replace _**\<prefix>**_ in the _**replacement**_ attribute within the _**write\_relabel\_configs**_ section with a descriptive prefix of your choice. This prefix will be appended to the beginning of all metrics sent to the output stream, allowing you to easily differentiate them from other metrics in your system.

```
  remote_write:
  - url: https://<apica-ascent-endpoint>/v1/receive/prometheus
    tls_config:
        insecure_skip_verify: true

    write_relabel_configs:
    - action: replace
      source_labels: [__name__]
      regex: (.*)
      target_label: __name__
      replacement: '<prefix>_$1'
```

### **OpenTelemetry configuration**

The Prometheus Remote Write Exporter can be used to send OpenTelemetry metrics to Prometheus [remote write compatible backends](https://prometheus.io/docs/operating/integrations/). By leveraging this capability, you can easily visualize these metrics on the Apica Ascent platform, allowing you to gain valuable insights into the performance of your system.

```
exporters:
  prometheusremotewrite:
    endpoint: "https://<apica-ascent-endpoint>/v1/receive/prometheus"
    wal: # Enabling the Write-Ahead-Log for the exporter.
      directory: ./prom_rw # The directory to store the WAL in
      buffer_size: 100 # Optional count of elements to be read from the WAL before truncating; default of 300
      truncate_frequency: 45s # Optional frequency for how often the WAL should be truncated. It is a time.ParseDuration; default of 1m
    tls: 
      ca_file: <file-name>
      cert_file: <file-name>
      key_file: <file-name>

    external_labels: #labels to identify the metric
         label1: value1

receivers:
  otlp:
    protocols:
      grpc:
      http:

processors:
  batch:

service:
  pipelines:
    metrics:
         receivers: [otlp]
         processors: [batch]
         exporters: [prometheusremotewrite]
```

### **VictoriaMetrics configuration**

VictoriaMetrics is a fast, cost-effective, and scalable monitoring solution and time-series database. `vmagent` is an agent which helps you collect metrics from various sources and store them in [VictoriaMetrics](https://github.com/VictoriaMetrics/VictoriaMetrics) or any other Prometheus-compatible storage systems that support the `remote_write` protocol. VMagent has the ability to push metrics additionally to pulling them; push model is a traditional model of the client sending data to the server:

![](https://docs.victoriametrics.com/keyconcepts/push_model.webp)

Run the [<mark style="color:purple;">**vmagent**</mark> ](https://docs.victoriametrics.com/vmagent.html#quick-start)as shown below and pass the below parameters

{% hint style="info" %}
remoteWrite.tls.url=https://\<apica-ascent-endpoint>/v1/receive/prometheus

remoteWrite.tlsInsecureSkipVerify
{% endhint %}

```
./vmagent-prod -promscrape.config=/etc/prometheus/prometheus.yml -remoteWrite.url=https://<apica-ascent-endpoint>/v1/receive/prometheus -remoteWrite.tlsInsecureSkipVerify
```
