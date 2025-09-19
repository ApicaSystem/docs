---
description: Configuring Vault Metrics for Integration with Ascent
---

# Audit Vault Metrics

{% embed url="https://github.com/ApicaSystem/ApicaHub/tree/b263b6febab876f358aa05b7ec47b23dca0cac3f/integrations/vault/metrics" %}
Configuration files
{% endembed %}

## Ingest Vault Metrics Configuration with OpenTelemetry (Otel) and Apica Ascent

This document outlines the steps to configure an OpenTelemetry (Otel) Collector to scrape Vault metrics and ingest them into Apica Ascent.

### Prerequisites

Ensure the following are available:

* Kubernetes cluster
* Vault installed in the cluster
* OpenTelemetry Helm chart repository added
* Apica Ascent credentials (URL and token)

***

### Steps

#### Create new OpenTelemetry Collector configuration as a DaemonSet.

#### Step 1: Add Helm Repositories

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update
```

#### Step 2: Create Namespace for OpenTelemetry

```bash
kubectl create namespace otel
```

#### Step 3: Apply Service Account and RBAC

```bash
kubectl apply -f 1-apica-svc-rbac.yaml -notel
```

#### Step 4: Install OpenTelemetry Operator

```bash
helm install opentelemetry-operator open-telemetry/opentelemetry-operator \
  --set "manager.collectorImage.repository=logiqai/opentelemetry-collector-k8s" \
  --set "manager.collectorImage.tag=v1-0.105.0" \
  --set "admissionWebhooks.certManager.enabled=false" \
  --set "admissionWebhooks.autoGenerateCert.enabled=true" \
  -notel --debug
```

#### Step 5: Update Configuration Values in 2-apica-otel-config.yaml

Before creating the ConfigMap, update the following values:

* `APICA_URL`: Host URL of the Ascent to ingest the metrics
* `APICA_TOKEN`: Replace with the ingest token of Ascent (Settings > Account > Copy Ingest Token)
* `RUNTIME`: Add the runtime identifier
* `CUSTOMER`: Add the customer identifier

Apply the updated configuration:

```bash
kubectl apply -f 2-apica-otel-config.yaml -notel
```

#### Step 6: Deploy OpenTelemetry Collector as DaemonSet

```bash
kubectl apply -f 3-apica-otel-collector-operator-daemon.yaml -notel
```

#### Step 7: Verify Vault Metrics

Check the logs to ensure Vault metrics are being scraped:

```bash
kubectl logs pod/<pod-name> -notel | grep 'Name'
```

***

#### Steps to update the existing OpenTelemetry Collector configuration.

Edit the OpenTelemetryCollector resource:

```bash
kubectl edit OpenTelemetryCollector/apica-otel-collector -notel
```

**Add New Receiver for Vault Metrics**

```yaml
receivers:
  prometheus:
    config:
      scrape_configs:
        - job_name: vault-metrics-collector
          metrics_path: /v1/sys/metrics
          scrape_interval: 60s
          static_configs:
            - targets:
                - vault.vault.svc.cluster.local:8200 # Verify the Vault service endpoint
```

**Add Exporter for Metrics**

```yaml
exporters:
  otlphttp/apicametrics:
    compression: gzip
    disable_keep_alives: true
    encoding: proto
    metrics_endpoint: "${APICA_URL}/v1/metrics"
    headers:
      Authorization: "Bearer ${APICA_TOKEN}"
    tls:
      insecure: false
      insecure_skip_verify: true
```

**Add processors**

```yaml
processors:
  attributes/apica_labels:
    actions:
      - action: insert
        key: runtime
        value: ${RUNTIME} # Replace with runtime identifier
      - action: insert
        key: customer
        value: ${CUSTOMER} # Replace with customer identifier
```

**Update Service Pipeline**

If a metrics pipeline already exists, update the exporters, processors, and receivers as needed:

```yaml
service:
  pipelines:
    metrics:
      exporters:
        - otlphttp/apicametrics
        - debug
      processors:
        - memory_limiter
        - batch
        - resourcedetection/system
        - transform/metrics
        - attributes/apica_labels
      receivers:
        - prometheus
```

***

### Notes

* Replace placeholders (`${APICA_URL}`, `${APICA_TOKEN}`, `${RUNTIME}`, `${CUSTOMER}`) with actual values before applying the configurations.
* Ensure the Vault service endpoint is reachable at `vault.vault.svc.cluster.local:8200`.
* Use the logs to verify the scraping process and troubleshoot if necessary.
