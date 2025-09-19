# Creating a Data View Linked to a Multiple Data Views

Sometimes, we need to join a data view to another data view that is not the coverage set, or to multiple data views.  To set up the 'accounts' data block data view, we need to link to both the coverage set data view and the customers data view.

Start by creating a new data view for the accounts data block and creating a link to the coverage set data view on the 'account\_type' field.  In this case, we need to make sure that we are picking an account type that matches the coverage set criteria, and is matched to a specific customer ID from the customer data view.  Click the plus (+) sign in the lower pane to open a new critiera window.  Select 'customer\_id' from the field list on the left, then start to type in the name of the customer\_view on the right and select the data view when the name pops up.  Click on the 'customer\_id' field in the list to add it to the condition, and click 'Save' to save the critieria.

<figure><img src="../../../../../.gitbook/assets/image (879).png" alt=""><figcaption><p>LInking to a data view that is not the coverage set data view</p></figcaption></figure>

For the account selection, we have created a total of three conditions. The conditions are

* account\_view.account\_type Equal new\_build\_cov\_view.account\_type
* account\_view.customer\_id Equal customer\_view.customer\_id
* account\_view.balance Greater new\_build\_cov\_view.pmt\_amount

and this will link an account that has a matching customer type and enrollments to an account that is from a selected customer, with the right account type and a balance that is greater than the payment amount in the test case.

<figure><img src="../../../../../.gitbook/assets/image (880).png" alt=""><figcaption><p>Completed 'account_view' criteria</p></figcaption></figure>

Click the 'Save' button to save the data view.
