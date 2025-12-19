# Prometheus MySQL Exporter

How to Integrate **Prometheus MySQL Exporter** with **Apica Ascent:**

### 1. Introduction

This guide explains how to send MySQL metrics from Prometheus mysqld\_exporter to Apica Ascent, and how to monitor and visualize them.

You'll learn:

* How to install and run MySQL Exporter
* How to configure Prometheus to scrape MySQL metrics
* How to connect Prometheus with Apica Ascent
* How to visualize metrics in dashboards

### 2. Install and Run MySQL Exporter

Follow the official documentation for installation [here](https://github.com/prometheus/mysqld_exporter).

* Create a dedicated user:

```
CREATE USER 'mysqld_exporter'@'127.0.0.1' IDENTIFIED BY 'yourpassword';
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'mysqld_exporter'@'127.0.0.1';
FLUSH PRIVILEGES;
```

* Create .my.cnf:

```
[client]
user=mysqld_exporter
password=yourpassword
host=127.0.0.1
port=3306
```

* Run exporter

```
Default metrics endpoint: http://localhost:9104/metrics
```

### 3. Configure Prometheus to Scrape MySQL Exporter

Update prometheus.yml:

```
scrape_configs:
  - job_name: 'mysql'
    static_configs:
      - targets: ['localhost:9104']
```

Restart Prometheus and verify on /targets.

### 4. Connect Prometheus to Apica Ascent

Add remote\_write to prometheus.yml:

```
remote_write:
  - url: "https://<your-ascent-env>/v1/receive/prometheus"
    tls_config:
      insecure_skip_verify: true
    authorization:
      type: "Bearer"
      credentials: "<YOUR_INGEST_TOKEN>"
```

* [More on remote\_write](https://docs.apica.io/integrations/list-of-integrations/prometheus/prometheus-remote-write)&#x20;
* [Generate an ingest token](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token)&#x20;

Optional: Relabel metrics for easier identification:&#x20;

```
write_relabel_configs: 
  - action: replace 
    source_labels: [__name__] 
    regex: "(.*)" 
    target_label: __name__ 
    replacement: "ascent_$1" 
```

This will rename metrics to ascent\_\<metric-name> before sending them.&#x20;

### 5. Verify Metrics in Apica Ascent

**Log in → Queries → New Query**

Run:

```
mysql_up
mysql_global_status_threads_connected
mysql_global_status_queries
```

Check results populate.

### 6. Example Dashboards

You can use this Ascent dashboard to get started.

### 7. Troubleshooting

* Exporter error: Check .my.cnf path and permissions.
* Access denied: Verify MySQL user and grants.
* Prometheus not scraping: Validate prometheus.yml.
* Metrics not in Apica: Check remote\_write URL and token.
