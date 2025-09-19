# Understanding Check Details

The Check Details view provides detailed information about a single check in a number of charts, graphs and tables:



## Bookmarks <a href="#understandingcheckdetails-bookmarks" id="understandingcheckdetails-bookmarks"></a>

When you open a certain Check Result from within the Check Details page, the [Check Result](broken-reference) will open in a new tab within the ASM GUI called a “Bookmark”:



When you access another Check Details page and then open a Check Result from that same Check Details page, the new Check Detail and Check Result will also be populated in the bookmark:



The bookmarks can be re-ordered by clicking and dragging them. This allows you to keep a number of checks in the bookmarks bar and move between them by clicking the respective bookmark. Clicking a bookmark will take you to the corresponding Check Details or [Result Details](broken-reference) view.

## Response Graph <a href="#understandingcheckdetails-responsegraph" id="understandingcheckdetails-responsegraph"></a>

The Response Graph displays the response times over the selected period as a curve and provides access to the functions described in the Toolbar. The default view is called the “Chart View”:



By mousing over your Check Details graphs, you'll notice a popup at various points, specifying a check run and showing its date and result:



Clicking on a check run will open the [Result Details](broken-reference) page.

It is possible to zoom further into certain sections of the response graph by clicking and dragging a small portion of the response graph:



After you click, drag, and release, you will see the graph has zoomed in to the timeframe you have dragged over:



The Response Graph toolbar contains buttons for a number of actions relating to the graph.

