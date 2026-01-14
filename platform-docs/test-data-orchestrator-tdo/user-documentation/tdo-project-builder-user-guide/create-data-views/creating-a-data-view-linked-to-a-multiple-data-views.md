# Creating a Data View Linked to a Multiple Data Views

Sometimes, we need to join a data view to another data view that is not the coverage set, or to multiple data views.  To set up the 'accounts' data block data view, we need to link to both the coverage set data view and the customers data view.  This can be done manually, by editing the data view, or it can be done from the data views main page

### Manually Linking Two Data Views

Start by creating a new data view for the accounts data block and creating a link to the coverage set data view on the 'account\_type' field.  In this case, we need to make sure that we are picking an account type that matches the coverage set criteria, and is matched to a specific customer ID from the customer data view.  Click the plus (+) sign in the lower pane to open a new critiera window.  Select 'customer\_id' from the field list on the left, then start to type in the name of the customer\_view on the right and select the data view when the name pops up.  Click on the 'customer\_id' field in the list to add it to the condition, and click 'Save' to save the critieria.

<figure><img src="../../../../../.gitbook/assets/image (879).png" alt=""><figcaption><p>LInking to a data view that is not the coverage set data view</p></figcaption></figure>

For the account selection, we have created a total of three conditions. The conditions are

* account\_view.account\_type Equal new\_build\_cov\_view.account\_type
* account\_view.customer\_id Equal customer\_view.customer\_id
* account\_view.balance Greater new\_build\_cov\_view.pmt\_amount

and this will link an account that has a matching customer type and enrollments to an account that is from a selected customer, with the right account type and a balance that is greater than the payment amount in the test case.

<figure><img src="../../../../../.gitbook/assets/image (880).png" alt=""><figcaption><p>Completed 'account_view' criteria</p></figcaption></figure>

Click the 'Save' button to save the data view.

### Linking from the Data Views Page

On the data views page, check the box to the left of the two views you want to link.  Once you check a box on the left, four icons will appear in the upper right corner of the views page.  The far right icon (two arrows pointing at each other) is the 'link data views'.

Click this icon to initiate the linking process.

<figure><img src="../../../../../.gitbook/assets/image (1153).png" alt=""><figcaption><p>Linking data views</p></figcaption></figure>

Once you click the icon, a hierarchy window will pop up with the selected views.

<figure><img src="../../../../../.gitbook/assets/image (1154).png" alt=""><figcaption><p>Data view hierarchy window</p></figcaption></figure>

Drag the secondary view (accounts) down and below the primary view (customers) so that the hierarchy is displayed, and then click the 'generate criteria' button.

<figure><img src="../../../../../.gitbook/assets/image (1155).png" alt=""><figcaption><p>Data view hierarchy defined</p></figcaption></figure>

A green confirmation message will pop up when the views are linked.  TDO will automatically look for a common field name between the two data views and link them.  The completed link is shown below.  (added link is the bottom link in the list)

<figure><img src="../../../../../.gitbook/assets/image (1156).png" alt=""><figcaption><p>Auto generated data view link</p></figcaption></figure>
