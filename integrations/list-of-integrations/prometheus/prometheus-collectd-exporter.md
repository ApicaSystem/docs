# Prometheus Collectd Exporter

How to Integrate **Prometheus Collectd Exporter** with **Apica Ascent:**

#### 1. Introduction

This guide explains how to send metrics exported in the Collectd binary network protocol in JSON format via HTTP POST to Apica Ascent, and how to monitor and visualize them.

You’ll learn:

* How to install Collectd Exporter
* How to configure Prometheus to scrape Collectd Exporter metrics
* How to connect Prometheus with Apica Ascent
* How to visualize metrics in dashboards

#### 2. Install and Run Prometheus Collectd Exporter

If you are new to Prometheus and Collectd Exporter, here is a simple step-by-step guide:

* **Binary installation:**
  * Follow the [Installation Guide](https://github.com/prometheus/collectd_exporter) and [Collectd Wiki](https://github.com/collectd/collectd/wiki/First-steps).
* **Automated installs:**
  * Use [Ansible playbooks](https://github.com/prometheus-community/ansible).
* **Containerized deployment:**
  * Follow the [Docker instructions](https://github.com/prometheus/collectd_exporter?tab=readme-ov-file#using-docker).
  * By default, Collectd Exporter runs on port 9103 and exposes metrics at:

```
http://localhost:9108/metrics
```

#### 3. Configure Prometheus to Scrape Collectd Exporter

Update your prometheus.yml with a scrape job for Collectd Exporter:

```
scrape_configs:
  - job_name: "collectd "
    static_configs:
      - targets: ["localhost:9103"]
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

**Optional: Relabel metrics for easier identification:**

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

1. Log in to **Apica Ascent**
2. Navigate to **Queries → New Query**
3. Run a query such as:

```
collectd_cpu_total
collectd_processes_fork_rate_total
collectd_processes_ps_state
```

Execute and verify that results are populated.

#### 6. Example Dashboards

You can build dashboards for common system metrics:

* **System Overview:** CPU usage, Memory usage, TCP connections, Samples received/dropped
* **Alerts:**
  * CPU total usage > X
  * Processes fork rate > or < X
  * Disk I/O time /s > or < X
* **Dashboard templates:** [GitHub repository](https://github.com/)

#### 7. Troubleshooting

* **Collectd Exporter not reachable** → Check firewall on port 9103.
* **Prometheus not scraping** → Verify prometheus.yml.
* **Metrics not in Apica** → Validate remote\_write URL and ingest token.