| Item                     | Description                                                                                                                                                                                      |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Reset                    | Reset graph to normal zoom view                                                                                                                                                                  |
| Show Custom Events       | Display Custom Events below the graph                                                                                                                                                            |
| From                     | Start of time period to display                                                                                                                                                                  |
| To                       | End of time period to display                                                                                                                                                                    |
| <p></p><p>Refresh</p>    | Apply changes to display and refresh                                                                                                                                                             |
| <p></p><p>Compare</p>    | Add [additional checks to the graph](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134213568/Understanding+Check+Details#Compare-Checks), or display certain integration information |
| <p></p><p>Clear</p>      | Remove display settings or additional checks and refresh                                                                                                                                         |
| <p></p><p>Table View</p> | Switch the display so it shows the [Response Table](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134213568/Understanding+Check+Details#Response-Table)                              |

### Show Custom Events <a href="#understandingcheckdetails-showcustomevents" id="understandingcheckdetails-showcustomevents"></a>

By checking the “Show Custom Events” checkbox, you can view any [Custom Events](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2133691156/Health+Events#Custom-Events) that you have configured for the check. For instance, if you would like your users to know that there is planned maintenance for a check during a specific timeframe, you can set up the corresponding event as a Custom Event and check the box. A bar denoting the event will appear underneath the response graph:



If you click on the Custom Event bar, you can view the Custom Event Information:



If a custom event applies to a check for which you are viewing details, you will see a section on the Check Details page entitled “Custom Events Last 24 Hours” which displays the event name and duration:



### Compare Checks <a href="#understandingcheckdetails-comparechecks" id="understandingcheckdetails-comparechecks"></a>

One of the buttons available in the Toolbar, the “Compare” button, allows you to compare the results of two check runs. Using the Compare function, you can easily overlay the recent results of multiple checks into a single view. As practical examples, you might want to compare how the same check performs in different geographical locations, compare a group of checks from the same location, or compare all checks of a specific type in order to “visualize” any patterns you might observe in the results.

To begin a check comparison:

1\. open any Check Details page and click Compare from the Response Time widget:



2\. Choose one or more checks to compare in the “Compare” box which pops up:



3\. Click each Check you wish to include in the comparison. They will populate the Checks fields as icons, showing some basic information about each check:



If you have many checks, typing a few letters will filter the list alphabetically. Click any check in the results to add it to the Checks field. To delete a Check from the list, click the “X” to the left side of each check icon. If you have AppDynamics, Akamai, or Google Analytics integrations configured, you may add integration information to your comparison.

4\. Click Save at the bottom of the Compare pop-up, and the graph view will display a comparison of the checks you selected. Each check will create a series with a separate color. You can toggle the visibility of the comparison graph by clicking the series at the bottom of the graph. All check viewing tools are available, including hovering over check points, clicking check points for further details, zooming, and dragging:



## Response Table <a href="#understandingcheckdetails-responsetable" id="understandingcheckdetails-responsetable"></a>

The Response Table displays check response times in table form. This is called the “Table View”:



The Response Table toolbar contains buttons for a number of actions relating to the table.

| Item                                     | Description                                                                                                                            |
| ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| <p></p><p>Severity status indicators</p> | Check Status Colors to display in the table. This button is useful for when you wish to see only failures, for example                 |
| From                                     | Start date and time for the period to display                                                                                          |
| To                                       | End Start date and time for the period to display                                                                                      |
| <p></p><p>Refresh</p>                    | Refresh the response table. This button is useful for when you run a check and wish to see the response to the run as soon as possible |
| <p></p><p>Chart View</p>                 | Switch the display to Response Graph                                                                                                   |
| Display {X} records                      | Number of rows to show in the table                                                                                                    |
| Search                                   | Filter checks to display by name                                                                                                       |

The table displays the information as a list of check items.

| Column   | Description                                                                                                                                                                                                                                                                                                                                                                                                     |
| -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Severity | The run will be assigned a color which corresponds to the latest check run severity                                                                                                                                                                                                                                                                                                                             |
| Time     | Date and time for the check                                                                                                                                                                                                                                                                                                                                                                                     |
| Value    | Response time                                                                                                                                                                                                                                                                                                                                                                                                   |
| Message  | Message for the Result Details                                                                                                                                                                                                                                                                                                                                                                                  |
| Attempts | The number of attempts to run the check. If there is more than one check run attempt, the attempt pause specified in the Edit Check page will be applied. If [failover is enabled](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2148991311/Editing+Checks#Enable-Failover), the check will run the number of defined of attempts plus one more attempt - a final attempt from the failover location |

## SLA Graph <a href="#understandingcheckdetails-slagraph" id="understandingcheckdetails-slagraph"></a>

Successful and failed SLA samples are shown in the SLA graph. SLA samples are determined by check response times.



A bar graph shows the percentage of time the SLA setting is being met over time. The legend shows the average SLA% values for Success (green) and Fatal (red) runs. Clicking a legend item will remove that type of result from the chart.

### Display Selection <a href="#understandingcheckdetails-displayselection" id="understandingcheckdetails-displayselection"></a>

You can filter the results to show all recent data by hours, days, weeks or by using the last 12h/24h/7d/current month/previous month/year buttons, then sort further using the calendar date selection tool.

#### Show <a href="#understandingcheckdetails-show" id="understandingcheckdetails-show"></a>

In the Show area, you can select a time period to display by entering a number in the field and selecting period (`hours`, `days`, `weeks`, `months`, `quarters`, `years`) in the dropdown menu.

#### Last <a href="#understandingcheckdetails-last" id="understandingcheckdetails-last"></a>

In the Last area, you can quick-select a time period to display by clicking one of the buttons (`12h`, `24h`, `7d`, `current month`, `previous month`, `year`).

Longer time periods are displayed in **From** and **To** fields. You can further modify the time period by manually entering date values and clicking “Refresh”.

| Column        | Description                                  |
| ------------- | -------------------------------------------- |
| Avg. SLA %    | Average SLA percentage                       |
| ApDex         | ApDex value\*                                |
| Avg. attempts | The average number of attempts               |
| I             | The number of checks with status Info        |
| W             | The number of checks with the Warning status |
| E             | The number of checks with the Error status   |
| F             | The number of checks with the Failure status |
| Samples       | The number of samples included in the view   |

\*Apdex (Application Performance Index) is an open standard that defines a standard method for reporting and comparing the performance of software applications in computing.

_Apdex_ = (_Satisfied Count_ + _Tolerating Count_ / 2) / (_Satisfied Count_ + _Tolerating Count_ + _Frustrated Count_)

See [ApDex](http://en.wikipedia.org/wiki/Apdex) on Wikipedia for more information.

The following equation shows how Apdex is calculated in Apica Synthetic Monitoring Portal:

* _Satisfied Count_ = Total count of Informational samples
* _Tolerating Count_ = Total count of Warning samples
* _Frustrated Count_ = Total count of Error and fatal samples

_Apdex_ = (I + W / 2) / (I + W + E + F)

## Status Graph <a href="#understandingcheckdetails-statusgraph" id="understandingcheckdetails-statusgraph"></a>

The “Status Last 24 Hours” graph displays an overview of the checks that have run in the last 24 hours.



The **general information** subsection of the Status Graph section shows general information about the check.

| Item                                 | Description                                                                                         |
| ------------------------------------ | --------------------------------------------------------------------------------------------------- |
| <p></p><p>Check status indicator</p> | The easiest method of determining whether a check has passed, failed, or returned some other status |
| Name                                 | Name of the Check                                                                                   |
| URL                                  | URL used for the Check                                                                              |
| Last run                             | Timestamp and relative time for when the Check was last run                                         |
| <p></p><p>Check Type Icon</p>        | Browser, ZebraTester, etc.                                                                          |

### Values <a href="#understandingcheckdetails-values" id="understandingcheckdetails-values"></a>

The **values** section shows aggregated values for the check.

| Item       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Last Value | Response time for the last run. A color will be assigned to the Last Value value in accordance with the [Severity Handling](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2148991311/Editing+Checks#Severity-Handling) rules of the check (if applicable). For example, if the check’s last value passes the High Warning Threshold, the last run will be assigned a Warning severity and the Last Value will take on the color yellow in accordance with the Warning severity color |
| Median     | Median response time for last 24 runs                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| SLA        | Current SLA percentage of the check                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Average    | Average response time for last 24 runs                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Next run   | Relative time to next run.                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 24 status  | A graphical representation of the last 24 statuses. The color of each bar reflects the final check run status for each hour. That is, if the last run of a check during a certain hour returned Fatal, then the bar representing that hour in the “24 status” section will be Red (there will be a red section in the bar).                                                                                                                                                                     |

### Buttons <a href="#understandingcheckdetails-buttons" id="understandingcheckdetails-buttons"></a>

The **action buttons** provide shortcuts to common features for the check.

| Button Action   | Description                                        |
| --------------- | -------------------------------------------------- |
| Run Check       | Run the check immediately                          |
| Settings        | [Edit the check](broken-reference)                 |
| Analyze Metrics | Go to the Analyze Metrics view for the check       |
| Manage Alerts   | [Configure Alerts](broken-reference) for the check |

### Recent Issues <a href="#understandingcheckdetails-recentissues" id="understandingcheckdetails-recentissues"></a>

If a check has caused an alert, the result which caused an alert is listed in the Recent Issues table.

| Column    | Description                                                |
| --------- | ---------------------------------------------------------- |
| Severity  | Severity color for the check result which caused the alert |
| Timestamp | Date and time when the issue occurred                      |
| Elapsed   | Check duration                                             |

Clicking on the timestamp for an alert will open the [Result Details](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+the+Result+Details+View) page for that check run.

## Trends <a href="#understandingcheckdetails-trends" id="understandingcheckdetails-trends"></a>

The Trends graph displays top-level information about the behavior of the check over time. These metrics deliver a convenient and useful report on how your check is performing at a glance.



In the above example, you could use the graph to determine the Mean user journey response time for 2023-04-10 vs. 2023-04-11.

Hovering over a data point in the graph provides the check run date, name and response time:



### Toolbar <a href="#understandingcheckdetails-toolbar" id="understandingcheckdetails-toolbar"></a>

The toolbar contains selectors for what information to display.

| Item                    | Description                                                               |
| ----------------------- | ------------------------------------------------------------------------- |
| Display                 | Type of information to show: `Mean`, `Median`, `Standard Deviation`       |
| For most recent         | Time period to show: `Hour`, `Day`, `Week`, `Month`, `Quarter`, or `Year` |
| As compared to previous | Number of comparison items of the selected time period                    |

Of course, changing any of these fields will most likely alter all of the data displayed within the Trends graph.

### Data for Previous Runs <a href="#understandingcheckdetails-dataforpreviousruns" id="understandingcheckdetails-dataforpreviousruns"></a>

Data for previous runs are shown below the graph.

| Row                | Description                          |
| ------------------ | ------------------------------------ |
| Samples            | Number of samples included           |
| I                  | Number of checks with status Info    |
| W                  | Number of checks with status Warning |
| E                  | Number of checks with status Error   |
| F                  | Number of checks with status Failure |
| Median             | Median response time                 |
| Mean               | Average response time                |
| Min                | Minimum response time                |
| Max                | Maximum response time                |
| Standard Deviation | Standard deviation for response time |

On the right hand side of the table, two columns show a comparison between average values and the most recent one. Metrics for the most recent data point are displayed in between these two columns (as can be seen from the screenshot).

| Column  | Description                                                     |
| ------- | --------------------------------------------------------------- |
| Average | Average value for the period you select within the Trends graph |
| Diff    | Difference between last value and the average                   |
