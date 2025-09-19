---
description: Setup JMX Exporter and send metrics to Apica Ascent endpoint
---

# JMX Exporter

We will be using [JMX exporter](https://github.com/prometheus/jmx_exporter) which will help us expose JMX Beans via. HTTP for Prometheus consumption.

> JMX to Prometheus exporter: a collector that can configurably scrape and expose mBeans of a JMX target.
>
> This exporter is intended to be run as a Java Agent, exposing a HTTP server and serving metrics of the local JVM. It can be also run as a standalone HTTP server and scrape remote JMX targets, but this has various disadvantages, such as being harder to configure and being unable to expose process metrics (e.g., memory and CPU usage). Running the exporter as a Java Agent is thus strongly encouraged.

This tutorial will explain how to run JMX exporter as a Java agent.

1. Head to the GitHub website of [JMX exporter](https://github.com/prometheus/jmx_exporter), and download the .jar file from the `Running the Java Agent` section.
2. Move this JAR file to the same location where your service JAR file is located.
3. Make a minimal `config.yaml` file in the same directory:

```yaml
rules:
- pattern: ".*"
```

4. Now start your JAR file with this command, where we run the jmx\_exporter JAR file as a Java Agent.

```bash
java -javaagent:./jmx_prometheus_javaagent-0.17.2.jar=12345:config.yaml -jar yourJar.jar
```

5. Metrics will now be accessible at [http://localhost:12345/metrics](http://localhost:12345/metrics). To bind the java agent to a specific IP change the port number to `host:port`.

\---

Now as we have the metrics exposed at a local endpoint, we can scrape them using prometheus and send it to Apica Ascent endpoint via. remote\_write.

Locate the prometheus configuration file and add a job in `scrape_configs` for java\_metrics like this:

```
# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.

  - job_name: 'prometheus'
  
    static_configs:
    - targets: ['localhost:9090']
      labels:
        group: 'logiq_engr'
        cluster_id: 'logiq'
        namespace: 'engr'

  - job_name: 'java_metrics'               # <------- Added configuration for scraping localhost:12345/metrics --------

    static_configs:
    - targets: ['localhost:12345']
      labels:
        group: '<GROUP NAME>'
        cluster_id: '<CLUSTER ID>'
        namespace: '<NAMESPACE>'
```

Save the prometheus config file and restart/start the prometheus systemd service by using these commands:

> `sudo systemctl restart prometheus` OR `sudo systemctl start prometheus`

You will see the metrics populate at Apica Ascent endpoint in Query editor in some time.
