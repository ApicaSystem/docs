# Getting Started with Metrics

### Install OpenTelemetry

1. Go to [https://opentelemetry.io/docs/collector/installation/](https://opentelemetry.io/docs/collector/installation/) or [https://github.com/open-telemetry/opentelemetry-collector-releases/releases/](https://github.com/open-telemetry/opentelemetry-collector-releases/releases/) to find the package you want to install. At the point of writing this guide, 0.115.1 is the latest package so we’ll install otelcol-contrib\_0.115.1\_linux\_amd64
2. On the machine you wish to collect metrics from, run the following 4 commands:
   1. **Deb-based**
      1. sudo apt-get update
      2. sudo apt-get -y install wget
      3. wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.115.1/otelcol-contrib\_0.115.1\_linux\_amd64.deb
      4. sudo dpkg -i otelcol-contrib\_0.115.1\_linux\_amd64.deb
   2. **RHEL-based**
      1. sudo dnf update -y
      2. sudo dnf install -y wget
      3. wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.115.1/otelcol-contrib\_0.115.1\_linux\_amd64.rpm
      4. sudo rpm -ivh otelcol-contrib\_0.115.1\_linux\_amd64.rpm
3. Navigate to /etc/otelcol-contrib/
4. Edit the file with your favourite file editor, for example: nano config.yaml
5. Paste the following into the config file overwriting it completely:
   1. ```
      receivers:
        hostmetrics:
          collection_interval: 10s
          scrapers:
            cpu:
              metrics:
                system.cpu.utilization:
                  enabled: true
            load:
            memory:
            filesystem:
            network:
            disk:
            paging:
            processes:

      processors:
        batch:
          timeout: 5s

      exporters:
        debug:
          verbosity: detailed
        prometheusremotewrite:
          endpoint: https://<YOUR-ASCENT-ENV>/v1/receive/prometheus
          headers:
            Authorization: Bearer <YOUR-INGEST-TOKEN>
          tls:
            insecure: false
            insecure_skip_verify: true

      service:
        pipelines:
          metrics:
            receivers: [hostmetrics]
            processors: [batch]
            exporters: [prometheusremotewrite, debug]
      ```
   2. Replace \<YOUR-ASCENT-ENV>with your Ascent domain, e.g. company.apica.io
   3. Replace \<YOUR-INGEST-TOKEN>with your Ascent Ingest Token, e.g. eyXXXXXXXXXXX...
      1. Follow this guide on how to obtain your ingest token - [https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token)
6. When you’ve finished editing the config, save it and run otelcol-contrib validate --config=config.yaml
   1. If you get no error returned, the config file is valid.
7. Restart the service with sudo systemctl restart otelcol-contrib
8. Verify that the service is up and running correctly with sudo systemctl status otelcol-contrib
   1. A good result should look like this:
   2. ```
      otelcol-contrib.service - OpenTelemetry Collector Contrib
           Loaded: loaded (/usr/lib/systemd/system/otelcol-contrib.service; enabled; preset: enabled)
           Active: active (running) since Tue 2024-11-19 15:29:59 UTC; 9s ago
         Main PID: 26248 (otelcol-contrib)
            Tasks: 8 (limit: 4630)
           Memory: 33.1M (peak: 33.7M)
              CPU: 98ms
           CGroup: /system.slice/otelcol-contrib.service
                   └─26248 /usr/bin/otelcol-contrib --config=/etc/otelcol-contrib/config.yaml

      Nov 19 15:30:04 otel-testing otelcol-contrib[26248]:      -> Description: Total number of created processes.
      Nov 19 15:30:04 otel-testing otelcol-contrib[26248]:      -> Unit: {processes}
      Nov 19 15:30:04 otel-testing otelcol-contrib[26248]:      -> DataType: Sum
      Nov 19 15:30:04 otel-testing otelcol-contrib[26248]:      -> IsMonotonic: true
      Nov 19 15:30:04 otel-testing otelcol-contrib[26248]:      -> AggregationTemporality: Cumulative
      Nov 19 15:30:04 otel-testing otelcol-contrib[26248]: NumberDataPoints #0
      Nov 19 15:30:04 otel-testing otelcol-contrib[26248]: StartTimestamp: 2024-11-18 10:25:54 +0000 UTC
      Nov 19 15:30:04 otel-testing otelcol-contrib[26248]: Timestamp: 2024-11-19 15:30:00.536392834 +0000 UTC
      Nov 19 15:30:04 otel-testing otelcol-contrib[26248]: Value: 26262
      Nov 19 15:30:04 otel-testing otelcol-contrib[26248]:         {"kind": "exporter", "data_type": "metrics", "name": "debug"}
      ```
   3. You can also view live logs using journalctl -u otelcol-contrib -f. With the above config you would see entries every 10 seconds.

### Verify metrics in the Ascent platform

1. Click on the green “+ Create” button on the top navigation bar and select **Query**
2. In the dropdown menu on the left hand side, select **Ascent Metrics**
3. In the search bar, search for system\_
   1. This will present all the different system metrics that is being scraped with your Otel configuration
   2. You can click any of the metrics directly to insert it into the query text, and hit execute to see the latest metrics.
