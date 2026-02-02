---
description: Cloned logs for isolated auditing and pipeline operation.
---

# STREAM

The Stream Rule allows you to clone and ship your logs to a new destination. You can change the namespace and/or the application name for your logs, and your logs will be cloned to the new destination. This rule comes in handy when isolating a certain set of logs for auditing. By using this feature, you can ensure that logs are duplicated and directed to a different namespace and application without disrupting the original log flow. This is particularly useful for maintaining a separate audit trail, where logs can be analyzed independently for compliance and security purposes. Additionally, this isolation helps perform thorough audits without interfering with the ongoing flow pipeline, providing a clear and uncontaminated log record.&#x20;

### To Create a Filter Rule:

* Choose a pipeline to which you want to add the filter rule. To know more about creating and editing pipelines, [click here](../pipeline-management/data-flow-pipelines-new.md).
* Once the `Configure Pipeline` page loads,  hover over the `+` at the tail end of the graph in the Pipeline Rules Flow section. On hover, you should see a dropdown of the list of rule types. Choose the`Filter` option.

<figure><img src="../../.gitbook/assets/image (1171).png" alt=""><figcaption></figcaption></figure>

* After choosing the filter rule, a form should be displayed in the Pipeline Configuration section.&#x20;
* Enter the namespace and application of the new stream:

<figure><img src="../../.gitbook/assets/image (1202).png" alt=""><figcaption></figcaption></figure>

**Store Original Stream**: By default, this is disabled. That means, the data flow that this rule is applied to will not store the data in Instastore(data lake). Since the logs are being duplicated to a new namespace-application, sometimes the parent logs need not be stored; in such cases, disabling the `Store Original Stream` can be helpful.

Mentioning just the application name works; in this case, the original namespace will be retained, and the cloned logs will be shipped with a new application name.\
In case you want to shift to a new namespace, the application name should also be changed.

### Optionally Creating New Streams:

The monitor labels section in stream rules allows you to choose specific fields that, if missing from a log event, trigger the creation of a new stream event.&#x20;

To enable optional stream creation, click on the `Monitor Labels` tab, click on the `Monitor Missing Labels` button and select the Labels to Monitor.

<figure><img src="../../.gitbook/assets/image (1203).png" alt=""><figcaption></figcaption></figure>

### Pipeline View:

The Pipeline view, for the original set of logs, will contain the new branch of namespace/application branching out the Stream Rule node from the parent branch, indicating the cloning operation. Rules can be applied to the child branch( i.e., the cloned logs) as well. So if a stream rule is again applied to the cloned logs, there will be a new branch created from the Stream Rule node from the cloned logs. For pipelines with the Stream rule applied, there is an extra space indicator towards the right side of the pipeline view.

<figure><img src="../../.gitbook/assets/pipelinestream 1.png" alt=""><figcaption></figcaption></figure>
