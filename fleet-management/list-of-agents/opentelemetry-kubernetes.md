---
description: >-
  Instructions for managing OpenTelemetry Collector agents in a Kubernetes
  cluster which contains an OpenTelemetry Operator.
---

# OpenTelemetry Kubernetes

The following are the requirements to install Fleet OpenTelementry collectors on a Kubernetes cluster:

1. Cert Manager should be installed.
2. Make sure the Kubernetes version supports `autoscaling/v2` .&#x20;
3. [OpenTelemetry Operator](https://github.com/open-telemetry/opentelemetry-operator) should be installed.&#x20;

When OpenTelemetry support on a Kubernetes cluster has been made available, by installing the OpenTelemetry Operator, Fleet can be used to manage individual collectors in the cluster by using an OpenTelemetry OpAMP Bridge. The OpAMP Bridge functions as the connection to Fleet and as the agent within Fleet. There is no need to install any proprietary Fleet components in the Kubernetes cluster, only open-source components from OpenTelemetry.

* Click on the Install Agent Manager Button

<figure><img src="../../.gitbook/assets/image (494).png" alt="" width="375"><figcaption></figcaption></figure>

* Select the "kubernetes" Platform
* And, select an Agent Type of OpenTelemetry Collector
* The Name field can be used to name the OpenTelemetry OpAMP Bridge component which will be added to the cluster
* The Namespace field is used to set the namespace to be used within the Kubernetes cluster

<figure><img src="../../.gitbook/assets/image (502).png" alt=""><figcaption></figcaption></figure>

* Click on the Proceed button to generate the README instructions and installation manifest

<figure><img src="../../.gitbook/assets/image (503).png" alt=""><figcaption></figcaption></figure>

* The Download All button can be used to download these files
* Apply the OpAMP Bridge manifest to the Kubernetes cluster as instructed in the README instructions
