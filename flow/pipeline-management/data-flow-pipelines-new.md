# Configuring Pipelines

The pipeline is a series of processes through which telemetry data flows systematically. A pipeline can be understood as a grouping of rules that perform certain actions. For example, an extract pipeline can have rules that extract or normalize the data. Similarly, a filter pipeline can have rules that drop logs/fields and redact values from the incoming message. Pipelines can be arranged in a specific order to achieve efficient operation on the incoming data.

## Creating a Pipeline

1. Select **Explore** → **Pipelines**.
2. Select **Actions** → **Create Pipeline**.

<figure><img src="../../.gitbook/assets/image (691).png" alt=""><figcaption><p>Navigating to Pipeline Page</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (672).png" alt=""><figcaption><p>Actions button to create Pipeline</p></figcaption></figure>

The builder has two panels: **Pipeline Preview** and **Pipeline Configuration**.

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-18 15-00-05.png" alt=""><figcaption></figcaption></figure>

Select **EXISTING RULES** to attach saved rules inin **Configure Rules for - \<pipeline>**.

Each rule opens in **Pipeline Configuration**. Complete its shared fields, condition, and rule-specific settings. See [rules](../rules/ "mention") for shared fields and conditions.

<figure><img src="../../.gitbook/assets/image (1162) (1).png" alt=""><figcaption><p>A new drop rule was added</p></figcaption></figure>

The rule list shows **Rule Name**, **Rule Type**, **Savings**, **Enabled**, and **Actions**. Drag a rule to reorder execution. Use **Enabled** to switch a rule on or off.

Use **Expand rule** to open one rule at a time. Select **Delete rule** to remove a rule. Confirm **Are you sure you want to remove the rule?**. The deletion takes effect when you save.

Opening a pipeline from **Pipelines** uses a full page. Opening it from the topology graph uses **Configure Pipeline** as a modal. Both views have **Close** and **Save** buttons.

Validation runs when you select **Save**. A banner lists all issues. For each missing required rule field, it displays: `&lt;Field(s)&gt; is a required field and cannot be empty in &lt;rule name&gt; rule.` A missing pipeline name displays: `Pipeline name is a required field and cannot be empty.`

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 215739.png" alt=""><figcaption><p>Created pipeline displayed in the pipeline list</p></figcaption></figure>

### Editing a Pipeline

To edit a pipeline, open **Explore** → **Pipelines**. Select the ellipsis beside the pipeline, then select **Configure Pipeline**. It opens as a full page from **Pipelines**.

<figure><img src="../../.gitbook/assets/image (1189).png" alt=""><figcaption></figcaption></figure>

## Pipeline Preview

Pipeline Preview updates automatically after every pipeline or rule change. It displays the selected logs and changes in the `Diff` view.

#### Use Sample Logs:

Sample Logs allows you to provide custom logs to preview:

<figure><img src="../../.gitbook/assets/image (1164) (1).png" alt=""><figcaption><p>The dropdown helps select the sample logs for preview</p></figcaption></figure>

#### Use Data Flows:

Using Dataflows, you can select data that was previously ingested into the platform and run a preview.\
**Note:** If the data from the selected namespace and application has already passed through the current pipeline, the preview may not fully reflect the intended changes.

<figure><img src="../../.gitbook/assets/image (1165) (1).png" alt=""><figcaption></figcaption></figure>

#### Use GenAI:

Using the GenAi option, you can interact with an AI Agent to curate the right set of logs for the pipeline preview.<br>

<figure><img src="../../.gitbook/assets/image (1166).png" alt=""><figcaption></figcaption></figure>

#### Use Captured Data:

With Captured Data, lookup files that contain logs can be used for running a pipeline preview.

<figure><img src="../../.gitbook/assets/image (1168).png" alt=""><figcaption></figcaption></figure>

#### Live Tail

With Live tail, use the raw logs that are getting ingested in real time to run the pipeline preview.

<figure><img src="../../.gitbook/assets/image (1169).png" alt=""><figcaption></figcaption></figure>

#### View Preview Changes:

To view the preview changes, click on the `Diff` tab in the Pipeline Preview Section:

<figure><img src="../../.gitbook/assets/Screenshot from 2026-08-28 19-22-32.png" alt=""><figcaption></figcaption></figure>

After configuring the pipeline and its rules and testing them, click on the Save button in the bottom right section of the page.

### Apply Pipeline

Using the `Apply Pipeline` option we will be able to apply the pipeline to multiple `Dataflow`.

<figure><img src="../../.gitbook/assets/image (687).png" alt=""><figcaption><p>Apply Pipeline to associate the Namespace and Application to it</p></figcaption></figure>

Select the time range and then select Namespace and Application (Dataflow) to which you want to apply the pipeline. When a namespace and application have other Pipelines linked to it they will be displayed as well, the new one we are trying to associate will be displayed at the bottom and outlined by Green. User will be able to reorder by dragging.

<figure><img src="../../.gitbook/assets/image (688).png" alt=""><figcaption><p>New pipeline added outlined by green</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (689).png" alt=""><figcaption><p>Oder can be set by dragging the pipelines.</p></figcaption></figure>

Once desired order has been set Click on `Apply` to apply it to the Dataflow. Post this the execution will be in the order of the Pipeline set.

### Pipeline View:

All the Dataflows linked are displayed under the Pipeline and can be accessed using the Arrow icon.

<figure><img src="../../.gitbook/assets/image (690).png" alt=""><figcaption><p>All the linked Dataflow are displayed under the Pipeline. Along with the stats.</p></figcaption></figure>

The Stats displays the Events Ingested, Events Processed and Saved Bytes:

* Green Indicates the total `Events Ingested`.
* Orange Indicates the `Events Processed`.
* Red Indicates the `Saved Bytes`.

Pipelines stats is the total amount of Events and Saved Bytes and the data for each of the associated Dataflow is displayed against the individual Dataflows.
