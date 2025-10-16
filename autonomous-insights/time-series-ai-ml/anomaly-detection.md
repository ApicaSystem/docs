# Anomaly Detection

Anomaly Detection determines the anomalous data points from the selected value columns. Anomalous data points are the values in the dataset which deviate substantially from the regular pattern of the target data. Use the anomaly detection slider and select the appropriate percentage of anomalies. 10% gives fewer anomalous points, and 100% detects more anomalous points. The anomaly column is added to the results. Use the anomaly column as the error column in the visualization configuration. This feature uses iforest outlier detection algorithm to compute results.

#### Steps to configure anomaly detection for a query:

1. Open a query page in edit query mode.
2. Select a meaningful time-series column and a value column.
3. Select the Anomaly Detection option from the operations selection box.
4. An anomaly detection box appears. This box contains a slider using which the percentage of the outlier points to be detected can be set. Usually, a 10% to 30% outlier detection is ideal.
5. Save the configuration and execute the query.
6. The resulting dataset contains a column called Anomaly which indicates if the value is an outlier or not.

#### Steps to visualize anomaly detection for a query:

1. Create a new visualization or open an already existing visualization in edit mode.
2. Select the chart type as a line for better visualization.
3. Select the time column as the X column and the value column as the Y column. Select the Anomaly column as the Error column. A graph similar to the following picture must be rendered.



![](../../.gitbook/assets/anomaly.png)
