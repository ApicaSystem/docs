---
description: >-
  This document describes the steps needed to bring up the Apica Ascent
  observability stack using docker-compose for trial and demo use
icon: docker
---

# Quickstart with Docker-Compose

{% hint style="danger" %}
docker-compose based deployment should not be used for production envornments.
{% endhint %}

## Quickstart features

1. Log aggregation, search, reporting, and live tailing
2. APM using built-in Prometheus, using external Prometheus
3. Data sources - 21 data source connectors
4. Alerting
5. Incident response - PagerDuty, ServiceNow, Slack, Email
6. apicactl CLI connectivity
7. Dashboards and visualizations
8. Filtering rules and rule packs
9. User and group management
10. Log flow RBAC
11. UI Audit trail

## Install Docker compose

You can spin-up Apica Ascent using `docker-compose`. Install guide for `docker-compose` can be found here - [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)

{% hint style="info" %}
_**NOTE:** the docker-compose quick-start YAML files are intended for demo and trial use only. If you want to run a production deployment, Apica Ascent uses Kubernetes with HELM to deploy the stack. Please contact us at : sales@logiq.ai_
{% endhint %}

## Running Apica Ascent

{% hint style="info" %}
**NOTE:** Apica Ascent services use approximately 2GB of memory. Please have sufficient memory in your system before proceeding
{% endhint %}

The first step is to get the `docker-compose` YAML file from the URL below.

### Download Apica Ascent compose file

{% hint style="info" %}
⬇ Download the YAML at the URL - [https://logiqcf.s3.amazonaws.com/releases/docker-compose.quickstart.yml](https://logiqcf.s3.amazonaws.com/releases/docker-compose.quickstart.yml)
{% endhint %}

You are now ready to bring up the Apica Ascent stack.

### Download container images

```
docker-compose -f docker-compose.quickstart.yml pull
```

### Bring up the stack

```
docker-compose -f docker-compose.quickstart.yml up -d
```

{% hint style="info" %}
**NOTE:** If you have been running previous versions of Apica Ascent docker-compose, you should stop and remove the existing containers by running docker-compose -f docker-compose.quickstart.yml down and remove any older docker volume via docker-compose -f docker-compose.quickstart.yml rm && docker-compose -f docker-compose.quickstart.yml rm -v
{% endhint %}

### Delete the stack

If you are done with your evaluation and want to cleanup your environment, please run the following command to stop and delete the Apica Ascent stack and free up the used system resources.

```
docker-compose -f docker-compose.quickstart.yml down -v
```

## Test using Apica Ascent UI

Once the Apica Ascent server is up and running, the Apica Ascent UI can be accessed as described above on <mark style="color:green;">**port 80**</mark> on the server docker-compose. You will be presented with a login screen as shown below.

{% hint style="info" %}
Use _flash-admin@foo.com_ / _flash-password_ to login
{% endhint %}

<figure><img src="../.gitbook/assets/Screen Shot 2024-02-14 at 10.55.14 AM.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/Screen Shot 2024-02-14 at 10.58.05 AM.png" alt=""><figcaption></figcaption></figure>

## Ingesting data

For setting up data ingestion from your endpoints and applications into Apica Ascent, please refer to the [Integrations section](../integrations/overview/).

**The quickstart compose file includes a test data tool** that will generate test log data and also has a couple of dashboards that show Apica Ascent's APM capabilities.

The test log data can be viewed under Explore page

<figure><img src="../.gitbook/assets/Screen Shot 2024-02-14 at 10.58.05 AM.png" alt=""><figcaption></figcaption></figure>

Click on any Application and you will be taken to the Flows page with detailed logs and a search view. You can search for any log pattern, searches can also be run using regex expressions along with conditional statements using Advanced search across a time period.

<figure><img src="../.gitbook/assets/Screen Shot 2024-02-14 at 11.00.00 AM.png" alt=""><figcaption></figcaption></figure>

## Distributed Tracing

Apica Ascent provides application performance monitoring (APM) which can help end-to-end monitoring for microservices architectures, traces can be sent over 14250 (gRPC port). To view traces, navigate to **Trace** page under Explore.

select the Service and a list of traces will appear on the right-hand side of the screen. The traces have titles that correspond to the **Operator** selector on the search form. The traces can be further analyzed by clicking on the Analyse icon which will pull up the entire logs for the corresponding trace-id.

<figure><img src="../.gitbook/assets/Screen Shot 2024-02-14 at 11.01.51 AM.png" alt=""><figcaption></figcaption></figure>

Analyze icon displays all the logs for the respective trace-id in a given time range.

<figure><img src="../.gitbook/assets/Screen Shot 2024-02-14 at 11.06.42 AM.png" alt=""><figcaption></figcaption></figure>

To view the detailed trace, you can select a specific trace instance and check details like the time taken by each service, errors during execution, and logs.

<figure><img src="../.gitbook/assets/Screen Shot 2024-02-14 at 11.02.34 AM.png" alt=""><figcaption></figcaption></figure>

### Prometheus monitoring and alerting

The Apica Ascent quickstart file includes Prometheus and Alertmanager services. 2 APM Dashboards to monitor the quickstart environments are included.

{% hint style="info" %}
**NOTE:** It may take up to 1 minute for the APM metrics to appear once initial setup. Please use the "Refresh" button at the top right section of the Dashboards to refresh.
{% endhint %}

<figure><img src="../.gitbook/assets/Screen Shot 2024-02-14 at 11.13.58 AM.png" alt=""><figcaption></figcaption></figure>

## Firewall ports and URLs

Please refer to the [ports list ](../integrations/overview/data-ingest-ports.md)supported by Apica.
