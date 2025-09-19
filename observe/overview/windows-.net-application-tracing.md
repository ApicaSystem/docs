# Windows .NET Application Tracing

<mark style="background-color:purple;">This guide is based on a ASP.NET application deployed on IIS.</mark>\ <mark style="background-color:purple;">Please reference Otels documentation for different setups -</mark> [![](https://opentelemetry.io/favicons/favicon-16x16.png)<mark style="background-color:purple;">.NET zero-code instrumentation</mark>](https://opentelemetry.io/docs/zero-code/net/)

### Install Collector <a href="#install-collector" id="install-collector"></a>

At the time of writing, the latest version of the OpenTelemetry Collector is 0.117.0

1. Find the appropriate binary for your system on the [Otel release page](https://github.com/open-telemetry/opentelemetry-collector-releases/releases/tag/v0.117.0)
   1. In this example we will be using [otelcol\_0.117.0\_windows\_x64.msi](https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.117.0/otelcol_0.117.0_windows_x64.msi)
2. Execute the downloaded executable. This will initiate a Windows service and also create the directory C:\Program Files\OpenTelemetry Collector
3.  Edit C:\Program Files\OpenTelemetry Collector\config.yaml and replace the content with the below

    `receivers: otlp: protocols: grpc: endpoint: localhost:4317 http: endpoint: localhost:4318 processors: batch: exporters: otlphttp: traces_endpoint: https://<your_domain>/v1/json_batch/otlptraces encoding: json compression: gzip headers: Authorization: "Bearer <your_token>" tls: insecure: false insecure_skip_verify: true service: pipelines: traces: receivers: [otlp] processors: [batch] exporters: [otlphttp]`

    1. Replace \<your\_domain> with the domain of your Ascent environment e.g [company.apica.io](http://company.apica.io/)
    2. Replace \<your\_token> with your ingest token ([How to get your ingest token](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token))
4. In **Services**, restart the OpenTelemetry Collector service

### Install and configure the .NET Agent <a href="#install-and-configure-the-.net-agent" id="install-and-configure-the-.net-agent"></a>

Latest version at the time of writing - [v1.9.0](https://github.com/open-telemetry/opentelemetry-dotnet-instrumentation/releases/tag/v1.9.0)

1. Download the PowerShell Module - [OpenTelemetry.DotNet.Auto.psm1](https://github.com/open-telemetry/opentelemetry-dotnet-instrumentation/releases/download/v1.9.0/OpenTelemetry.DotNet.Auto.psm1)
2. Open a PowerShell prompt as **Administrator** and execute the below commands - **NOTE** change the file path as needed per your system
   1.  Import the module

       `Import-Module "C:\Users\opc\Downloads\OpenTelemetry.DotNet.Auto.psm1"`
   2.  Install core files

       `Install-OpenTelemetryCore`
   3.  Setup IIS instrumentation

       `Register-OpenTelemetryForIIS`
   4. **If your application has TLS enabled (uses HTTPS)**
      1.  Configure environment variable

          `[System.Environment]::SetEnvironmentVariable("OTEL_EXPORTER_OTLP_ENDPOINT", "http://localhost:4317", "Machine")`
      2.  Restart IIS

          `iisreset`
   5. **If your application does not have TLS enabled (uses HTTP)**
      1.  Configure environment variables

          `[System.Environment]::SetEnvironmentVariable("OTEL_EXPORTER_OTLP_ENDPOINT", "http://localhost:4318", "Machine") [System.Environment]::SetEnvironmentVariable("OTEL_EXPORTER_OTLP_PROTOCOL", "http/protobuf", "Machine")`
      2.  Restart IIS

          `iisreset`

`Register-OpenTelemetryForIIS` **and** `iisreset` **performs an IIS restart.**

Depending on the amount of traces generated, you can pretty quickly verify that traces is passing through to Ascent by navigating to **Explore** > **Distributed** **Tracing** and in the dropdown Service you will after a short while see your application appear.

If you follow the below optional step, that service name will appear as an identifier in Ascent.

3.  (Optional) Set custom service name - This is how the service would appear in Ascent. Execute in a PowerShell as Admin

    `[System.Environment]::SetEnvironmentVariable("OTEL_SERVICE_NAME", "My ASPNET Application", "Machine")iisreset`

\
