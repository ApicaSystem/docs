# Setting up a REST API Call

To begin setting up the steps of your workflow, click the blue pencil icon to the right of the workflow name to edit the workflow you have created.

<figure><img src="../../../../../.gitbook/assets/image (1027).png" alt=""><figcaption><p>Editing a workflow</p></figcaption></figure>

After opening the workflow, hover over the item you want to edit and click the blue pencil icon to the right of the activity name to edit that activity.

<figure><img src="../../../../../.gitbook/assets/image (1028).png" alt=""><figcaption><p>Selecting activity to edit</p></figcaption></figure>

When you create an activity as a REST API call, the window will ask for the URL and the  method, and have text boxes for the body of the call and the headers (if needed).  The body and header boxes can be expanded by pulling down on the lower right-hand corner of the box.  (Body box is shown expanded in the screen print below.)

<figure><img src="../../../../../.gitbook/assets/image (1029).png" alt=""><figcaption><p>Edit call window</p></figcaption></figure>

For this call, the URL is added, the method (POST) selected using the drop down arrow to the right of that line, and the body of the call pasted into the 'Body' section in JSON format.  The TDO API calls do not require headers, so these are left blank.  If your API call requires headers, they should be entered in the 'Header' section at the bottom of the window.

{% hint style="info" %}
Unlike other actions in TDO, the context cookies for project, coverage set, and workset do not limit activities in workflow.  You can call to any server, any project, any workset, as long as that is referenced in the URL of the REST API call.
{% endhint %}

Once the call information is entered, click 'Save' to save the details. &#x20;

If your API does not require any body text, the setup window will only contain the URL.

<figure><img src="../../../../../.gitbook/assets/image (1030).png" alt=""><figcaption><p>API window with no body text</p></figcaption></figure>

{% hint style="info" %}
In the following sections, the use of User Guided Parameters, JSON Path, and XML Path for passing parameters will be covered.  Remember that these methods are not exclusive, and can be combined in a single call depending on what you are executing, the response message, and desired end result of your workflow.
{% endhint %}
