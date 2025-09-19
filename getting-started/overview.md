---
icon: gauge
---

# Dashboards & Visualizations

Ascent has a robust dashboard capability which provides numerous methods to visualize your critical data - across metrics, events, logs, and traces. You can visualize and detect anomalies, and get notified before any potential incident.

## Creating a Dashboard <a href="#create-dashboard" id="create-dashboard"></a>

* Expand `Create` from the navbar and click `dashboard`. A popup will be displayed by prompting the dashboard name.
* Enter a name for the dashboard.
* Click on `Create`. You will be navigated to your new dashboard.

### Creating a Widget <a href="#add-widget" id="add-widget"></a>

On creating a new dashboard, it will be blank and not have any widgets. Widgets are created on top of the queries. If you don't have any queries created, please follow the documentation for [queries](https://docs.apica.io/observe/prometheus/querying-data) to create one.

* Click `Add Widget` button at the bottom of the page.
* Select a query that you want to visualize.
* Select a visualization for the selected query.
* Click `Add to Dashboard.`
* Click `Apply Changes.`

<figure><img src="../.gitbook/assets/Screenshot 2025-03-12 121613.png" alt=""><figcaption><p>Adding a widget to the Dashboard</p></figcaption></figure>

## Adding widgets to the Dashboard

Steps to add a widget:

* Navigate to the dashboard for which you need to add a widget.
* Click the More Options icon in the top right corner of the dashboard page.
* Click edit from the dropdown.
* Click the Add Widget button at the bottom of the page.
* Select a query that you want to visualize.
* Select a visualization for the selected query.
* Click Add to Dashboard.

## Publish your Dashboard&#x20;

To publish, simply click the publish button on the top right corner of the dashboard page. After your dashboard is published, you can share it with anyone using the share option.

## &#x20;Build an auto-refreshing Dashboard&#x20;

The dashboard widgets execute the queries and visualize the results. You can configure all the widgets to automatically refresh to get the latest results. &#x20;

Steps to make an auto-refreshing dashboard:

* Navigate to any dashboard.
* Click the down arrow button in the refresh button, which is available in the top right corner.
* Select the time interval in which all the widgets in the dashboard will be refreshed automatically.
* Now, the dashboard widgets will be refreshed on every selected time interval.

<figure><img src="../.gitbook/assets/Screenshot 2025-03-12 121826.png" alt=""><figcaption></figcaption></figure>

## Using Pre-defined Dashboards&#x20;

You can get more out of the monitoring dashboard when it monitors various aspects of your target. Building that kind of dashboard with more tricky queries can be time-consuming and delay you from knowing more about your application and infrastructure.&#x20;

We help you to build a viable dashboard with a few clicks by providing you with pre-defined dashboards for some of the most common use cases.&#x20;

### Importing a Dashboard&#x20;

* Expand the dashboard option from the navigation bar.
* Click on the Import dashboard.
* You will be navigated to the import dashboard page, where you will be provided with some of the pre-defined dashboards.
* Click the import button for the dashboard.
* You will be displayed with a pop-up that will ask you to provide the dashboard name and data source which will be used by the queries in the dashboard widgets.
* After providing the inputs, click Import. You will be navigated to the dashboard page.

<figure><img src="../.gitbook/assets/Screenshot 2025-03-12 122124.png" alt=""><figcaption><p>Import Dashboard</p></figcaption></figure>

Apica Ascent also includes a Grafana dashboard import section where popular Grafana dashboards can be directly imported into Apica Ascent. See the section on [Grafana Dashboard import](https://docs.apica.io/dashboards/import-grafana-dashboards) for how to use that capability.&#x20;

## Importing Grafana Dashboards&#x20;

Grafana is an open-source tool for building monitoring and visualization tools. It has a public repository with thousands of dashboards published and maintained by its community, which is being used by millions of people to monitor its infrastructure.&#x20;

We are providing some popular dashboards from their public repository for you to monitor. &#x20;

## Steps to Import Grafana Dashboard&#x20;

* Navigate to the import dashboard page.
* Click the Import Button under the Grafana dashboard.
* Select the type of target that you want to monitor. You will be provided with the list of dashboards available for the selected target.
* Click the view button to get details of that dashboard.
* Click select to import the dashboard.
* Provide a name for the dashboard and select the datasource that will be used by the widgets.
* Click Import. You will be redirected to the dashboard.

<figure><img src="../.gitbook/assets/Screenshot 2025-03-12 122237.png" alt=""><figcaption><p>Grafana Dashboard Import</p></figcaption></figure>

Our supported monitoring targets include:

* FluentBit
* Go Application
* Kafka
* Kubernetes
* Redis
* Postgres
* Prometheus
* Node
