# Analyze Metrics

The **Analyze Metrics** view allows you to compare data from one or more checks by selecting specific data within check results.



## Add Metrics <a href="#analyzemetrics-addmetrics" id="analyzemetrics-addmetrics"></a>

You can add up to 8 different metrics to the graph, using any available check in your account as data source.



### Adding Metrics <a href="#analyzemetrics-addingmetrics" id="analyzemetrics-addingmetrics"></a>

To add a metric to the chart:

*

    Find the metrics menu at the bottom of the view



* Open the **Select Datasource** dropdown menu
* Select a type of check or integration source



* Open the **Select Datasource** dropdown menu
* Select a check



To add additional metrics:

* Click the **Add Another Metric** button, and repeat the process

## Analyze Metrics Configuration <a href="#analyzemetrics-analyzemetricsconfiguration" id="analyzemetrics-analyzemetricsconfiguration"></a>

With a set of metrics selected for the chart, you can perform additional configuration.



### Chart Menu <a href="#analyzemetrics-chartmenu" id="analyzemetrics-chartmenu"></a>

The  **Chart Menu** button provides access to additional actions for the chart, such as print and download options. The current view of the chart can be printed and/or downloaded in various formats.



| Menu Choice                | Download Format                     |
| -------------------------- | ----------------------------------- |
|  Print Chart               | Print from the system print dialog. |
|  Download PNG image        | Portable Network Graphics.          |
|  Download JPEG image       | Joint Photographic Experts Group    |
|  Download PDF document     | Portable Document Format            |
|  Download SVG vector image | Scalable Vector Graphics            |

Files are downloaded immediately and are available in your default download folder.

### Averages <a href="#analyzemetrics-averages" id="analyzemetrics-averages"></a>

For values that share a common unit, you can add lines indicate the average value for all metrics in the _Date Range_. A checkbox is available at the top of the chart, next to each value type:



Checking a box will display the average for that value type and unit in the chart:



### Shared Axis <a href="#analyzemetrics-sharedaxis" id="analyzemetrics-sharedaxis"></a>

If you have multiple metrics of different types that share the same unit, you can use a single Y-axis for display of their values. The default setting is to have multiple axes for different metrics:



The checkbox is available at the top of the chart:



Checking the box will combine Y-values for each unit type into one Y-axis for each type:



### Show Custom Events <a href="#analyzemetrics-showcustomevents" id="analyzemetrics-showcustomevents"></a>

If you have or expect to have Custom Events, you can display them in the timeline, below the metrics in the chart.

The checkbox is available at the top of the chart:



Checking the box will show any custom events occurring during the Date Range.



You can add custom events in Health & Events from the Custom Events view.

### Date Range <a href="#analyzemetrics-daterange" id="analyzemetrics-daterange"></a>

#### Date Range <a href="#analyzemetrics-daterange.1" id="analyzemetrics-daterange.1"></a>

The information in the graph is displayed for a specific date interval, which can be configured.

**View**

The configuration of displayed interval is available at the top of the chart:



This date range can also be stored as part of a saved Save View.

## Analyze Metrics <a href="#analyzemetrics-analyzemetrics" id="analyzemetrics-analyzemetrics"></a>

Analyze Metrics allows you to create a combined graph for metrics from multiple checks on the same timeline. Using the Analyze Metrics feature is a multistep process:

* You begin by picking up to 8 different metrics to display, by _Add Metrics_ from available checks.
  * You can set a _Custom Threshold_ to highlight any metrics that break that threshold.
  * Metric _Averages_ can be added to the graph to illustrate the variations in values over time.
  * Values that share the same unit of measure, can be displayed against a _Shared Axis_.
  * The graph can be printed or _Chart Menu_ as an image file.
* A particular combination of metrics can be saved as a _Save View_ for reuse which can be shared with other people, whether or not they have Synthetic Monitoring Accounts.
* The view can be used to create a _Analyze Metrics Subscription_ that is automatically sent via email to subscribers.

The following video provides a quick demonstration of the Analyze Metrics feature.

video\_1280.mp4

### Usage <a href="#analyzemetrics-usage" id="analyzemetrics-usage"></a>

The Analyze Metrics graph can be used in a lot of different ways to highlight information by combining information from multiple data sources.

### Share Information <a href="#analyzemetrics-shareinformation" id="analyzemetrics-shareinformation"></a>

The typical case to use Analyze Metrics is when you want to show metrics for a number of checks to people who don't have accounts in Synthetic monitoring. This could be customers relating to SLA agreements, Management or other teams for performance monitoring, or the general public for transparency. By using the Analyze Metric link, they get anonymous access to monitoring results.

**Example:** The performance of a server application is monitored by displaying the DOM Complete browser metrics for browser checks, using several checks to illustrate different areas of the application.

### Monitor Competition <a href="#analyzemetrics-monitorcompetition" id="analyzemetrics-monitorcompetition"></a>

With competition in your field, you may want to keep an eye on how your service or application performs compared to the competitor's offering. This can be achieved as long as they provide a publicly accessible interface, and you don't overload it with queries.

**Example:** The competitor's website is measured through a browser check with an attached scenario performing a number of tasks. Corresponding tasks are performed with a different browser scenario check on the in-company website. Metrics for both are displayed in an Analyze Metric graph.

### Multiple Locations <a href="#analyzemetrics-multiplelocations" id="analyzemetrics-multiplelocations"></a>

If you have your customers distributed geographically, you want to get a handle on how your performance is affected by where a customer accesses it from, compared to other locations.

