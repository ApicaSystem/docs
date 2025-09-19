# Linux+Java Application Tracing

<mark style="background-color:purple;">This guide is based on a Java application packaged with Maven.</mark>\ <mark style="background-color:purple;">Please reference Otels documentation for different setups -</mark> [![](https://opentelemetry.io/favicons/favicon-16x16.png)<mark style="background-color:purple;">Java zero-code instrumentation</mark>](https://opentelemetry.io/docs/zero-code/java/)

### Install the collector <a href="#install-the-collector" id="install-the-collector"></a>

At the time of writing, the latest version of the OpenTelemetry Collector is 0.117.0

1. Find the latest version of the OpenTelemetry collectors [here](https://github.com/open-telemetry/opentelemetry-collector-releases/releases/). In this guide we will install `otelcol-contrib_0.117.0_linux_amd64`
2. Download and install
   1. **Deb-based**
      1. `sudo apt-get update`
      2. `sudo apt-get -y install wget`
      3. `wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.117.0/otelcol-contrib_0.117.0_linux_amd64.deb`
      4. `sudo dpkg -i otelcol-contrib_0.117.0_linux_amd64.deb`
   2. **RHEL-based**
      1. `sudo dnf update -y`
      2. `sudo dnf install -y wget`
      3. `wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.117.0/otelcol-contrib_0.117.0_linux_amd64.rpm`
      4. `sudo rpm -ivh otelcol-contrib_0.117.0_linux_amd64.rpm`
3. Navigate to `/etc/otelcol-contrib/`
4. Edit the config file with your favourite file editor, for example: `nano config.yaml`
5.  Paste the following into the config file overwriting it completely:

    `receivers: otlp: protocols: grpc: endpoint: localhost:4317 http: endpoint: localhost:4318 processors: batch: exporters: otlphttp: traces_endpoint: https://<your_domain>/v1/json_batch/otlptraces encoding: json compression: gzip headers: Authorization: "Bearer <your_token>" tls: insecure: false insecure_skip_verify: true service: pipelines: traces: receivers: [otlp] processors: [batch] exporters: [otlphttp]`

    1. Replace \<your\_domain> with the domain of your Ascent environment e.g [company.apica.io](http://company.apica.io/)
    2. Replace \<your\_token> with your ingest token ([How to get your ingest token](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token))
6. When you’ve finished editing the config, save it and run `otelcol-contrib validate --config=config.yaml`
   1. If you get no error returned, the config file is valid.
7. Restart the service with `sudo systemctl restart otelcol-contrib`
8. Verify that the service is up and running correctly with `sudo systemctl status otelcol-contrib`

### Install and configure the Java agent <a href="#install-and-configure-the-java-agent" id="install-and-configure-the-java-agent"></a>

At the time of writing, the latest version of the Java agent is [2.11.0](https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/tag/v2.11.0)

1. Download the agent jar - [opentelemetry-javaagent.jar](https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v2.11.0/opentelemetry-javaagent.jar)
   1. `wget https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v2.11.0/opentelemetry-javaagent.jar`
2.  **Run Your Application with the Agent**: Add the agent as a JVM option when starting your application:

    `java -javaagent:/path/to/opentelemetry-javaagent.jar \ -Dotel.exporter.otlp.endpoint=http://localhost:4317 \ -Dotel.exporter.otlp.protocol=grpc \ -Dotel.traces.exporter=otlp \ -Dotel.metrics.exporter=none \ -Dotel.service.name=your-java-app \ -Dotel.resource.attributes=environment=production \ -jar your-app.jar`

<mark style="background-color:green;">Depending on the amount of traces generated, you can pretty quickly verify that traces is passing through to Ascent by navigating to</mark> <mark style="background-color:green;"></mark><mark style="background-color:green;">**Explore**</mark> <mark style="background-color:green;"></mark><mark style="background-color:green;">></mark> <mark style="background-color:green;"></mark><mark style="background-color:green;">**Distributed**</mark> <mark style="background-color:green;">**Tracing**</mark> <mark style="background-color:green;"></mark><mark style="background-color:green;">and in the dropdown Service you will after a short while see your application appear.</mark>

<mark style="background-color:green;">In this case, the service name “your-java-app” would show up as a Service.</mark>

\
