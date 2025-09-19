# Standard Deviation(STD)

Standard Deviation adds two columns UCL(Upper Control Limit), and LCL(Lower Control Limit), to the dataset. These columns determine the moving standard deviation of the value column selected. The standard deviation is the mathematical expression that defines the data point variation from the dataset average. This feature is used to detect the sudden peaks or crusts in the data. This feature is a simple mathematical implementation.

#### Steps to configure standard deviation for a query:

1. Open a query page in edit query mode.
2. Select a meaningful time-series column and a value column.
3. Select the standard deviation option from the operations selection box.
4. The standard deviation configuration box appears. This has two dropdowns namely window size and std fraction. Window size is used to select the moving standard deviation window size and std fraction is used to amplify the limits by the fraction selected.
5. The resulting dataset contains two columns LCL and UCL. LCL is used to detect the crusts and UCL is used to detect peaks.

#### Steps to visualize the LCL and UCL:

1. Create a new visualization or open an already existing visualization in edit mode.
2. Select the chart type as a line for better visualization.
3. Select the time column as the X column and the value column as the Y column. Add the standard deviation columns i.e; LCL and UCL, into the Y column multi-selection box. A graph similar to the following picture must be rendered.



![](../../.gitbook/assets/std.png)
