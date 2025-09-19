---
description: SETTING UP THE OPENTELEMETRY COLLECTOR
---

# How to Get Started with OpenTelemetry

## Choosing the Right OTEL Components

**Understanding OTEL architecture:** OpenTelemetry consists of multiple components, including APIs, SDKs, Collectors, and exporters. Selecting the right components depends on the architecture of your system and the telemetry data you need to collect. Organizations must assess whether they need distributed tracing, metrics, logs, or a combination of all three to achieve complete observability.

**Deployment considerations:** Choosing between an agent-based or sidecar deployment model affects resource utilization and scalability. OpenTelemetry provides flexible deployment options that integrate directly into microservices, Kubernetes clusters, and traditional monolithic applications.

Links for using OpenTelemetry with Apica Ascent:

* [Getting Started with OpenTelemetry](../../getting-started/ascent/getting-started-with-metrics.md)
* [OpenTelemetry Integration for Ascent](../../integrations/list-of-integrations/opentelemetry.md)

## OTEL SDKs: SPRING BOOT OPENTELEMETRY AND MORE

**Language-specific SDKs:** OpenTelemetry provides official SDKs for multiple programming languages, including Java, Python, JavaScript, Go, .NET, and more. Choosing the correct SDK ensures seamless instrumentation of applications to capture relevant telemetry data without requiring excessive code modifications.

**Automatic vs. manual instrumentation:** Many OpenTelemetry SDKs support automatic instrumentation, which simplifies the collection of telemetry data by automatically instrumenting common frameworks and libraries. Manual instrumentation, on the other hand, allows developers to capture more granular details specific to their business logic, providing richer observability insights.

**Configuration and customization:** Each OpenTelemetry SDK offers various configuration options, such as sampling rates, exporters, and resource attributes. Understanding these settings helps optimize observability while minimizing overhead on production systems.

## Collector Setup for Telemetry Aggregation <a href="#toc189582879" id="toc189582879"></a>

**Role of the OpenTelemetry Collector:** The OpenTelemetry Collector acts as a central hub for processing, filtering, and exporting telemetry data. It eliminates the need to send data directly from applications to multiple backends, reducing the complexity of observability pipelines.

**Collector pipeline configuration:** OpenTelemetry Collectors support a pipeline model consisting of receivers (data ingestion), processors (data transformation), and exporters (data forwarding). Configuring these pipelines efficiently ensures that only relevant telemetry data is retained and sent to the appropriate monitoring backends.

**Scalability and performance tuning:** Organizations with high-volume telemetry data must optimize Collector performance using batching, compression, and load balancing techniques. Running multiple Collector instances or deploying Collectors at the edge can enhance data aggregation efficiency while minimizing network latency.

## Instrumenting Applications with OTEL <a href="#toc189582880" id="toc189582880"></a>

### Manual vs. Automatic Instrumentation <a href="#y0ybsdw1zmgo" id="y0ybsdw1zmgo"></a>

**Understanding the differences:** OpenTelemetry offers two approaches to instrumenting applications—automatic and manual instrumentation. Choosing the right approach depends on the level of detail required and the effort an organization is willing to invest.

**Automatic Instrumentation:** OpenTelemetry provides auto-instrumentation libraries that hook into commonly used frameworks (e.g., Spring Boot, Express, Flask, Django) to capture telemetry data without modifying application code. This is an easy way to get started and ensures coverage across key application functions with minimal effort. However, automatic instrumentation may not capture business-specific logic or custom events that organizations want to track.

**Manual Instrumentation:** With manual instrumentation, developers explicitly insert OpenTelemetry SDK calls into the application code. This provides precise control over what telemetry data is collected and allows capturing custom metrics, business transactions, and domain-specific spans. While more effort is required to implement, manual instrumentation results in richer observability data tailored to an organization’s needs.

