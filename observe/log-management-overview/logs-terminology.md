---
description: >-
  This page describes how Apica Ascent Observability Platform Organizes the
  logs.
---

# Terminology

Logs are organized by cluster\_id, namespaces, applications, and their processes.

### CLUSTER\_ID

CLUSTER\_ID is an optional label that can be applied to incoming data streams. E.g. it is a good practice to apply CLUSTER\_ID to a K8S cluster. All namespaces from the K8S cluster will get prefixed with CLUSTER\_ID so the user can distinguish between namespace name collisions across different clusters.

For Kubernetes clusters, CLUSTER\_ID is an attribute added to the JSON payload by the sending agent for e.g. Fluentd or Fluent-bit. [See here for on how to manage multiple clusters](../../integrations/list-of-integrations/fluent-bit/#managing-multiple-k8s-clusters-in-a-single-logiq-instance).

### Namespace

The namespace is the top of the hierarchy. For a Kubernetes based deployment namespace maps to Kubernetes namespace and for non-Kubernetes based deployment it maps to the host-name of the virtual machine or physical host.

### Application & Process

In the Kubernetes based deployments Application refers to deployment name and process refers to its pod names. For example for Nginx application (deployment/service) may have multiple pods which are its processes.

For the physical machine, the application refers to process names like Nginx or tomcat and process refers to process id.

There are multiple ways you can access the logs.

* The Logs page hierarchically arranges logs by Namespace, application and process. It lets you see the most recent logs for the process
* The Search page allows you to search through logs.
* The `apicactl` command line tool allows you to view logs in realtime.
