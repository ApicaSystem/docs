# Concepts

**Understanding Namespace, Application, and Cluster ID in Apica Ascent**

Apica Ascent uses three metadata fields to **organize, route, and partition** incoming telemetry data:

* **`namespace`** (required)
* **`app_name`**  (required)
* **`cluster_id`** (optional)

> Correctly setting these values ensures that your logs, metrics, and traces appear in the expected dataflows within the UI and avoids silent routing into `default_namespace` and `default_app`.

***

### **Why These Fields Matter**

| Field                                          | Description                                                                                  | Required | Default Value       |
| ---------------------------------------------- | -------------------------------------------------------------------------------------------- | -------- | ------------------- |
| `cluster_id / CLUSTER_ID / ascent.cluster_id`  | Optional grouping, useful to separate environments like `dev`, `qa`, `prod`, or K8s clusters | No       | None                |
| `namespace` / `Namespace`                      | Top-level grouping for all telemetry (e.g., a team, service, VM, or k8s namespace)           | Yes      | `default_namespace` |
| `app_name` / `AppName` / `appName` / `appname` | Mid-level grouping for a specific service or app component                                   | Yes      | `default_app`       |

Internally, the **final namespace column** in logs is built as:

```bash
cluster_id:namespace
```

***

### **How to Set These Fields in Your Agent Configuration**

Below are examples across different ingestion agents and technologies:

***

#### **1. Fluent Bit Example**

```ini
[FILTER]
    Name          record_modifier
    Match         logiq
    Record cluster_id mycluster
    Record namespace mynamespace
    Record app_name  myapp
```

***

#### **2. Filebeat Example**

```yaml
filebeat:
  inputs:
    - enabled: true
      type: filestream
      paths:
        - /var/log/*.log
      processors:
        - add_fields:
            target: logiq
            fields:
              cluster_id: mycluster
              namespace: mynamespace
              application: myapp
```

***

#### **3. Fluentd Example**

```xml
<filter>
  @type record_transformer
  enable_ruby
  <record>
    cluster_id "mycluster"
    namespace "mynamespace"
    application "myapp"
  </record>
</filter>
```

***

#### **4. OpenTelemetry (Metrics, Logs, Traces) Example**

```yaml
processors:
  resource/info:
    attributes:
      - key: namespace
        value: mynamespace
        action: insert
      - key: app_name
        value: myapp
        action: insert
```

If these values are missing, `default_namespace` and `default_app` are automatically assigned.

***

#### **5. Docker Compose / Logging Driver Example**

```yaml
services:
  web:
    image: wordpress
    logging:
      driver: "fluentd"
      options:
        fluentd-address: 192.168.68.114:24224
        labels: "namespace,application,cluster_id"
    labels:
      namespace: "us-east-1"
      application: "wordpress"
      cluster_id: "cluster1"
```

***

### **Best Practices**

* **Always provide `namespace` and `application`** values. These are required to group data correctly.
* Use **`cluster_id`** when managing multiple environments or Kubernetes clusters.
* Make sure every agent is configured to insert these fields before forwarding.
* If unsure, test with a known value and validate in the Apica UI.

***

### **Visualizing Namespaces and Applications in the UI**

Once your agents are configured correctly with `cluster_id`, `namespace`, and `app_name`, your data will appear under the **Explore > Logs and Insights** tab in a structured, searchable format.

Below is a snapshot of the **Table View**, where each flow corresponds to a unique `(cluster_id:namespace, application)` combination.

<figure><img src="../../.gitbook/assets/screencapture-datafabric-demo-apica-io-explore-2025-06-22-06_33_16 (2).png" alt=""><figcaption></figcaption></figure>

**From the screenshot:**

* `default_namespace` with `default_application` indicates data that lacked proper metadata
* Well-tagged data like:
  * `oci-mumbai-logiqai-dev-kube-system : kube-state-metrics`&#x20;
  * `oci-mumbai-logiqai-dev1q5955 : lq5955-kubernetes-ingress`&#x20;
* You can **filter**, **search**, and **inspect** event statistics per flow here.

> Use this view to validate if your telemetry is landing in the expected flows.

### **Supported Field Aliases**

| **Standard Field**          | **Recognized Aliases**                                                                                                               |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `severity_string` / `level` | `severity`, `severe`, `severitystring`, `level`, `lvl`, `@severity`, `@level`, `otel.status_code`                                    |
| `timestamp`                 | `timestamp`, `time`, `@timestamp`                                                                                                    |
| `facility_string`           | `facility`, `@facility`                                                                                                              |
| `message`                   | `message`, `@message`, `log`, `@log`                                                                                                 |
| `cluster_id`                | `cluster_id`, `CLUSTER_ID`, `ascent.cluster_id`                                                                                      |
| `namespace`                 | `namespace`, `ascent.namespace`, `kubernetes.namespace_name`, `k8s.namespace.name`, `k8s.namespace`, `k8s.namespace_name`, `_source` |
| `application` / `app_name`  | `application`, `app_name`, `appname`, `application_name`, `ascent.application`                                                       |
| `hostname`                  | `hostname`, `host`, `@hostname`                                                                                                      |
| `proc_id`                   | `proc_id`, `@proc_id`, `kubernetes.pod_name`, `k8s.pod.name`, `k8s.pod`, `k8s.pod_name`                                              |
| `priority`                  | `priority`, `@priority`                                                                                                              |

***

### Kubernetes-Specific Aliases (Auto-mapped)

| **Target Field** | **K8s Field Aliases**                                                                                           |
| ---------------- | --------------------------------------------------------------------------------------------------------------- |
| `namespace`      | `kubernetes.namespace_name`, `k8s.namespace.name`, `k8s.namespace`, `k8s.namespace_name`                        |
| `application`    | `kubernetes.container_name`, `k8s.container.name`, `k8s.container`, `k8s.container_name`, `k8s.deployment.name` |
| `proc_id`        | `kubernetes.pod_name`, `k8s.pod.name`, `k8s.pod`, `k8s.pod_name`                                                |
| `hostname`       | `kubernetes.host`, `k8s.host.name`, `k8s.host`, `k8s.host_name`, `k8s.node.name`, `k8s.node`, `k8s.node_name`   |
| `sender` (IP)    | `kubernetes.pod_id`, `k8s.pod.ip`, `k8s.pod_ip`, `kubernetes.annotations.cni.projectcalico.org/podip`           |
