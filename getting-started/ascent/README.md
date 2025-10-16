---
icon: cloud
---

# Getting Started with Ascent

The Ascent platform enables you to converge all of your IT data from disparate sources, manage your telemetry data, and monitor and troubleshoot your operational data in real-time. The following guide assumes that you have signed up for Apica Ascent in the cloud. **If you are not yet a registered user, please** [**follow this link and the defined steps**](https://app.gitbook.com/o/-LmzGjHypGkPBzYc0fF0/s/-LmzGprckLqwd5v6bs6m/~/changes/1642/getting-started/ascent/register-and-gain-access). Once registered, use this guide to get started.

<figure><img src="../../.gitbook/assets/image (927).png" alt=""><figcaption><p>Ascent Quick Start Process</p></figcaption></figure>

## Quick Start Process for Using Ascent

For all users that want to get started with Ascent should follow these five (5) simple steps:

1. [Collect Data from Input Sources](./#step-1-start-ingesting-data)
2. [Setup and Configure Pipeline](./#step-2-setup-and-configure-pipeline)
3. [Design Queries](./#step-3-design-queries)
4. [Create Dashboards](./#step-4-create-dashboards)
5. [Setup Alerts and Workflow](./#step-5-create-alerts-and-endpoints)

In this guide, we cover the key goals and related activities of each step to ensure a quick and easy setup of Ascent.

### Step 1 - Start Ingesting Data

For a quick video on step 1 for data ingestion, click on the link below:

{% embed url="https://www.youtube.com/embed/0bKKm44n58U?si=8f2EbhqHKBljAkgu" %}

The goal is to ingest telemetry data (logs, metrics, traces) from relevant systems.

**Key actions include:**&#x20;

* Identify all sources
* Choose agents appropriate for each data type
* Configure data collection frequency and granularity
* Ensure data normalization

**Detailed steps to start ingesting data:**

**LOG INTO ASCENT**

<figure><img src="../../.gitbook/assets/image (965).png" alt=""><figcaption></figcaption></figure>

From the menu bar, go to: Explore -> Fleet:

With Fleet you can automate your data ingestion configuration:

<figure><img src="../../.gitbook/assets/image (968).png" alt=""><figcaption></figcaption></figure>

You'll be directed to the Fleet landing page:

<figure><img src="../../.gitbook/assets/image (969).png" alt=""><figcaption></figcaption></figure>

From here, you'll click "Install Agent Manager."\
\- The Agent Manager will allow you to control and configure the OpenTelemetry Collector.

<figure><img src="../../.gitbook/assets/image (970).png" alt=""><figcaption></figcaption></figure>

Inside the "Install Agent Manager" pop-up screen, select:

* Platform: Linux
* Agent Type: OpenTelemetry Collector

Then, click 'Proceed'.

<figure><img src="../../.gitbook/assets/image (971).png" alt=""><figcaption></figcaption></figure>

You'll be redirected to the 'Fleet README' pop-up page:

* You'll download and configure this configuration file to start ingesting data.

<figure><img src="../../.gitbook/assets/image (972).png" alt=""><figcaption></figcaption></figure>

You'll download 2 files:

* The README.txt contains instructions for how to install the Agent Manager and OpenTelemetry Collector.
* The fleet-install.sh is a preconfigured script that you'll run on your Linux host to start ingesting data into Ascent automatically:

<div align="left"><figure><img src="../../.gitbook/assets/image (973).png" alt=""><figcaption></figcaption></figure></div>

On your Linux host, start by creating a file by running this command:

<div align="left"><figure><img src="../../.gitbook/assets/Screenshot 2025-05-23 at 11.08.17 AM.png" alt=""><figcaption></figcaption></figure></div>

Paste the contents of 'fleet-install.sh' into nano editor:

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-23 at 11.08.39 AM.png" alt=""><figcaption></figcaption></figure>

Run the Fleet-install.sh with the command below:

* sudo ./fleet-install.sh

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-23 at 11.10.54 AM.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-23 at 11.12.30 AM.png" alt=""><figcaption></figcaption></figure>

Once the script completes, you'll see the agent in the Fleet screen as 'Active':

<figure><img src="../../.gitbook/assets/image (974).png" alt=""><figcaption><p>Confirmation of Active Fleet Agent</p></figcaption></figure>

You can then confirm that data is flowing into the system (Go to 'Explore -> Logs & Insights):

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-23 at 4.49.42 PM.png" alt=""><figcaption><p>Log Data Flow</p></figcaption></figure>



**Additional Links to helpful docs include:**

* [Data sources overview](https://docs.apica.io/data-sources/overview)
* [Integrations overview](https://docs.apica.io/integrations/overview)

### Step 2 - Setup and Configure Pipeline

For a quick video on setup and configuration of a pipeline, click on the link below:

{% embed url="https://www.youtube.com/embed/ZgL3wV9yb9k?si=fL0uxMA-NZ3YpL__" %}

The goal is to transport and process the collected data.

**Key actions include:**

* Select or configure a data pipeline
* Define data routing rules
* Apply transformations, filtering, or enrichment if needed

**Links to related docs include:**

* [Configure pipelines](https://docs.apica.io/flow/pipeline-management/data-flow-pipelines-new)
* [Visualize pipelines](https://docs.apica.io/flow/pipeline-management/data-flow-pipelines)
* [Forwarding data](https://docs.apica.io/flow/pipeline-management/mapping-applications)

### Step 3 - Design Queries

For a quick video on designing queries and reports, click on the link below:

{% embed url="https://www.youtube.com/embed/_V8zupniOBA?si=dEtzv7gJyjBMfGnT" %}

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

### Step 4 - Create Dashboards

For a quick video on creating dashboards, click on the link below:

{% embed url="https://www.youtube.com/embed/yGzpLaMKLQg?si=_MlP_PZS_ECCExyu" %}

The goal is to visualize system performance and behavior in real time.

**Key actions include:**

* Use visual components
* Organize dashboards by domain
* Incorporate filters
* Enable drill-down for troubleshooting.

**Links to related docs include:**

* [Dashboards overview](https://docs.apica.io/getting-started/overview)

### Step 5 - Create Alerts and Endpoints

For a quick video on creating alerts and endpoints, click on the link below:

{% embed url="https://www.youtube.com/embed/iS9bElHtYb4?si=vigh0S7-OacJoclj" %}

The goal is to detect anomalies and automate response actions.

**Key actions include:**

* Define alerting rules
* Set up alert destinations
* Establish escalation policies and on-call schedules
* Integrate with incident management workflows and postmortem tools

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
