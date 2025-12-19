# Prometheus Blackbox Exporter

How to Integrate Prometheus Blackbox Exporter with Apica Ascent:

### 1. Introduction

This guide explains how to send endpoint monitoring metrics from **Prometheus Blackbox Exporter** to **Apica Ascent**, and how to monitor and visualize them.

You’ll learn:

* How to install and run Blackbox Exporter
* How to configure Prometheus to scrape Blackbox metrics
* How to connect Prometheus with Apica Ascent
* How to visualize and alert on endpoint health

### 2. Install and Run Prometheus Blackbox Exporter

If you are new to Prometheus and Blackbox Exporter, here are some quick deployment options:

**Binary installation:**

&#x20;Download the release from [Prometheus Blackbox Exporter GitHub](https://github.com/prometheus/blackbox_exporter/releases) and run:

{% code overflow="wrap" %}
```
./blackbox_exporter --config.file=blackbox.yml --web.listen-address=":<port-number>" > blackbox.log 2>&1 &
```
{% endcode %}

By default, Blackbox Exporter runs on port 9115 and exposes metrics at:

```
http://<blackbox-ip>:9115/metrics
```

It also exposes a probe endpoint for checks:

```
http://<blackbox-ip>:9115/probe?target=<your_target>&module=http_2xx
```

### 3. Configure Prometheus to Scrape Blackbox Exporter

Edit prometheus.yml to add a scrape job for Blackbox Exporter.&#x20;

**Example:**

```
scrape_configs:
  - job_name: "blackbox"
    metrics_path: /probe
    params:
      module: [http_2xx]   # Use http_2xx, tcp_connect, icmp, etc.
    static_configs:
      - targets:
          - 
https://example.com

          - 
https://asm.apica.io

    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: <blackbox-ip>:9115
```

Restart Prometheus and confirm the scrape status at /targets.

### 4. Connect Prometheus to Apica Ascent

To send Blackbox metrics to Apica Ascent, configure remote\_write in prometheus.yml:

```
remote_write:
  - url: "https://<your-ascent-env>/v1/receive/prometheus"
    tls_config:
      insecure_skip_verify: true
    authorization:
      type: "Bearer"
      credentials: "<YOUR_INGEST_TOKEN>"
```

Optionally, relabel Blackbox metrics for clarity:

```
write_relabel_configs:
  - action: replace
    source_labels: [__name__]
    regex: "(.*)"
    target_label: __name__
    replacement: "ascent_$1"
```

This renames metrics to ascent\_\<metric-name> before sending them.

### 5. Verify Metrics in Apica Ascent

1\.     Log in to **Apica Ascent**

2\.     Navigate to **Queries → New Query**

3\.     Run queries such as:

```
probe_success
probe_http_duration_seconds
probe_ssl_earliest_cert_expiry
```

4\.     Execute and verify that results are returned.

### 6. Example Dashboards

You can build dashboards for common Blackbox metrics:

* **Endpoint Health Overview**
  * probe\_success (availability % per endpoint)
  * probe\_duration\_seconds (latency over time)
  * probe\_http\_status\_code (HTTP response trends)
  * probe\_ssl\_earliest\_cert\_expiry (SSL expiry monitoring)
* **Alerts:**
  * Endpoint down: probe\_success == 0
  * High latency: probe\_duration\_seconds > 2
  * SSL expiring soon: probe\_ssl\_earliest\_cert\_expiry < 604800 (7 days)

### 7. Troubleshooting

* **Blackbox Exporter not reachable** → Check firewall on port 9115.
* **Prometheus not scraping** → Validate prometheus.yml relabel configs.
* **Metrics missing in Ascent** → Verify remote\_write URL and ingest token.
* **Probes failing unexpectedly** → Confirm Blackbox blackbox.yml modules are correctly defined.
