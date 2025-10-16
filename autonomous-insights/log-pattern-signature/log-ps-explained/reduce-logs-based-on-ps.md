# Reduce Logs Based on PS

### Reduce Log Variety Based on Pattern Signature (PS)

Pattern-Signature (PS) has many use cases.

The logs can be forwarded or dropped based on their structure form or Pattern-Signature ID.

For example, debugging logs are useful for a targeted instance/time. The developers often do not always remove them when done troubleshooting the code. Logs were added to the already overloaded log ingestion pipeline. SREs/DevOps, on the other hand, are never sure what logs are to be dropped and forwarded for storing and, therefore, take all in.  Apica Ascent PS generation will examine and analyze log pattern signatures holistically and better and more accurately assess the log state for logging efficiency.

To get to the PS listing, one first goes to the log explorer page and set the namespace and application parameters for the log records to display.

![](../../../.gitbook/assets/t1-2022-06-21_14-36-24.jpg)

Example log display from namespace selection

![](../../../.gitbook/assets/t2-ex-s1-2022-06-21_13-25-25.jpg)

After that, go to the right side and click on the log summary button (see below) to display the PSes. See the final log PS display below.

![](../../../.gitbook/assets/t3-ex-s3aa-2022-06-21_13-37-36.jpg)

Annotation explanations

* 1\)-2) Display PS action will change the tab organization and now there are two levels of tabs
* 3\) 2nd row right-most tab shows the PS in sort count order
* 4\) The first row's right-most tab corresponds to this log query state. Notice that this log query state is called Investigate Group (IG), and the query is fixed at namespace(s), application(s), and time period specification.
* 5\) 2nd row left-most tab shows the queried logs.
* 6\) The main ingesting log window. This is the place one specifies and initiates the log query.
* 7\) One can display all the logs of similar PS via the search icon, see outputs below. _Notice that the new specific PS ID search tab appears on the top row now._

![](../../../.gitbook/assets/t4-ex-s4-2022-06-21_14-11-10.jpg)
