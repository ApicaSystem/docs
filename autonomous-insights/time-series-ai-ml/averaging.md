# Averaging

The averaging feature adds a moving average of the target value column to the dataset. Two new columns are added to the dataset whose names start with MA (Moving Average). MA12 is added by default, and the second column is configurable. The configuration sets up the moving average window size. This feature is a simple mathematical implementation.

#### Steps to configure averaging for a query:

1. Open a query page in edit query mode.
2. Select a meaningful time-series column and a value column.
3. Select the Averaging option from the operations selection box.
4. An averaging configuration box appears. This box contains a dropdown called ma window using which the window size of the moving average can be set. The bigger the window size the more curvilinear the graph becomes
5. Save the configuration and execute the query.
6. The resulting dataset contains two columns MA12 whose window size is 12 and another column with MA whose window is previously configured.

#### Steps to visualize averaging for a query:

1. Create a new visualization or open an already existing visualization in edit mode.
2. Select the chart type as a line for better visualization.
3. Select the time column as the X column and the value column as the Y column. Add the moving average columns i.e. columns with the prefix MA, into the Y column multi-selection box. A graph similar to the following picture must be rendered.



![](../../.gitbook/assets/averaging.png)
