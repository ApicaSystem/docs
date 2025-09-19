# Integrating ASM Metrics into Grafana Using Apica Panels

The **Panels menu** can create customized display views to visualize metrics in real-time with a Grafana-powered solution.



## Panel list: <a href="#integratingasmmetricsintografanausingapicapanels-panellist" id="integratingasmmetricsintografanausingapicapanels-panellist"></a>



### Panel view: <a href="#integratingasmmetricsintografanausingapicapanels-panelview" id="integratingasmmetricsintografanausingapicapanels-panelview"></a>



The Panels give you the ability to analyze and share end-user experience data with all stakeholders for maximum visibility. This provides insights into all check results as they happen, and detailed information about all your KPI.

## Data Source <a href="#integratingasmmetricsintografanausingapicapanels-datasource" id="integratingasmmetricsintografanausingapicapanels-datasource"></a>

Synthetic Monitoring is provided as a custom **Data Source** for use with Grafana.

**View**



#### Data Source <a href="#integratingasmmetricsintografanausingapicapanels-datasource.1" id="integratingasmmetricsintografanausingapicapanels-datasource.1"></a>

A **Data Source** is exactly that - a source of data. They provide the metrics you use to create your dashboards and panels.

**Grafana Data Source**

Apica provides data through the Synthetic Monitoring data source. It accesses the ASM [API](http://academy.apicasystems.com/asmdocs/tools/api/start) endpoint with the user **Auth Ticket**. The auth ticket can be obtained by logging into to your Apica Synthetic Monitoring portal account and selecting Tools > API from the top menu bar:



&#x20;**Note:** The authorization is connected to a specific ASM user. Only checks _accessible to that user_ will be accessible in Panels.

&#x20;**Security Warning:** Using a Synthetic Monitoring user with admin access is **definitely not recommended**, since the auth ticket is visible in Grafana.

**Creation**

When the Grafana integration is first set up for your account, an Synthetic Monitoring data source is created for you.

If you need additional data sources, please contact [support@apica.io](mailto:support@apica.io).

**Overview**

The Panels are a custom integration with Grafana, and by default work only with Synthetic Monitoring as a data source.

**Installation**

If you wish to use other data sources types together with Synthetic Monitoring, please contact [support@apica.io](mailto:support@apica.io).

## Panel Widgets <a href="#integratingasmmetricsintografanausingapicapanels-panelwidgets" id="integratingasmmetricsintografanausingapicapanels-panelwidgets"></a>

The **Panel Widgets** allow you to populate your Grafana dashboards with data visualizations from your Synthetic Monitoring according to your needs.



## Panel Widgets <a href="#integratingasmmetricsintografanausingapicapanels-panelwidgets.1" id="integratingasmmetricsintografanausingapicapanels-panelwidgets.1"></a>

A Grafana **Panel** is a widget used in dashboards to display metrics from a particular Data Source.

### Creation <a href="#integratingasmmetricsintografanausingapicapanels-creation.1" id="integratingasmmetricsintografanausingapicapanels-creation.1"></a>

When the Grafana integration is first set up for your account, a default Grafana Dashboard is created for you, containing a default set of panel widgets:

The default dashboard contains these panel widgets:

* Account level info:
  * Total number of checks running now in severity: I, E, F, W
  * The number of checks per check type
* Group level info (if a monitor group was selected on dashboard creation):
  * Group summary (Avg values, avg values last 24 h, SLA % current mobnth)
  * Normal checks in group / total checks in group
* Check level info (if a check was selected on dashboard creation):
  * Check summary (status, spark line)
  * A graph that shows response time as a line and standard deviation as a bar chart

## Add Widget <a href="#integratingasmmetricsintografanausingapicapanels-addwidget" id="integratingasmmetricsintografanausingapicapanels-addwidget"></a>

### Add Panel Widget <a href="#integratingasmmetricsintografanausingapicapanels-addpanelwidget" id="integratingasmmetricsintografanausingapicapanels-addpanelwidget"></a>

For newly created widgets, a searchable and scrollable list of widgets is shown at the top:



To show the list:



* Click the **row menu** button



* Choose **Add Panel**

The list is shown at the top:



You can now select a widget to add and configure:



* Type (part of) the widget name in the search box



* Click the widget

The widget is added to the row:



(For illustration, a random walk is added as data for graph widgets when a data source is not configured.)

## Edit Widget <a href="#integratingasmmetricsintografanausingapicapanels-editwidget" id="integratingasmmetricsintografanausingapicapanels-editwidget"></a>

All settings for a panel widget are available from the panel widget **settings** dialog.

### Edit Panel Widget <a href="#integratingasmmetricsintografanausingapicapanels-editpanelwidget" id="integratingasmmetricsintografanausingapicapanels-editpanelwidget"></a>

To edit a panel widget:



* Click the widget name to open the menu



* Click **Share**



The exact tabs available to edit for a panel widget varies with the panel widget type.

For details about each widget, see the Panels Types section.

## Move Widget <a href="#integratingasmmetricsintografanausingapicapanels-movewidget" id="integratingasmmetricsintografanausingapicapanels-movewidget"></a>

Panel widgets can be moved between rows by dragging and dropping them.

### Drag-and-drop <a href="#integratingasmmetricsintografanausingapicapanels-drag-and-drop" id="integratingasmmetricsintografanausingapicapanels-drag-and-drop"></a>



* Click the panel widget and hold the mouse button
* Drag the widget to the deisred location
* Release the mouse button

If the target space is vacant, the widget is moved.

Dropping the widget on top of another widget will cause them to switch places.

## Share Widget Links <a href="#integratingasmmetricsintografanausingapicapanels-sharewidgetlinks" id="integratingasmmetricsintografanausingapicapanels-sharewidgetlinks"></a>

With **Panel links**, you can share a panel through a direct link. The link will show the panel widget according to the settings you provide, so the view can be different from the current state.

**Note:** This requires access to Grafana for whomever is supposed to see the panel.

### Create Panel widget link <a href="#integratingasmmetricsintografanausingapicapanels-createpanelwidgetlink" id="integratingasmmetricsintografanausingapicapanels-createpanelwidgetlink"></a>

To create a panel widget link:



* Click the widget name to open the menu



* Click **Share**



* Select the **Link** tab
* Select options as desired:

| Item                       | Description                                                                                         | Comment                  |
| -------------------------- | --------------------------------------------------------------------------------------------------- | ------------------------ |
| Current Time Range         | Time Time Range.                                                                                    |                          |
| Template Variables         | Templating Templates.                                                                               |                          |
| Theme                      | Display UI Theme.                                                                                   | `current`/`dark`/`light` |
| Direct Link Rendered Image | Creates a static image of the current status and provides a link and opens it in a separate window. |                          |

**Note:** Make sure that any changes you made to the panel widget has been saved before creating the link.

* Click **Copy**

You can now paste the link wherever you need it.

### Create Image <a href="#integratingasmmetricsintografanausingapicapanels-createimage" id="integratingasmmetricsintografanausingapicapanels-createimage"></a>

Using the share dialog, you can create a static image of the current panel widget status.

**Create Panel Widget Image**

To create a panel widget link:



* Click the widget name to open the menu



* Click **Share**



* Select the **Link** tab
* Select options as desired:
* Time range
* Variables
* Theme
* Click **Direct Link Rendered Image**

A separate browser window opens containing the the image.



You can now download the image or copy the URL for use elsewhere.

## Time Override <a href="#integratingasmmetricsintografanausingapicapanels-timeoverride" id="integratingasmmetricsintografanausingapicapanels-timeoverride"></a>

If you want individual panel widgets to display metrics from different time periods in the same dashboard, you can override the relative time range for individual panel widgets



| Item                    | Description                                                    |
| ----------------------- | -------------------------------------------------------------- |
| Override Relative Time  | Start time period.                                             |
| Add Time Shift          | End time period.                                               |
| Hide Time Override Info | Hides override info text shown in the upper right of a widget. |

**Feature Notes**

**Note:** Only relative time ranges can be used for panel widget time override.

Some considerations to keep in mind when using time overrides in panel widgets:

* The panel relative time override is only active when the dashboard time is also relative.
* The panel timeshift override is always active, even when the dashboard time is absolute.
* If the dashboard time range is manually selected (zoomed), all panel widget overrides will be disabled.

## Types of Widgets <a href="#integratingasmmetricsintografanausingapicapanels-typesofwidgets" id="integratingasmmetricsintografanausingapicapanels-typesofwidgets"></a>

### Apica Specific Widgets <a href="#integratingasmmetricsintografanausingapicapanels-apicaspecificwidgets" id="integratingasmmetricsintografanausingapicapanels-apicaspecificwidgets"></a>

The Apica Panel Widgets provide specific visualizations related to Synthetic Monitoring data.

#### Worldmap <a href="#integratingasmmetricsintografanausingapicapanels-worldmap" id="integratingasmmetricsintografanausingapicapanels-worldmap"></a>

With the Apica Worldmap panel widget, you get a tile map of the world where information about results can be shown for each location.



Data can be shown on account or monitor group level. For each location details are available by hovering over the location point.



#### Status <a href="#integratingasmmetricsintografanausingapicapanels-status" id="integratingasmmetricsintografanausingapicapanels-status"></a>

The Apica **Status** panel widget allows you to display several status indicators values on the panel with status indication and spark line.



This plugin combines the ability of showing several values on the panel with status indication and spark line.

**Limitations**

Currently, only one metric in the **1 row table** format can be used with this panel widget.

The Standard Grafana Panel Widgets can be used to cover a wide range of visualization needs.

### Standard Widgets <a href="#integratingasmmetricsintografanausingapicapanels-standardwidgets" id="integratingasmmetricsintografanausingapicapanels-standardwidgets"></a>

The Standard Grafana Panel Widgets can be used to cover a wide range of visualization needs.

#### Dashboard List <a href="#integratingasmmetricsintografanausingapicapanels-dashboardlist" id="integratingasmmetricsintografanausingapicapanels-dashboardlist"></a>

The dashboard list panel allows you to display dynamic links to other dashboards. The list can be configured to use starred dashboards, recently viewed dashboards, a search query and/or dashboard tags.



On each dashboard load, the dashboard list panel will re-query the dashboard list, always providing the most up to date results.

#### Graph <a href="#integratingasmmetricsintografanausingapicapanels-graph" id="integratingasmmetricsintografanausingapicapanels-graph"></a>

The **Graph** panel widget provides a range of diagraming options.



#### Histogram <a href="#integratingasmmetricsintografanausingapicapanels-histogram" id="integratingasmmetricsintografanausingapicapanels-histogram"></a>

A histogram is a graphical representation of the distribution of numerical data.



You group values into buckets (some times also called bins) and then count how many values fall into each bucket. Instead of graphing the actual values you then graph the buckets. Each bar represents a bucket and the bar height represents the frequency (i.e. count) of values that fell into that bucket’s interval.

#### Heatmap <a href="#integratingasmmetricsintografanausingapicapanels-heatmap" id="integratingasmmetricsintografanausingapicapanels-heatmap"></a>

A Heatmap is like a histogram but over time where each time slice represents its own histogram.

**View**



Instead of using bar height as a representation of frequency you use cells and color the cell proportional to the number of values in the bucket.

#### Gauge <a href="#integratingasmmetricsintografanausingapicapanels-gauge" id="integratingasmmetricsintografanausingapicapanels-gauge"></a>

Gauges gives a clear picture of how high a value is in it’s context.



Gauges are a great way to see if a value is close to the thresholds. The gauge uses the colors set in the color options.

#### Sparklines <a href="#integratingasmmetricsintografanausingapicapanels-sparklines" id="integratingasmmetricsintografanausingapicapanels-sparklines"></a>

Sparklines are a great way of seeing the historical data related to the summary stat.



Sparklines provide valuable context at a glance. Sparklines act differently than traditional [Graph - Standard Widgets](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2133756725/Standard+Widgets) panels and do not include x or y axis, coordinates, a legend, or ability to interact with the graph.

#### Widgets Table <a href="#integratingasmmetricsintografanausingapicapanels-widgetstable" id="integratingasmmetricsintografanausingapicapanels-widgetstable"></a>

The **Table** panel widget displays information as a table.



The table is very flexible, supporting both multiple modes for time series as well as for table, annotation and raw JSON data. It also provides date formatting and value formatting and coloring options.

#### Text <a href="#integratingasmmetricsintografanausingapicapanels-text" id="integratingasmmetricsintografanausingapicapanels-text"></a>

The text panel lets you make information and description panels etc. for your dashboards.



You can add text either in markdown or plain text.
