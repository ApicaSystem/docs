# Configuring Pipelines

The pipeline is a series of processes or stages through which data flow systematically and efficiently. It helps to visualize the flow between nodes, rules, and filters applied for the data flow.



## Creating a Pipeline

Click on the `Explore` Option from the top menu and click on `Pipelines`

<figure><img src="../../.gitbook/assets/image (691).png" alt=""><figcaption><p>Navigating to Pipeline Page</p></figcaption></figure>

Hover on the `Actions` and click on `Create Pipeline`

<figure><img src="../../.gitbook/assets/image (672).png" alt=""><figcaption><p>Actions button to create Pipeline</p></figcaption></figure>

Enter the `Pipeline name` to create your pipeline.

<figure><img src="../../.gitbook/assets/image (673).png" alt=""><figcaption><p>Creating a Pipeline</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 215739.png" alt=""><figcaption><p>Created pipeline displayed in the pipeline list</p></figcaption></figure>

## Configuring Pipeline

Once the Pipeline is created we will configure the pipeline with Rules based on which the events in Data flow will be determined.

<figure><img src="../../.gitbook/assets/image (675).png" alt=""><figcaption><p>Configure Pipeline</p></figcaption></figure>

Hover on Add Rule and select the Rule you want to set (CODE, EXTRACT, FILTER, REWRITE, SIEM, STREAM, TAG) and once done clicking on `Save` button will save the configuration.

<figure><img src="../../.gitbook/assets/image (676).png" alt=""><figcaption><p>Pipeline Configuration View</p></figcaption></figure>

You can also preview how the pipeline will be executed using the Preview option.&#x20;

There are three ways to preview:

#### Use Sample Logs:

<figure><img src="../../.gitbook/assets/image (677).png" alt=""><figcaption><p>Sample Logs, Dropdown helps select the sample logs</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (679).png" alt=""><figcaption><p>Preview based on the Rules set</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (692).png" alt=""><figcaption><p>Dropped Alerts highlighted and displayed as Dropped</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (693).png" alt=""><figcaption><p>On clicking on the logs the expected changes are displayed</p></figcaption></figure>

#### Use Data Flows:



<figure><img src="../../.gitbook/assets/image (681).png" alt=""><figcaption><p>After selecting the Time Range, Namespace and Application Preview can be seen on clicking the Preview</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (696).png" alt=""><figcaption><p>Dropped Alerts highlighted and displayed as Dropped</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (694).png" alt=""><figcaption><p>On clicking on the logs the expected changes are displayed</p></figcaption></figure>

#### Use GenAI:

<figure><img src="../../.gitbook/assets/image (682).png" alt=""><figcaption><p>Click on Generate Logs </p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (683).png" alt=""><figcaption><p>Enter the prompt and click on the Arrow, Sample log will be generated</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (684).png" alt=""><figcaption><p>Click on the Use Logs to use the same logs</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (685).png" alt=""><figcaption><p>Sample logs are added and preview can be seen on clicking Preview Button</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (686).png" alt=""><figcaption><p>Preview based on the rules configured is displayed</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (697).png" alt=""><figcaption><p>On clicking on the logs the expected changes are displayed</p></figcaption></figure>

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
