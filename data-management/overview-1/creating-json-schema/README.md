# Creating Json Schema

## JSON Schema Documentation

### Overview

This JSON schema defines the structure for creating a dashboard with multiple tabs and configuring query settings. It consists of two main keys:

* **tabs**: Defines the individual tabs and their associated widgets/charts.
* **header**: Holds configuration or metadata that applies to the entire dashboard.

### Key Structure

#### 1 . Tabs

The `tabs` section defines the structure and configuration of individual dashboard tabs. Each tab contains a set of widgets for data visualizations.

**Type**

* **Array**: An array of objects, where each object represents a single tab.

**Tab Object Structure**

* **title** (String): The title of the dashboard tab.
* **key** (String): Unique identifier for the tab.
* **order** (Integer): Display order of the tab.
* **type** (String): Type of tab, e.g., metrics, logs, alerts.
* **queryList** (Array): Configuration for the widgets within the tab.

**Query List**

The `queryList` defines the configuration for each widget in the tab.

**Type**

* **Array**: An array of objects, each defining a widget configuration.

**Query List Object Structure**

* **query** (String): PromQL query for fetching data.
  * When defining the `query` ensure that each query contains braces `{}` following the metric name for potential label matching or filtering. For example, `metric_name{}`.
* **chart\_type** (String): Type of chart, e.g., area, bar.
  * Supported chart\_type  : (area, bar, line, scatter, counter, disk, gauge, stat, table, status, datetime, size )&#x20;
* **name** (String): Display name of the widget.
* **schema** (Object): Schema associated with the widget.
* **options** (Object): Additional configuration for the widget.
* **label** (String): A label for the widget.
* **order** (Integer): Order of the widget within the tab.
* **description** (String): Description of the widget's purpose.
* **plot** (Object): Plotting configuration for the widget.
* **xLabel** (String): Label for the x-axis.
* **yLabel** (String): Label for the y-axis.
* **x** (String): Field for x-axis values.
* **y** (Array): Fields for y-axis values.
* **groupBy** (Array): Fields to group the data.
* **errorColumn** (String): Error-related data field.
* **zone** (Object): Thresholds for gauge types.
* **data\_source\_name** (String): Data source for the widget.



**Important Considerations**

* Each tab requires a unique `key`.
* The `type` field influences data handling.
* Ensure `query` is a valid PromQL query.
* Match `chart_type` with supported types.
* Tailor the `plot` configuration to the widget type.
* **data\_source\_name**: Clearly indicate the source from where the widget is pulling data.

These guidelines ensure consistency and clarity across all widgets, allowing for a cohesive and informative dashboard experience.



```json
"tabs": [
    {
        "key": "Key name",
        "order": "1",
        "queriesList": [
            {
                "chart_type": "gauge",
                "data_source_name": "datasource name",
                "name": "widget name",
                "options": {
                    "description": "widget description",
                    "order": 1,
                    "zone": {   
                        "alert": 60,
                        "danger": 80
                    },
                    "plot": {
                        "errorColumn": "",
                        "groupBy": "",
                        "x": "Timestamp",
                        "xLabel": "Timestamp",
                        "y": ["value"],
                        "yLabel": "value"
                    },
                    "upperLimit": ""
                },
                "query": "replace with query",
                "schema": "schema name" // Schema name associated with the query 
            },
            {
                    "chart_type": "line",
                    "data_source_name": "datasource",
                    "name": "Widget name",
                    "options": {
                        "description": "",
                        "order": 2,
                        "plot": {
                            "errorColumn": "",
                            "groupBy": "",
                            "x": "timestamp",
                            "xLabel": "Timestamp",
                            "y": [
                                "value"
                            ],
                            "yLabel": "value"
                        },
                        "upperLimit": ""
                    },
                    "query": "node_textfile_scrape_error{instance=~'.*'}&duration=1h&step=5m",
                    "schema": "node_textfile_scrape_error"
                }
        ]
    }
]
```



#### 2 . Header

The `header` section serves as the global filter configuration for the dashboard. It includes filters that apply across all the tabs and widgets in the dashboard.&#x20;

**Header Object Structure**

* **dateTimeRange** (Boolean): Date and time filter settings.
* **dropdowns** (Array):  An array of dropdowns, where each dropdown contains query configurations that filter the data by specific criteria.

**Dropdown Object Structure**

* **query** (String): Query for filtering data.
* key(String) : Represents the metric or data point being filtered. This key should match the    corresponding metric in the dashboard.
* **name** (String): Display name for the dropdown.
* **dataSource** (String): Data source for dropdown options.

**Important Considerations for Header**

* Correctly configure `dateTimeRange` and `dropdowns` for desired functionality.
* The key in the dropdown object should match the labels for the metrics in the dashboard.
* These dropdowns can also be made interdependent by using the same key name inside the query.&#x20;
* Ensure interdependency in `dropdowns` queries when needed.



```json
"header": {
    "dateTimeRange": true,
    "dropdowns": [
        {
            "ostype": {
                "query": "sum by (hostname) (target_info{runtime=~'.*'})", 
                // runtime label defined in the query matches the key of the second 
                // filter , thus making these filters interdependent
                "name": "Atom Selection",
                "data_source_name": "Apica Monitoring",
                "options": {
                    "replace_label": "runtime"
                }
            }
        },
        {
            "runtime": {
                "query": "sum by (runtime) (target_info{ostype=~'linux|windows'})",
                "name": "Runtime selection",
                "data_source_name": "Apica Monitoring",
                "options": {
                    "replace_label": "runtime"
                }
            }
        }
    ]
}
```
