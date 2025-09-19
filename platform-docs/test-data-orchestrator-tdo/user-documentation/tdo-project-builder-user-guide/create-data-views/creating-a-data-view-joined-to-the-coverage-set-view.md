# Creating a Data View Joined to the Coverage Set View

We will now create a data view for our 'customers' data block that references values in the Coverage Set data view that we have created.

Start by clicking the plus(+) sign in the lower right corner to open the 'Create Data View' window.  Give the data view a name ('customer\_view') that is logical in relation to the data block and process you are working on.  Click the pencil for editing the source file and select the data block that will be the source for this join.

<figure><img src="../../../../../.gitbook/assets/image (874).png" alt=""><figcaption><p>Data view name and source file selected</p></figcaption></figure>

In the second pane of this window is a 'Criteria' list.  This is where we will create the join conditions.  Click the plus sign on the far right of this pane to create a new join condition.  In the left upper pane is a list of the fields in the selected data block ('customers').  Select the field that will be used for this join criteria. (In this case, we have selected 'customer\_type'.)  Once that field is selected, the left hand side of the lower pane will show the selected field in 'data\_view.field\_name' format.

The center section of the lower pane has the matching criteria, which will default to 'Equal'.  You can change this by clicking on the drop down arrow to the right of the list.  Available options are 'Equal', 'Not Equal', 'Exists In', 'Not Exists In', 'Greater', 'Less', 'Greater/Equal', 'Less/Equal', 'Between', and 'Not Between'.

In the upper right pane, you will need to select the file that you are joining to.  Since we are going to join to the coverage set data view (named 'new\_build\_cov\_view') the words 'cov\_' are typed on the search bar and TDO has popped up the data view name(s) that match.&#x20;

<figure><img src="../../../../../.gitbook/assets/image (875).png" alt=""><figcaption><p>Criteria window</p></figcaption></figure>

Click on the desired data view name to populate a list of fields from that data view.  Click on the name of the field that you want to match to the selected source data field.  This will populate the 'Matching Attribute' section in the lower pane and create the join condition 'customer\_view.customer\_type Equal new\_build\_cov\_view.customer\_type'.  Click on the 'Save' button in the lower right corner of the bottom pane to save this criteria.

<figure><img src="../../../../../.gitbook/assets/image (876).png" alt=""><figcaption><p>Creating a join condition in a data view</p></figcaption></figure>

The data view page will now display the completed criteria.

<figure><img src="../../../../../.gitbook/assets/image (877).png" alt=""><figcaption><p>Data view with criteria</p></figcaption></figure>

You can have multiple criteria in a view. Enter as many as you need to properly match the records in the source data block to the records in the coverage set.  In this case, we have three criteria.  Click the 'Save' button in the upper pane to save the data view.

<figure><img src="../../../../../.gitbook/assets/image (878).png" alt=""><figcaption><p>Final criteria for 'customers' data view</p></figcaption></figure>
