# Scatter chart

To configure a Scatter chart that  use the following JSON object. This configuration includes setting the chart type to `scatter`, specifying necessary plot parameters, and providing a monitoring query .

```json
{
    "chart_type": "scatter",
    "data_source_name": "data-source-name", // data-source-name
    "name": "widget name", // widget name
    "options": {
        "description": "widget description",
        "order": 1, // defines the order of the widget
        "plot": {
            "groupBy": "", // 
            "x": "timestamp", // colum to be selected for x axis
            "xLabel": "Timestamp",
            "y": ["value"], // y axis selection can be multi select
            "yLabel": "value"
        },
    },
    "query": "" // add query ,
    "schema": "" // define the schema name asscociated with the query
}
```



<figure><img src="../../../../.gitbook/assets/image (551).png" alt=""><figcaption></figcaption></figure>