**Example:** The same set of tasks are monitored by a browser check using multiple locations. The response time for the different locations is displayed in the Analyze Metrics graph, providing a quick visual overview of the differences in performance.

### Release Impact <a href="#analyzemetrics-releaseimpact" id="analyzemetrics-releaseimpact"></a>

When you make changes to your service or application, you will want to make sure that upgrades actually are improvements, and don't have any unforeseen negative effects.

**Example:** A number of different checks monitoring different aspects of the application are displayed together in the Analyze Metrics graph. Custom events are added to indicate release dates and system changes so that their impact is highlighted in the graph.

### Outage Review <a href="#analyzemetrics-outagereview" id="analyzemetrics-outagereview"></a>

When you are dependent on 3rd party services, it becomes important to determine how service outages or failover procedures impact your own application.

**Example:** Checks monitoring the 3rd party service directly are shown together with a set of standardized checks monitoring the application, providing insights into how the supporting service outages impact the main application.

## Analyze Metrics Subscription <a href="#analyzemetrics-analyzemetricssubscription" id="analyzemetrics-analyzemetricssubscription"></a>

By saving a _View_ as a **subscription**, you can have it automatically sent out at regular intervals to a number of recipients.



The view allows users to do some customizing while watching it, but these changes are permanently saved.

### Subscription Configuration <a href="#analyzemetrics-subscriptionconfiguration" id="analyzemetrics-subscriptionconfiguration"></a>

Subscriptions are always based on a particular _View_, but you can create the subscription right away when you create the view.

### Configuration <a href="#analyzemetrics-configuration" id="analyzemetrics-configuration"></a>

Subscriptions are always based on a particular _Save View_, but you can create the subscription right away when you create the view.

#### View <a href="#analyzemetrics-view.1" id="analyzemetrics-view.1"></a>

You can select existing views from the **View** dropdown menu.



Clicking the **Save & Share View** button will open the **Save View** dialog:



With the **Create Subscription** checkbox selected, additional options are available:

| Item                      | Description                                                    |                                                        |     |
| ------------------------- | -------------------------------------------------------------- | ------------------------------------------------------ | --- |
| Report                    |  Checkboxes to select interval for report generation.          |  Choose one or multiple: `daily`, `weekly`, `monthly`. |     |
| Recipients                | List of email recipients.                                      | Separated with comma or semi-colon.                    |     |
| Email User                | Report Email user configured in the Account.                   |                                                        |     |
| Email Customer            | Customer email user configured in the Account.                 |                                                        |     |
| Extra email recipients    | List of additional recipients. (semicolon- or comma-separated) |                                                        |     |
| Report Name               | Template used to name the report.                              |  Is used in the subject of the report email.           |     |
| Report File Name Template | Template used to name the report file.                         |                                                        |     |
| Regional Setting          | Country to use for the regional settings in reports.           |                                                        |     |
| Time Zone                 | Time Zone to use for report generation.                        |                                                        |     |

**Placeholders**

The naming templates for report name and filename can contain **placeholders**. These will be replaced with dynamical information when the report is generated.

Report Name

|            | Placeholder                                     | Replacement |
| ---------- | ----------------------------------------------- | ----------- |
| {`Period`} | Report interval (`daily`, `weekly`, `monthly`). |             |

Report File Name

| Placeholder   | Replacement                                          |
| ------------- | ---------------------------------------------------- |
| {`Date`}      | Date of report generation.                           |
| {`FileIndex`} | A sequence number for each file in the report email. |

### Custom Thresholds <a href="#analyzemetrics-customthresholds" id="analyzemetrics-customthresholds"></a>

You can add **Custom Threshold** values to the chart metrics. These will indicate points during the _Date Range_ where a particular metric falls below expectation.

**View**



### Metrics Threshold Configuration <a href="#analyzemetrics-metricsthresholdconfiguration" id="analyzemetrics-metricsthresholdconfiguration"></a>

#### Configuration <a href="#analyzemetrics-configuration.1" id="analyzemetrics-configuration.1"></a>

You can add custom thresholds for any configured metric.

**View**

To add custom thresholds to metrics:



* Check the **analyze thresholds** checkbox



* Enter the desired threshold values in the corresponding boxes

Instances where the metric falls below the threshold value(s) are shown in the timeline below the main chart:



In addition, a table showing statistics for the instances is displayed below the timeline:



The statistics can be downloaded as a comma-separated file:



Clicking the **Export to CSV** will download the data as `.csv` file to your default download location.

#### Save View <a href="#analyzemetrics-saveview" id="analyzemetrics-saveview"></a>

When you have configured a metric analysis, you can save the view with all access later with the Save & Share View Button.



#### &#x20;Configuring a View <a href="#analyzemetrics-configuringaview" id="analyzemetrics-configuringaview"></a>

Creating a View creates a distributable link for re-use, sending to colleagues, or which can be subscribed to as a regular report.

You can select existing views from the **View** dropdown menu.

To create a new view:

* Click the **Save & Share View** button

This will open the **Save View** dialog:



|                      |                                                                                | Item                                                                         | Description |
| -------------------- | ------------------------------------------------------------------------------ | ---------------------------------------------------------------------------- | ----------- |
| Name                 | Unique name for the view.                                                      |                                                                              |             |
| Save With Date Range | Save the currently configured Date Range with the view.                        |  Unless selected, the view will show data for the day the chart is accessed. |             |
| Create Subscription  | Show additional options to create a Analyze Metrics Subscription for the view. |                                                                              |             |

When you click **Save**, a link for the view is created:



This link can be copied and distributed to any interested parties.
