# AI-ML on PromQL Query Data Set

Single Prometheus data stream can contain multi-variate time-series data.  See the query example,

```
irate(node_cpu_seconds_total{job="node",mode="user"}[5m])&step=2m&duration=12h
```

The query represents a multi-variate data set and is visualized by the line chart.  There are 7 time-series data sets specified with the data key "instance".  The group-by operator was used for displaying all 7 data sets.

<figure><img src="../../.gitbook/assets/image (470).png" alt=""><figcaption></figcaption></figure>

The current Apica Data Fabric (ADF) AI-ML operator supports only one data set.  To use the AI-ML on the data, the user needs to filter the data into one data set.  The process can be done with the promQL select operator,

```
irate(node_cpu_seconds_total{job="node",mode=~"user", instance=~".*arm8.*"}[5m])&step=2m&duration=12h
```

After filtering into just one data set, one can now use the AL-ML tool to process the dataset.  Notice that the "group-by" operator CANNOT be used in the chart configuration.

