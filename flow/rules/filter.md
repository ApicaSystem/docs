# FILTER

The Filter rule allows you to filter events that meet specific criteria. This is particularly useful when you want to control the volume of data being stored or processed. For example, if you do not want to store debug or info logs, you can create a Filter rule that drops all log lines that contain these levels.

In addition to dropping entire log lines, Filter rules can also be configured to drop specific fields within a log line. This can be useful when you only want to retain certain fields of interest.

### To Create a Filter Rule:

* Choose a pipeline to which you want to add the filter rule. To know more about creating and editing pipelines, [click here](../pipeline-management/data-flow-pipelines-new.md).
* Once the `Configure Pipeline` page loads,  hover over the `+` at the tail end of the graph in the Pipeline Rules Flow section. On hover, you should see a dropdown of the list of rule types. Choose the`Filter` option.

<figure><img src="../../.gitbook/assets/image (1171).png" alt=""><figcaption></figcaption></figure>

* After choosing the filter rule, a form should be displayed in the Pipeline Configuration section. This form is divided into 3 sections to logically separate the functionality of the `Filter Rule`.

<figure><img src="../../.gitbook/assets/image (1172).png" alt=""><figcaption></figcaption></figure>

* With filter rule:

1. Logs can be dropped based on a condition.
2. Fields within the logs can be dropped.
3. Duplicate events can be suppressed in intervals.

The first section includes generic details,  like the name, the group the rule belongs to, the rule description, and the advanced filter.&#x20;

Then, enter the necessary details for your Filter Rule, including a name for the rule, the group it belongs to, and any parameters needed to filter your log data.

Like every other rule, the Filter Rule also allows you to specify additional parameters to filter your log data. These may include fields like log severity level or timestamp, which can be used to control the data volumes.

### Filter Logs:&#x20;

When there are no labels to be dropped or logs to be suppressed, then the filter rule will drop logs. If no advanced parameter is selected, the rule drops all logs. However, when a parameter is along with a regex to match its value, then every log with a successful match will be dropped.

<figure><img src="../../.gitbook/assets/Screenshot from 2026-01-20 17-34-29.png" alt=""><figcaption></figcaption></figure>

Now, if the intention is to drop logs, these details should be sufficient to create a rule. Click on the `save` button at the bottom of the modal to save the rule.

### Filter Fields:

When creating a Filter Rule, users can choose to filter selected fields instead of dropping the entire log line. This can be particularly useful when logs contain metadata like Kubernetes labels that may not be needed for long-term storage or analysis.

To enable field filtering, switch over to the `Drop Labels` section and toggle the `Enable Drop Labels` .  Select or enter the fields you wish to filter in the `Labels to Drop` dropdown. This will ensure that only the selected fields are dropped from the log line, while other fields will still be retained.

By using field filtering in combination with the Filter Rule, you can ensure that your log data is efficiently managed and stored, with only the necessary fields retained for further analysis.

<figure><img src="../../.gitbook/assets/image (1173).png" alt=""><figcaption></figcaption></figure>

### Suppress Events:

The filter rule can also help you drop duplicates in an interval. At the end of every interval, a certain number of logs will be allowed to flow ahead in the pipeline. To suppress events, click on the last section in the filter rule called \`Suppress Events\` and toggle `Enable Suppress Events`.&#x20;

<figure><img src="../../.gitbook/assets/image (1174).png" alt=""><figcaption></figcaption></figure>

By default, the rule will drop duplicates and allow only a single log to go through. The logs that are allowed to go through will contain an extra field in the log event that is the count of suppressed logs.

Once you have created a Filter Rule and specified your filter criteria in the first tab(`Details`), all incoming log lines that match the criteria will be evaluated for de-duplication before they are sent to storage or downstream systems. This can help to control the volume of data being stored and ensure that only relevant data is retained for further analysis.

In addition to creating custom Filter Rules, Apica Ascent also offers many inbuilt Filter Rules for various applications like Java, ingress, auditd, Kubernetes, and more. These pre-built rules can be easily accessed and configured to suit your specific needs, making it easy to filter out unnecessary data from your log streams.



