# Creating a Workflow

On the workflow page click the plus (+) sign in the lower right corner to open a new workflow page.

<figure><img src="../../../../.gitbook/assets/image (1025).png" alt=""><figcaption><p>Create work flow page</p></figcaption></figure>

Give the workflow a name on the top line.  TDO will automatically version control the workflow, so you don't need to enter anything there.

For now we will skip the second and third panes in this window (Work Flow Parameters).

In the fourth pane, you can create individual activities in your workflow.  You can run one or more activities in a workflow and can mix API and shell (batch) calls.

To add an activity, type a name for your activity in the 'Activity Name' space and then select the type of call (REST API Call or Shell Script).  Click the plus sign to the right to add it to the Activities section at the bottom of the page.

<figure><img src="../../../../.gitbook/assets/image (1026).png" alt=""><figcaption><p>Work Flow with defined activities</p></figcaption></figure>

Once the activities are added, save the workflow by clicking the 'Save' button in the top pane.

{% hint style="info" %}
You should test your API calls in a separate program (ex: Postman, SoapUI, Bruno, Insomnia, etc) before setting them up in TDO.   TDO is not designed as a API call development and testing program, but rather to bring workflow automation closer to the test data end user.
{% endhint %}
