# Prometheus HAProxy Exporter

How to Integrate **Prometheus HAProxy Exporter** with **Apica Ascent**

### 1. Introduction

This guide explains how to send HAProxy metrics from Prometheus HAProxy Exporter to Apica Ascent, and how to monitor and visualize them.

You’ll learn:

* How to install HAProxy Exporter
* How to configure Prometheus to scrape HAProxy metrics
* How to connect Prometheus with Apica Ascent
* How to visualize metrics in dashboards

### 2. Install and Run HAProxy Exporter

Follow the official documentation for installation as per your requirements:\
[HAProxy Installation](https://github.com/prometheus/haproxy_exporter?tab=readme-ov-file%23haproxy-exporter-for-prometheus)

### 3. Configure Prometheus to Scrape HAProxy Exporter

Update your prometheus.yml with a scrape job for HAProxy Exporter:

```
scrape_configs:
  - job_name: 'haproxy'
    static_configs:
      - targets: ['localhost:9101']
```

Restart Prometheus and check the /targets page to verify that metrics are being scraped.

### 4. Connect Prometheus to Apica Ascent

To send metrics to Apica Ascent, add the following remote\_write configuration to your prometheus.yml:

```
remote_write:
  - url: "https://ascent-pre.apica.io/v1/receive/prometheus"
    tls_config:
      insecure_skip_verify: true
    authorization:
      type: "Bearer"
      credentials: "<YOUR_INGEST_TOKEN>"
```

Optional: Relabel metrics for easier identification:

```
write_relabel_configs:
  - action: replace
    source_labels: [__name__]
    regex: "(.*)"
    target_label: __name__
    replacement: "ascent_$1"
```

This will rename metrics to ascent\_\<metric-name> before sending them.

### 5. Verify Metrics in Apica Ascent

* Log in to Apica Ascent
* Navigate to Queries → New Query
* Run a query such as:

```
haproxy_up
haproxy_frontend_sessions_total
haproxy_backend_current_sessions
```

Execute and verify that results are populated.

### 6. Example Dashboards

You can build dashboards for common HAProxy metrics:

* **Traffic:** Requests/sec, Bytes in/out
* **Reliability:** 4xx/5xx response rates, server UP status
* **Capacity:** Queue length, max sessions

**Alerts:**

* Backend down
* High 5xx error rate

**Dashboard templates**: GitHub repository

### 7. Troubleshooting

Here are some common resolution areas:

* **HAProxy Exporter not reachable** → Check firewall on port 9101.
* **Prometheus not scraping** → Verify prometheus.yml configuration.
* **Metrics not in Apica** → Validate remote\_write URL and ingest token.
