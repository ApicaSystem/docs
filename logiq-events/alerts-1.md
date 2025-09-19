# Alerts On Logs

Alerts can be configured from log data from the Search Page. if we want to get alerted on a line of log that is of interest, the user can directly create an **alertable** **event** from the log line.

![](<../.gitbook/assets/image (251).png>)

On clicking the <img src="../.gitbook/assets/Screen Shot 2020-08-11 at 5.34.40 PM.png" alt="" data-size="original">on the log line, user can open the log2Metric event rule editor. Refer to [Metrics And Custom Indices](../observe/log-management-overview/metrics-and-custom-indices.md) section on how to configure log2Metrics. Alert Configuration is available on the third section of log2Metrics modal.

### Creating an alertable event

![](<../.gitbook/assets/image (291).png>)

#### Fields

* **Name**: A name for the alert, should be alphanumeric.
* **Destination**: This is a user-specified selection where the alerts will be delivered. Only [user-defined alert destinations](../integrations/list-of-integrations/alert-destinations/) will be available for selection. User can configure alert destinations in the Alert Destinations Section
* **Operation**: One of the comparators: `>` `>=` `<` `<=` `==` `!=` `=~` `!~`
* **Occurrences**: number of times the event must occur, must be a valid number.
* **Period**: time over which the event occurred, e.g, `5m`, `10m`, `1h`, `1d`, `1w`. Period should be greater than `5m` (`300s`) and should be greater than or equal to Refresh schedule.
* **Rearm**: how frequently you will receive notifications when your query meets the Alert criteria and does not change, must be a valid number (seconds) minimum `300` seconds.
* **Refresh Schedule**: how frequently the query needed to be refreshed in seconds, must be a valid number.
* **Until**: select when to stop the alerts. If not selected, the alert will never expire.

All the alert rules created can be accessed on the Active Rules page.

![](<../.gitbook/assets/image (333).png>)

### Viewing Alerts

All the configured alerts are viewable when navigating to the alerts tab. An Individual alerts' configuration can be edited on this page

![](<../.gitbook/assets/image (209).png>)

Clicking on the configured alert will open up the respective alert page where it can be modified further for e.g. change the alert rearm duration, add additional alert destinations etc.

![](<../.gitbook/assets/image (273).png>)

{% hint style="warning" %}
Apica Ascent includes alerts from its Prometheus alert manager instance that is included with the Apica Ascent install. NOTE that the editing of the Prometheus alert rules cannot be done via the UI and must use alert manager CRD's to change those alert rules.
{% endhint %}