**Combining both approaches:** Many organizations use a hybrid approach where auto-instrumentation provides baseline observability, and manual instrumentation is used to track critical business operations, unique workflows, or domain-specific logic.

### Injecting Context Propagation Across Services <a href="#k6bqekas7lsc" id="k6bqekas7lsc"></a>

**Why context propagation matters:** In distributed systems, requests travel through multiple services, making it difficult to correlate logs, traces, and metrics. Context propagation ensures that telemetry data remains linked throughout an entire request lifecycle, enabling effective debugging and root cause analysis.

**Using Trace Context and Baggage:** OpenTelemetry follows the W3C Trace Context standard, which passes unique trace identifiers across service boundaries. Additionally, baggage propagation allows attaching custom metadata to traces, which can be used for debugging or business analytics.

**Instrumentation strategies:** Developers need to ensure that trace context is carried through HTTP requests, gRPC calls, and message queues. OpenTelemetry SDKs provide middleware and client libraries that handle this automatically for popular frameworks and protocols.

**Ensuring compatibility across environments:** Organizations using multiple tracing tools should verify that OpenTelemetry context propagation integrates well with existing logging and monitoring solutions, avoiding data fragmentation.

## Exporting Telemetry Data <a href="#toc189582881" id="toc189582881"></a>

### OTEL-native Exporters (OTLP, Prometheus, Jaeger, etc.) <a href="#id-3rbfbiwh19ld" id="id-3rbfbiwh19ld"></a>

**OpenTelemetry Protocol (OTLP):** OTLP is the native protocol for OpenTelemetry, offering a standardized and efficient way to transmit telemetry data. It supports traces, metrics, and logs in a unified format, ensuring compatibility with a broad range of observability backends. Organizations using OTLP benefit from reduced complexity and better performance, as the protocol is optimized for high-throughput data collection.

**Prometheus Exporter:** OpenTelemetry integrates seamlessly with Prometheus, a widely used open-source monitoring system. The Prometheus exporter allows applications instrumented with OpenTelemetry to send metrics to Prometheus, enabling real-time monitoring and alerting. This is particularly useful for organizations leveraging Prometheus as their primary observability backend.

**Jaeger and Zipkin Exporters:** OpenTelemetry supports both Jaeger and Zipkin, two popular distributed tracing backends. These exporters allow organizations to continue using their existing tracing infrastructure while benefiting from OpenTelemetry’s standardized instrumentation. By enabling these exporters, teams can visualize request flows and troubleshoot latency issues effectively.

**Commercial Observability Platforms:** Many commercial observability platforms, such as Datadog, New Relic, and Dynatrace, support OpenTelemetry exporters. This ensures that organizations adopting OpenTelemetry can seamlessly integrate their telemetry data into these platforms without vendor lock-in.

### Integrating OTEL with Your Observability Backend (Your Platform) <a href="#rxchz8anatlz" id="rxchz8anatlz"></a>

**Configuring Exporters for Seamless Data Ingestion:** OpenTelemetry provides a flexible exporter configuration, allowing organizations to send telemetry data to multiple observability platforms simultaneously. This enables hybrid monitoring strategies where teams can leverage both open-source and commercial solutions for observability.

**Optimizing Data Flow with the OpenTelemetry Collector:** The OpenTelemetry Collector can be used as an intermediary layer to receive, process, and export telemetry data efficiently. By implementing batch processing, filtering, and data enrichment, organizations can optimize data flow while reducing unnecessary storage and processing costs.

**Ensuring High Availability and Performance:** When integrating OpenTelemetry with an observability backend, organizations should ensure that exporters and collectors are configured to handle high-volume telemetry data. Strategies such as load balancing, horizontal scaling, and adaptive sampling help maintain reliability while keeping infrastructure costs under control.

**Security and Compliance Considerations:** Organizations should implement encryption (e.g., TLS) and authentication mechanisms when exporting telemetry data to observability platforms. Ensuring secure transmission prevents unauthorized access and aligns with regulatory requirements.
