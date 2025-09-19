# Ascent Quick Start Guide

## Ascent Quick Start Guide for AI and LLM Observability

The Apica full-stack observability platform combined with the OpenTelemetry SDK can seamlessly provide comprehensive insights into Large Language Models (LLMs) in production environments. By observing AI models, businesses can make informed decisions, optimize performance, and ensure compliance with emerging AI regulations.

This guide will walk you through setting up OpenTelemetry Auto Instrumentation for traces and metrics to fully monitor your LLM application using Apica Ascent. Once the quick setup is complete, you can easily track and analyze the performance and usage of your LLM applications.

Here are the main configuration steps required within your application code:

### **Deploy OpenTelemetry SDK**

Follow the steps below for either traces or metrics (or both). Also, we provide the links to the OTEL deployment guides if needed.

* OTEL tracing setup guide: [https://opentelemetry.io/docs/concepts/signals/traces/](https://opentelemetry.io/docs/concepts/signals/traces/)
* OTEL metrics setup guide: [https://opentelemetry.io/docs/specs/otel/metrics/](https://opentelemetry.io/docs/specs/otel/metrics/)

### **Instrument your Application**

Configure OTEL to send traces and/or metrics into Ascent (depending on how you want to visualize the data). Below are example(s) of code required to enable instrumentation of OTEL – traces.

#### TRACING code examples:

Imports (FastAPI might differ depending on what framework your app is created with):

```python
from opentelemetry.sdk.resources import Resource
from opentelemetry import trace
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
from opentelemetry.instrumentation.asyncio import AsyncioInstrumentor
from opentelemetry.sdk.trace import TraceProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter
```

Tracing configuration:

```python
#tracing configuration
resource = Resource.create(attributes={"service.name": "llm-app-service"})

trace.set_tracer_provider(TracerProvider(resource=resource))
tracer = trace.get_tracer_provider().get_tracer(_name_)

otlp_exporter = OTLPSpanExporter(endpoint="http://localhost:4317", insecure=True)
trace.get_tracer_provider().add_span_processor(BatchSpanProcessor(otlp_exporter))
```

Instrument App (Otel supports more than just FastAPI, simply import correct API in step #1):

```python
# Apply OpenTelemetry instrumentation to FastAPI
FastAPIIstrumentor.instrument_app(app)
```

Add tracer to each API call you would like to track. In this example we are adding a trace on “create\_chat\_completion” with a span called “chat\_completion”:

```python
async def create_chat_completion(request: Request, body: CreateChatCompletionRequest):
    with tracer.start_as_current_span("chat_completion") as span:
```

To add custom attributes such as prompt tokens to the trace:

```python
#tracing
span.set.attribute("prompt.tokens", str(response["usage"].get("prompt_tokens", 0)))
```

#### METRICS code examples:

Imports:

```python
from opentelemetry.sdk.resources import Resource
from opentelemetry.exporter.otlp.proto.grpc.metric_exporter import OTLPMetricExporter
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.sdk.metrics.export import ConsoleMetricExporter, PeriodicExportingMetricReader
from opentelemetry.sdk.metrics import Counter
from opentelemetry.sdk.metrics.view import View
from opentelemetry import metrics
```

Metric Configuration:

```python
##metrics
otlp_metric_exporter = OTLPMetricExporter(endpoint="http://0.0.0.0:4317", insecure=True)
metric_reader = PeriodicExportingMetricReader(otlp_metric_exporter)
provider = MeterProvider(metri_readers=[metric_reader])

metrics.set_meter_provider(provider)
meter = metrics.get_meter("llama.metrics")
```

Creating a metric:

```python
prompt_tokens_counter = meter.create_counter("llm.prompt.tokens")
```

Assigning the metric a value:

```python
prompt_tokens_counter.add(response["usage"].get("prompt_tokens", 0),{"model_name": str(response.get("model"))})
```

In this example we are grabbing prompt\_tokens from the LLM response and assigning it to the “prompt\_tokens\_counter” metric. We also added some metadata to the metric by adding “model\_name”.

#### **Collect and store data**

Data is stored in Ascent Lake

#### **Visualize data**

View individual traces and metrics within Ascent Explore. Use data explorer to visualize data – creating a widget for each desired “metric” to visualize within a dashboard – follow dashboard configuration steps:

1. Metric data – follow the data explorer for metrics
2. Trace data – use log2metric to visualize traces

#### **Alerting**

Configure alerts as required within Ascent.
