# FILTER

The Filter rule allows you to filter events that meet specific criteria. This is particularly useful when you want to control the volume of data being stored or processed. For example, if you do not want to store debug or info logs, you can create a Filter rule that drops all log lines that contain these levels.

In addition to dropping entire log lines, Filter rules can also be configured to drop specific fields within a log line. This can be useful when you only want to retain certain fields of interest.

To create a Filter Rule, choose a pipeline to which you want to add the filter rule. Hover over the `Add Rule` Button on the top of the modal. On hover, you should see a dropdown of the list of rule types. Choose the`Filter` option.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-05 10-41-40.png" alt=""><figcaption></figcaption></figure>

After choosing the filter rule, a form should be displayed on the left side of the modal. This form is divided into 3 sections to logically separate the functionality of the `Filter Rule`.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-05 12-00-13.png" alt=""><figcaption></figcaption></figure>

With filter rule:

1. Logs can be dropped based on a condition.
2. Fields within the logs can be dropped.
3. Duplicate events can be suppressed in intervals.

The first section includes generic details,  like the name, the group the rule belongs to, the rule description, and the advanced filter.&#x20;

Then, enter the necessary details for your Filter Rule, including a name for the rule, the group it belongs to, and any parameters needed to filter your log data.

Like every other rule, the Filter Rule also allows you to specify additional parameters to filter your log data. These may include fields like log severity level or timestamp, which can be used to control the data volumes.

### Filter Logs:&#x20;

When there are no labels to be dropped or logs to be suppressed, then the filter rule will drop logs. If there is no advanced parameter selected, then the rule drops all logs, but when there is a parameter provided, then logs are dropped based on the parameter provided.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-05 11-17-02.png" alt=""><figcaption></figcaption></figure>

Now, if the intention is to drop logs, these details should be sufficient to create a rule. Click on the `save` button at the bottom of the modal to save the rule.

### Filter Fields:

When creating a Filter Rule, users can choose to filter selected fields instead of dropping the entire log line. This can be particularly useful when logs contain metadata like Kubernetes labels that may not be needed for long-term storage or analysis.

To enable field filtering, switch over to the \`Drop Labels\` section and toggle on the "Labels to Drop" option and select or enter the fields you wish to filter in the dropdown. This will ensure that only the selected fields are dropped from the log line, while other fields will still be retained.

By using field filtering in combination with the Filter Rule, you can ensure that your log data is efficiently managed and stored, with only the necessary fields retained for further analysis.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-05 12-03-09.png" alt=""><figcaption></figcaption></figure>

### Suppress Events:

The filter rule can also help you drop duplicates in an interval. At the end of every interval, a certain number of logs will be allowed to flow ahead in the pipeline. To suppress events, click on the last section in the filter rule and enable suppress events.&#x20;

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-05 12-04-16.png" alt=""><figcaption></figcaption></figure>

By default, the rule will drop duplicates and allow only a single log to go through. The logs that are allowed to go through will contain an extra field in the log event that is the count of suppressed logs.

Once you have created a Filter Rule and specified your filter criteria, all incoming log lines that match the criteria will be dropped before they are sent to storage or downstream systems. This can help to control the volume of data being stored and ensure that only relevant data is retained for further analysis.

In addition to creating custom Filter Rules, Apica Ascent also offers many inbuilt Filter Rules for various applications like Java, ingress, auditd, Kubernetes, and more. These pre-built rules can be easily accessed and configured to suit your specific needs, making it easy to filter out unnecessary data from your log streams.



