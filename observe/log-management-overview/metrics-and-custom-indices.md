---
description: This section describes how to use Log2Metrics in Apica Ascent.
---

# Log2Metrics

Apica Ascent Log2Metrics is a powerful feature that helps you convert your log data into a real-time metric. Using Log2Metrics, you can visualize your log data, plot distributions, create a custom index, and create alerts for events.

### Creating a Log2Metric

You can create new metrics from a log line in either the **Logs** page or the **Search** page of your Apica Ascent UI. To create a new metric, click the three dots on a log line that you want to create a metric for. Doing so opens the options menu, as shown in the following image. From the options menu, click **create log2metric**.

![Log options menu](../../.gitbook/assets/log_menu_drop_down.png)

You will now see the Log2Metric modal on the Apica Ascent UI. To configure your new metric, fill out the fields in the Log2Metric modal appropriately.

![](../../.gitbook/assets/log2metric_dialog.png)

The following table describes each of the fields in the Log2Metric modal.

| Fields                  | Description                                                                                             |
| ----------------------- | ------------------------------------------------------------------------------------------------------- |
| Name                    | Name of the Log2Metric                                                                                  |
| Level                   | Set the severity level to **low**, **medium**, **high**, or **critical**.                               |
| Group                   | Select a predefined group or add a new one.                                                             |
| Description             | A human-readable description of the Log2Metric.                                                         |
| Namespace               | Logs Namespace in which to create the Log2Metric.                                                       |
| Application Match       | This is an auto-populated field that is editable. You can use regex to match applications as well.      |
| Labels                  | Labels for the Log2Metric. This field is not mandatory and can be used to create a group-by expression. |
| Label for Visualization | Used to visualize data. Visualizations are grouped by the label configured in this field.               |
| Add tags to query       | Tags that can be used to filter queries in the UI                                                       |

You can add more parameters to filter your logs by clicking on **+Add more parameters**, as shown in the following image.

![Add more prameters](../../.gitbook/assets/add_more_params.png)

The configuration depicted in the image above creates a Log2Metric named `ingress_status_codes__e1034e`. Apica Ascent adds the suffix `__e1034` internally as a unique identifier for the Log2Metric. Once the Log2Metric is created, it adds its visualization to your dashboard. The following image depicts the visualization of the newly-created `ingress_status_codes__e1034e` Log2Metric.

![Visualization created by log2metrics](../../.gitbook/assets/log2metric_vis.png)

### Analyze log2metric

Log2metrics helps to analyze the log for the specified time series.

Clicking the `Analyse` button will open the popup with values that can be choose to verify the logs as shown below. Choose the values that you want to analyze within the logs and click `Apply` button, it will navigate to the search view and the corresponding logs will be loaded to verify.

![Analyze Log2Metrics](../../.gitbook/assets/analyze_log2metrics.png)

### Custom Indices

Log2Metrics definitions also create custom indices that can be used to speed up the search. Based on the definition, there can be multiple custom indices. The definition used in the example above creates two custom indices: `ingress_status_codes__e1034e`and `e1034e`. You can use both of these indices to search for logs that match the definition. Based on what you enter in the **Labels** field of the Log2Metric configuration, additional indices may be created. For example, based on the definition used in the example above, if there are logs that match the status code `401` , an additional index is created named `ingress_status_codes__e1034e_status_code_401`that can be used for searching for occurrences of logs that contain the status code `401`.
