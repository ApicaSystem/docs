# Using the OpenTelemetry Demo

## What is the OpenTelemetry (OTel) Demo?

The OTel Demo is a microservices-based application created by OpenTelemetry's community to demonstrate its capabilities in a realistic, distributed system environment. This demo application, known as the OpenTelemetry Astronomy Shop, simulates an e-commerce website composed of over 10 interconnected microservices (written in multiple languages), and communicates via HTTP and gRPC. Each service is fully instrumented with OTel, generating comprehensive traces, metrics, and logs.&#x20;

The demo serves as an invaluable resource for understanding how to implement and use OpenTelemetry in real-world applications. Using the Ascent platform with the OTel Demo enables you to converge all of the IT data, manage the telemetry data, and monitor and troubleshoot the operational data in real-time. The following steps guide you through the process of using the OTel Demo application with Ascent.

<figure><img src="../../.gitbook/assets/image (927).png" alt=""><figcaption><p>Ascent Quick Start Process</p></figcaption></figure>

## Quick Start Process for Using the OTel Demo with Ascent

All users getting started with using the OTel Demo with Ascent should follow these simple steps:

1. [Setup and Deploy the OTel Demo App (steps 1-9)](using-the-opentelemetry-demo.md#setting-up-the-otel-demo)
2. [Setup and Configure Pipeline](using-the-opentelemetry-demo.md#step-10-setup-and-configure-pipeline)
3. [Design Queries](using-the-opentelemetry-demo.md#step-11-design-queries)
4. [Create Dashboards](using-the-opentelemetry-demo.md#step-12-create-dashboards)
5. [Setup Alerts and Workflow](using-the-opentelemetry-demo.md#step-13-setup-alerts-and-workflow)
6. [Review Ongoing Data & Cost Savings](using-the-opentelemetry-demo.md#flow-cost-savings-use-case)

In these steps, we cover the key goals and related activities to ensure a quick and easy setup of OTel Demo with Ascent along with the full pipeline deployment process.

### How to Deploy the OTel Demo Application

The goal is to ingest telemetry data (logs, metrics, traces) from relevant systems.

**Key actions include:**&#x20;

* Accessing and deploying the public OpenTelemetry (OTel) Demo App
* Configure data collection setup, frequency and granularity
* Ensure data normalization

This guide aims to walk you through the steps required to deploy the OpenTelemetry Demo app and begin sending data to Ascent.

**NOTE**: We will deploy the OTel demo app using Docker for this guide.

## Prerequisites:

* Docker
* [Docker Compose v2.0.0+](https://docs.docker.com/compose/install/)
* 6 GB of RAM for the application

## Setting Up the OTel Demo

### Step 1: Get and Clone the OTel demo app repository:

`$ git clone https://github.com/open-telemetry/opentelemetry-demo.git`

### Step 2: Go to the demo folder:

`$ cd opentelemetry-demo/`

### Step 3: Start the demo app in Docker:

`$ docker compose up --force-recreate --remove-orphans --detach`

### Step 4: (Optional) Enable API observability-driven testing:

`$ docker compose up --force-recreate --remove-orphans --detach`

### Step 5: Test and access the OTel demo application:

Once the images are built and containers are started, you can now access the following OpenTelemetry components on the demo app web store:

* Web store: [http://localhost:8080/](http://localhost:8080/)
* Grafana: [http://localhost:8080/grafana/](http://localhost:8080/grafana/)
* Load Generator UI: [http://localhost:8080/loadgen/](http://localhost:8080/loadgen/)
* Jaeger UI: [http://localhost:8080/jaeger/ui/](http://localhost:8080/jaeger/ui/)
* Tracetest UI: [http://localhost:11633/](http://localhost:11633/), only when using `make run-tracetesting`
* Flagd configurator UI: [http://localhost:8080/feature](http://localhost:8080/feature)

### Optional: Changing the demo’s primary port number <a href="#changing-the-demos-primary-port-number" id="changing-the-demos-primary-port-number"></a>

By default, the demo application will start a proxy for all browser traffic bound to port 8080. To change the port number, set the `ENVOY_PORT` environment variable before starting the demo.

* For example to use port 8081:

`$ ENVOY_PORT=8081 docker compose up --force-recreate --remove-orphans --detach`

### Step 6: Update the OTel config file:

* /src/otel-collector/otelcol-config-extras.yml

Paste the following into the config file, overwriting it completely:

1.  Copy

    ```
    exporters:
      otlphttp/apicametrics:
        compression: gzip
        disable_keep_alives: true
        encoding: proto
        metrics_endpoint: "https://<YOUR-ASCENT-ENV>/v1/metrics"
        headers:
          Authorization: "Bearer <YOUR-INGEST-TOKEN>"
        tls:
          insecure: false
          insecure_skip_verify: true
      otlphttp/logs:
        logs_endpoint:  https://<YOUR-ASCENT-ENV>/v1/json_batch/otlplogs?namespace=OtelDemo&application=DemoLogs
        encoding: json
        compression: gzip
        headers:
          Authorization: "Bearer <YOUR-INGEST-TOKEN>"
        tls:
          insecure: false
          insecure_skip_verify: true
    service:
      pipelines:
        metrics:
          exporters: [otlphttp/apicametrics]
        logs:
          exporters: [otlphttp/logs]
    ```
2. Replace \<YOUR-ASCENT-ENV>with your Ascent domain, e.g. company.apica.io
3. Replace \<YOUR-INGEST-TOKEN>with your Ascent Ingest Token, e.g. eyXXXXXXXXXXX...
   1. See 'Step 7' to get your 'ingest-token'
4. Optional if you want to change the namespace and or application (to help ID your data in Ascent):\
   `logs_endpoint:  https://<YOUR-ASCENT-ENV>/v1/json_batch/otlplogs?namespace=<NAMESPACE_HERE>&application=<APPLICATION_NAME_HERE>`
   1. Update \<NAMESPACE\_HERE> and \<APPLICATION\_NAME\_HERE> for a custom namespace and application in Ascent.

### Step 7: Get Your Ingest Token from Ascent:

* [https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token)

### Step 8: Get Data Flowing into Ascent Platform:

Restart the OpenTelemetry collector by running the following command:

`$ docker compose restart`

### Step 9: Verify data flow in Ascent:

1. Log into Ascent
2. Navigate to Explore -> Logs & Insights:

<figure><img src="../../.gitbook/assets/image (975).png" alt=""><figcaption><p>Logs &#x26; Insights</p></figcaption></figure>

3.  You should see namespace "OtelDemo" and Application "DemoLogs":\


    <figure><img src="../../.gitbook/assets/image (976).png" alt=""><figcaption></figcaption></figure>


4. This confirms that data is flowing from the Opentelemetry Demo Application. Feel free to click into application "DemoLogs" to view all the logs that are being sent from the Demo App.&#x20;



**Now that data is flowing, please follow the steps below to learn how to interact, enhance, and visualize this data in Ascent.**

### Step 9 - FLOW (Cost Savings Use Case)

[FLOW Guide Here](using-the-opentelemetry-demo.md#flow-cost-savings-use-case)

### Step 10 - Setup and Configure Pipeline

The goal is to transport and process the collected data.

**Key actions include:**

* Select or configure a data pipeline
* Define data routing rules
* Apply transformations, filtering, or enrichment if needed

**Links to related docs include:**

* [Configure pipelines](https://docs.apica.io/flow/pipeline-management/data-flow-pipelines-new)
* [Visualize pipelines](https://docs.apica.io/flow/pipeline-management/data-flow-pipelines)
* [Forwarding data](https://docs.apica.io/flow/pipeline-management/mapping-applications)

### Step 11 - Design Queries

The goal is to enable insights by querying telemetry data.

**Key actions include:**

* Understand the query language used
* Create baseline queries for system health
* Optimize queries for performance and cost
* Validate query results

**Links to related docs include:**

* [Data explorer overview](https://docs.apica.io/data-management/overview-1)
* [Query builder](https://docs.apica.io/data-management/overview-1/query-builder)
* [Widget](https://docs.apica.io/data-management/overview-1/widget)

### Step 12 - Create Dashboards

The goal is to visualize system performance and behavior in real time.

**Key actions include:**

* Use visual components
* Organize dashboards by domain
* Incorporate filters
* Enable drill-down for troubleshooting.

**Links to related docs include:**

* [Dashboards overview](https://docs.apica.io/getting-started/overview)

### Step 13 - Setup Alerts and Workflow

The goal is to detect anomalies and automate response actions.

**Key actions include:**

* Define alerting rules
* Set up alert destinations
* Establish escalation policies and on-call schedules
* Integrate with incident management workflows and postmortem tools

### FLOW - Cost Savings Use Case

FLOW allows you to filter unecessary data out of your logs before hitting the data lake which leads to significant cost savings. This guide will walk you through how to drop labels from our Otel Demo App logs. You can apply the same functionality to any other data source.&#x20;



1. Navigate to the Logs & Insights page:

<figure><img src="../../.gitbook/assets/image (997).png" alt=""><figcaption><p>Logs &#x26; Insights</p></figcaption></figure>

2. This view lists all of the datasources pushing data to Ascent. To access the logs, click into "DemoLogs".

<figure><img src="../../.gitbook/assets/image (996).png" alt=""><figcaption></figcaption></figure>

3. To view one of the logs simply click one of them.&#x20;

<figure><img src="../../.gitbook/assets/image (998).png" alt=""><figcaption></figcaption></figure>

4. We have one of our otel logs here. In this example, we will be dropping "destination.address" and "event.name" from the logs.

<figure><img src="../../.gitbook/assets/image (993).png" alt=""><figcaption><p>Otel Demo App Logs</p></figcaption></figure>

5. To drop these fields, navigate to the Pipeline tab and then click the + button shown below:

<figure><img src="../../.gitbook/assets/image (1003).png" alt=""><figcaption><p>Pipeline View</p></figcaption></figure>

5. Create a new Pipeline:

<figure><img src="../../.gitbook/assets/image (1000).png" alt="" width="563"><figcaption><p>New Pipeline</p></figcaption></figure>

7. Add a new Filter Rule. If you're interested in the other rules please use this documentation: [https://docs.apica.io/flow/rules](https://docs.apica.io/flow/rules) for a detailed guide.

<figure><img src="../../.gitbook/assets/image (986).png" alt="" width="563"><figcaption><p>Filter Rule </p></figcaption></figure>

8. Enable Drop Labels by click the slider:

<figure><img src="../../.gitbook/assets/image (987).png" alt="" width="563"><figcaption><p>Drop Labels</p></figcaption></figure>

9. On the right of the screen you'll want to preview the logs to know what labels to drop. Select the following and then hit Preview in the top right:

<figure><img src="../../.gitbook/assets/image (988).png" alt=""><figcaption><p>Preview Logs</p></figcaption></figure>

10. Here are the two labels we want to drop:

<figure><img src="../../.gitbook/assets/image (1002).png" alt=""><figcaption><p>Labels</p></figcaption></figure>

11. Select the key in the dropdown by typing them out or clicking.

<figure><img src="../../.gitbook/assets/image (990).png" alt=""><figcaption><p>Select Label</p></figcaption></figure>

12. Click "Save" in the bottom right:

<figure><img src="../../.gitbook/assets/image (819).png" alt=""><figcaption></figcaption></figure>



12. Go back to the log view to verify the filter rule has been applied. Refresh the page and make sure it is a new log that you're verifying:

<figure><img src="../../.gitbook/assets/image (995).png" alt=""><figcaption><p>Logs &#x26; Insights</p></figcaption></figure>

13. As you can see, destination.address and event.name are no longer being ingested:

<figure><img src="../../.gitbook/assets/image (991).png" alt=""><figcaption><p>Otel Log</p></figcaption></figure>

Dropping a few labels might not seem like a big deal at first, but if you exrapolate that over 10,000 or 100,000's logs, the cost savings start to add up QUICK.

\
14\. To view savings and your configured pipelines navigate to "Pipelines":

<figure><img src="../../.gitbook/assets/image (1004).png" alt=""><figcaption><p>Pipelines</p></figcaption></figure>

15. View all your pipeline data along with savings:\


    <figure><img src="../../.gitbook/assets/image (1005).png" alt=""><figcaption><p>Pipeline Dashboard</p></figcaption></figure>


16. For more information on pipelines please see [setup and configure pipelines](using-the-opentelemetry-demo.md#step-10-setup-and-configure-pipeline)



**Links to related docs include:**

* [Alerts overview](https://docs.apica.io/logiq-events/alerts)
* [Alerting on queries](https://docs.apica.io/logiq-events/alerts-simple-anomaly)
* [Alerting on logs](https://docs.apica.io/logiq-events/alerts-1)

## Additional Resources

Here are helpful links to other "Getting Started" technical guides:

* [Getting Started with Metrics](getting-started-with-metrics.md)
* [Getting Started with Logs](getting-started-with-logs/)
* [Get acquainted with the Apica Ascent UI](../../product-overview/the-ascent-ui.md)
* [Configure your data sources](../../integrations/overview/)
* [Configure Apica Ascent to send alerts to your email server](../../admin/email-configuration-setup.md)
* [Add and configure alert destinations like email, Slack, and PagerDuty](../../integrations/list-of-integrations/alert-destinations/)
* [Configure SSO using SAML](../../admin/single-sign-on-configuration.md)
* [Configure RBAC](../../observe/log-management-overview/configuring-rbac.md)
