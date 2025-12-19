# Prometheus Node Exporter

How to Integrate **Prometheus Node Exporter** with **Apica Ascent:**

#### 1. Introduction

This guide explains how to send hardware and OS metrics from Prometheus Node Exporter to Apica Ascent, and how to monitor and visualize them.

You’ll learn:

* How to install Node Exporter
* How to configure Prometheus to scrape Node Exporter metrics
* How to connect Prometheus with Apica Ascent
* How to visualize metrics in dashboards

#### 2. Install and Run Prometheus Node Exporter

If you are new to Prometheus and Node Exporter, here is a simple step-by-step guide:

* Binary installation:
  * Follow the [Installation Guide](https://prometheus.io/docs/guides/node-exporter/).
* Automated installs:
  * Use [Ansible playbooks](https://github.com/prometheus-community/ansible).
* Containerized deployment:
  * Follow the [Docker instructions](https://github.com/prometheus/node_exporter#docker).

By default, Node Exporter runs on port 9100 and exposes metrics at:

```
http://<node-ip>:9100/metrics
```

#### 3. Configure Prometheus to Scrape Node Exporter

Update your prometheus.yml with a scrape job for Node Exporter:

```
scrape_configs:
  - job_name: "node_exporter"
    static_configs:
      - targets: ["<node-ip>:9100"]
```

Restart Prometheus and check the /targets page to verify that metrics are being scraped.

#### 4. Connect Prometheus to Apica Ascent

To send metrics to Apica Ascent, add the following remote\_write configuration to your prometheus.yml:

```
remote_write:
  - url: "https://<your-ascent-env>/v1/receive/prometheus"
    tls_config:
      insecure_skip_verify: true
    authorization:
      type: "Bearer"
      credentials: "<YOUR_INGEST_TOKEN>"
```

* [More on remote\_write](https://docs.apica.io/integrations/list-of-integrations/prometheus/prometheus-remote-write)
* [Generate an ingest token](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token)

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

#### 5. Verify Metrics in Apica Ascent

1. Log in to Apica Ascent
2. Navigate to Queries → New Query
3. Run a query such as:

```
node_cpu_seconds_total
node_memory_MemAvailable_bytes
```

4\.     Execute and verify that results are populated.

#### 6. Example Dashboards

You can build dashboards for common system metrics:

* **System Overview**: CPU %, Memory %, Disk usage %, Network I/O
* **Alerts**:
  * CPU usage > 90%
  * Disk usage > 80%
  * Memory usage > 90%

#### 7. Troubleshooting

* Node Exporter not reachable → Check firewall on port 9100.
* Prometheus not scraping → Verify prometheus.yml.
* Metrics not in Apica → Validate remote\_write URL and ingest token.
