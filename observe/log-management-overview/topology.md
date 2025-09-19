# Topology

We are in the age of distributed computing, where you will be running everything as separate services. Debugging and doing a root cause analysis on such kind of application can be a difficult task.

Apica Ascent provides you with a topology view of all your namespaces and applications which will help you to do root cause analysis faster on any of your services. This will help you to find the errors and warnings in your services based specific time range.

### Topology View

Here are the steps for accessing the topology view of your namespaces,

* Navigate to Explore > `Logs & Insights page`
* You will find the topology in the second tab. Select the `topology` tab
* You will be displayed with your namespaces and applications as a top-down tree structure with errors and warnings count, for the default time range, below every node

<figure><img src="../../.gitbook/assets/image (214).png" alt="" width="563"><figcaption></figcaption></figure>

### RCA with topology

Finding a root cause in a distributed environment is a tricky thing. We will not know what errors occurred in which application. This problem is solved by topology. Topology provides us the option to select a time range at a granular level which will help us to find the occurrence of that error. The application that has the errors/warnings at the given time will be indicated with the respective colors.

It also runs a search query in Apica Ascent, which will help you fetch errors and warning messages which are logged at the selected time range.

In the above screenshot, we have errors in the alerts namespace. To find the errors for the application under the namespace, click on the `+` icon. It will display all the applications under that node.

<figure><img src="../../.gitbook/assets/image (197).png" alt=""><figcaption></figcaption></figure>

To run a search query for the errors, click on errors under the node with errors.

<figure><img src="../../.gitbook/assets/image (203).png" alt="" width="563"><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (222).png" alt="" width="563"><figcaption></figcaption></figure>

### Organizing apps with Virtual Nodes

To group all your namespaces under a specific group, we can use a virtual node in the topology.\
\
Here are the steps to create a virtual node,

* Click on update topology
* Under the virtual groups tab, click on add virtual group at the footer
* Enter the virtual group name and press enter

<figure><img src="../../.gitbook/assets/image (220).png" alt=""><figcaption></figcaption></figure>

* To add namespaces under your group, expand the groups in which you want to add namespaces and all other namespaces which are not grouped will be under the namespaces group
* Drag the namespace to the respective group and click update

<figure><img src="../../.gitbook/assets/image (204).png" alt=""><figcaption></figcaption></figure>

### Tagging Nodes

Tags are used to provide some additional attributes to nodes and they will be used for filtering the nodes.

Here are the steps to create tags in the topology

* Click `Update topology` and navigate to `tags` tab
* All the nodes will be listed with expand/collapse view
* Expand the node to view all the tags under the node

<figure><img src="../../.gitbook/assets/image (211).png" alt=""><figcaption></figcaption></figure>

* Click on `add tag` to create tag
* Provide key and value and press enter

<figure><img src="../../.gitbook/assets/image (224).png" alt=""><figcaption></figcaption></figure>

### Filtering Nodes

Tags are used to filter nodes in the topology. By default, namespace and application names are created as tags.\
Here are the steps to filter nodes,

* Click on `add filter`
* Select the `key` one with which you want to filter nodes
* Select the `value`. After selecting it, the filter will be applied and the nodes which have that key and value will be displayed in the view and others will be filtered

<figure><img src="../../.gitbook/assets/image (207).png" alt=""><figcaption></figcaption></figure>

Note:\
When we add multiple tags for filtering, then `OR` condition will be applied for combining those filters.
