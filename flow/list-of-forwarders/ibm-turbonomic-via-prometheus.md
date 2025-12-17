# IBM Turbonomic (via Prometheus)

## Integrating Apica Flow with IBM Turbonomic via Prometheus

### Overview

This document describes how to integrate Apica Flow with IBM Turbonomic by forwarding metrics from Apica Flow to Prometheus using OpenTelemetry (OTel) metrics, and then connecting Turbonomic to Prometheus using Prometurbo.

This integration enables Turbonomic to consume high-quality, filtered, and enriched infrastructure and application metrics that have already passed through Apica Flow’s observability pipeline, allowing for more accurate real-time resource optimization decisions.

### High-Level Architecture

The integration follows this flow (see diagram):

Telemetry Sources (ex; Splunk, Datadog, Dynatrace, Appdynamics, AWS Cloudwatch )\
&#x20;  ↓\
Apica Flow\
&#x20;  ↓  (OTel Metrics Forwarding)\
Prometheus\
&#x20;  ↓  (Prometurbo)\
IBM Turbonomic

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

**Key components:**

* Apica Flow: Collects, processes, filters, and forwards telemetry data
* OpenTelemetry Metrics: Standardized metric format used between systems
* Prometheus: Time-series metrics backend
* Prometurbo: Turbonomic component that integrates with Prometheus
* IBM Turbonomic: Uses metrics for continuous resource optimization

### Step 1: Forward Metrics from Apica Flow to Prometheus

Apica Flow supports forwarding metrics in OpenTelemetry metrics format, which Prometheus can scrape or receive depending on your deployment model.

#### Configure OTel Metrics Forwarding in Apica Flow

To configure Apica Flow to forward metrics in OpenTelemetry format to Prometheus, follow the official Apica documentation:

* Apica Flow – OpenTelemetry Metrics Forwarding\
  https://docs.apica.io/flow/opentelemetry-forwarding/metrics

**This guide covers:**

* Enabling the OpenTelemetry metrics forwarder
* Configuring endpoints and exporters
* Metric naming and labeling behavior
* Transport and protocol options

**Result:** Prometheus receives metrics that were processed and routed through Apica Flow.

### Step 2: Deploy Prometurbo for Prometheus

Turbonomic integrates with Prometheus using Prometurbo, which is responsible for pulling metrics from Prometheus and translating them into Turbonomic’s internal model.

#### Deploy Prometurbo Using the Operator

Follow IBM’s official documentation to deploy Prometurbo using the Kubernetes operator:

* Deploying Prometurbo Through the Operator: \
  https://www.ibm.com/docs/en/tarm/8.18.x?topic=prometheus-deploying-prometurbo-through-operator

**This step includes:**

* Installing the Turbonomic operator
* Deploying the Prometurbo custom resource
* Configuring access to Prometheus endpoints

### Step 3: Enable Metrics Collection in Prometurbo

Once Prometurbo is deployed, metrics collection from Prometheus must be enabled and configured.

* Enabling Metrics Collection for Prometurbo: \
  https://www.ibm.com/docs/en/tarm/8.18.x?topic=prometheus-enabling-metrics-collection-prometurbo

**This configuration defines:**

* Which Prometheus instances Prometurbo connects to
* Authentication and TLS settings
* Metric discovery and scrape behavior

**Result:** Turbonomic begins ingesting metrics from Prometheus that originated from Apica Flow.

### &#x20;End-to-End Data Flow Summary

1\.        Telemetry sources emit metrics

2\.        Apica Flow ingests, filters, enriches, and forwards metrics

3\.        Metrics are forwarded in OpenTelemetry format to Prometheus

4\.        Prometurbo pulls metrics from Prometheus

5\.        IBM Turbonomic consumes metrics to drive optimization decisions

### &#x20;Benefits of This Integration

* Vendor-neutral telemetry using OpenTelemetry standards
* Centralized control over metric volume and quality via Apica Flow
* Reduced noise before metrics reach Prometheus and Turbonomic
* Improved Turbonomic accuracy with curated, enriched metrics
* Scalable architecture that supports large metric volumes

### Notes and Best Practices

* Ensure metric names and labels forwarded from Apica Flow align with Prometurbo expectations
* Apply filtering and aggregation in Apica Flow to control Prometheus cardinality
* Monitor Prometheus and Prometurbo resource usage for large-scale deployments
* Validate end-to-end metric availability before enabling Turbonomic actions

### Additional Resources

* Apica Flow Documentation: https://docs.apica.io/flow/&#x20;
* OpenTelemetry Metrics Specification: https://opentelemetry.io/docs/specs/otel/metrics/&#x20;
* IBM Turbonomic Documentation: https://www.ibm.com/docs/en/tarm&#x20;
