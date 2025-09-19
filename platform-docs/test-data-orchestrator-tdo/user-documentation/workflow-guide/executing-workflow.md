# Executing Workflow

Workflow is executed from the main workflow page.

When you hover your cursor over a workflow, there are several icons that appear to the right of the workflow name.

<figure><img src="../../../../.gitbook/assets/image (1048).png" alt=""><figcaption><p>Workflow icons</p></figcaption></figure>

These icons are, from left to right:

* Pencil - edit workflow
* Page - execution log (shows the workflow activity).  This log will append the current run to any prior runs, so if you want a clean log, you should use the next button to clean the log out prior to your run.
* Page with slash - empty execution log.  This removes all results currently in the log.
* Right ('play') arrow - execute the workflow.
* Trash can - delete workflow.  You will only see this icon if you are an Admin level user.

Clicking the 'play' arrow will execute the workflow.  While the workflow is running, TDO will slightly gray out and display a 'working' circle.  Once done, you can view the execution log.

<figure><img src="../../../../.gitbook/assets/image (1049).png" alt=""><figcaption><p>Workflow execution log with error</p></figcaption></figure>

Note that if there is an error in your workflow, this will display in the log.  The final item in this log is an error telling you that the item you specified is not present.

If your message executed without errors the response will look like this.

<figure><img src="../../../../.gitbook/assets/image (1050).png" alt=""><figcaption><p>Workflow log with successful execution</p></figcaption></figure>
