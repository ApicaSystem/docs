---
description: >-
  The pipeline is a series of processes or stages through which data flow
  systematically and efficiently. It helps to visualize the flow between nodes,
  rules, and filters applied for the data flow.
---

# Visualize Pipelines

Creating a Pipeline

Click on the `Explore` Option from the top menu and click on `Pipelines`

<figure><img src="../../.gitbook/assets/image (691).png" alt=""><figcaption><p>Navigating to Pipeline Page</p></figcaption></figure>

Hover on the `Actions` and click on `Visualize Pipeline`

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 220846.png" alt=""><figcaption><p>Hover over the Actions button on the top-right</p></figcaption></figure>

On click of the Visualize Pipeline button, a new dialog opens, select the desired date-time range, select the desired namespace along with the linked applications, and click Create to create a new pipeline view.

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 221156.png" alt=""><figcaption></figcaption></figure>

On click of the Visualize Pipeline button a new pipeline tab will get added with the pipeline view as shown below

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 221316.png" alt=""><figcaption></figcaption></figure>

**Pipeline View**: The pipeline view shows the data flow between the nodes. each node is connected with the edges to show the data flow between the nodes. The node will have the following details.

\
1\. Name of the node\
2\. Total number of Events\
3\. Total volume size of the events\
4\. Total savings for application and target node\
**Minimap**: Minimap is a tool for quick preview and exploration of large graphs.\
**Time Range Slider**: Helps to select the time range between the selected date and time\
**Zoom In/Out:** Tool to zoom in and zoom out the graph\
**Side Bar**: Helps to make the following changes\
1\. Change the theme\
2\. Change the default title of the pipeline tab\
3\. Select a different date time range\
4\. Select a different namespace, can do multi-select\
5\. Shows the overall EPS and Valume savings.

### Add/Choose the existing Pipeline for Dataflow.

Click the + icon to create or choose the existing Pipeline

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 221425.png" alt=""><figcaption><p>Add/Choose existing Pipeline</p></figcaption></figure>

On click of + icon, Configure Pipeline dialog will show, with the options\
1\. Choose Existing Pipeline\
2\. Create New Pipeline

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 221703.png" alt=""><figcaption></figcaption></figure>

Select the Choose Existing Pipeline to choose an existing Pipeline for the Dataflow

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 221844.png" alt=""><figcaption><p>Choose Existing Pipeline</p></figcaption></figure>

Select the Pipelines that will be applied to the Dataflow and click on the Blue arrow button to add them to dataflow

<figure><img src="../../.gitbook/assets/image (698).png" alt=""><figcaption></figcaption></figure>

Click on the Delete Icon on the right side will disassociate it from the Dataflow. Once done click on the Close button on the dialog to apply the changes.

Select Create New Pipeline button to create new Pipeline for the namespace and application

Enter the Pipeline name and click on Next Button

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 222507.png" alt=""><figcaption><p>Create New Pipeline</p></figcaption></figure>

Rules sections the user will be able to configure the Rules and click on the Save button

<figure><img src="../../.gitbook/assets/image (699).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 223521.png" alt=""><figcaption></figcaption></figure>

### Add Rule(Forwarder)

Before adding the forwarder rule, create a forwarder and map the forwarder in the data flow tab.

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 223407.png" alt=""><figcaption><p>Map a forwarder</p></figcaption></figure>

After adding the forwarder the new node will be added as below

<figure><img src="../../.gitbook/assets/Screenshot 2025-05-02 224136.png" alt=""><figcaption><p>Pipeline with the forwarder</p></figcaption></figure>

