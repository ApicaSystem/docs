# Jaeger

Apica Ascent supports direct ingest of logs and traces from Jaeger agent and hosts the Jaeger Collector protocol port. Running the Jaeger agent to push traces can be done by specifying the GRPC host port on the Apica Ascent Instance

```
#jaeger-agent --reporter.grpc.host-port=<apica-ascent-endpoint>:14250
```
