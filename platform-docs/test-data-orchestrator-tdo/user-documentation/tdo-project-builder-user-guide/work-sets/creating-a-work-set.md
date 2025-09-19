# Creating a Work Set

Before you create a work set, you must have the Action(s), Scenario, Coverage Set, Business Rules, and Data Views completed.

To create a work set, select 'Work Sets' from the 'Data Assembly' section of the menu.  This will open the Work Sets page.

To create a new work set, click the blue plus (+) sign in the lower right corner. This will open the 'Create Work Set' window.

Type a workset name on the top line.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (946).png" alt=""><figcaption><p>Create work set window</p></figcaption></figure>

Below that, click the blue pencil to the right of the 'Scenario' label.  This will open a pop-up window with the available scenarios in your project.  To select a scenario, click the check box to the left of the scenario name and then click the 'Save' button at the bottom of the pop-up window.

<figure><img src="../../../../../.gitbook/assets/image (947).png" alt=""><figcaption><p>Scenaro selection pop up window</p></figcaption></figure>

Next, below the scenario field, click the blue pencil to the right of the 'Primary' label.  This is where you define which Data View is the primary data view for your workset.  A list of all available data views in your project will open; select the desired view by clicking the check box to the left of the name and then the 'Save' button at the bottom of the pop-up window.

{% hint style="warning" %}
Your primary data view will almost always be the coverage set data view. You may come across exceptions as your use of TDO matures, but this is a good default assumption.
{% endhint %}

<figure><img src="../../../../../.gitbook/assets/image (948).png" alt=""><figcaption><p>Select primary data view window</p></figcaption></figure>

To the right of the 'Primary' field is the label 'Data Set'.  Click the blue pencil to the right of this label and a selection window will open with the name(s) of the data block(s) associated with this data view.  \[Generally, only one coverage matrix data block will be associated with any given work set, but there may be multiple versions of this data block. Make sure that you select the right version for the workset you are creating.]

Click the check box to the left of the data block name, and then click 'Save' at the bottom of the window.

The top pane of the 'Create Work Set' window is now complete.  To link the remaining data views to the workset, navigate to the bottom pane and click the blue plus (+) sign in the right corner.  This will open a list of all available data views in your project.  Check the boxes to the left of the data view(s) you want to add to the work set and then click the 'Save' button at the bottom of the window.

<figure><img src="../../../../../.gitbook/assets/image (949).png" alt=""><figcaption><p>Select data views</p></figcaption></figure>

{% hint style="info" %}
Do not include the coverage set data view in this list; it is already included in the work set definition.  Any data block that you want to use for data assembly must be included in your work set.
{% endhint %}

The completed work set can have as few as one data views attached (only the primary) or it can have many data views attached. &#x20;

Click 'Save' in the top pane of the 'Create Work Set' window to save the workset.

To use the workset, from the main work set page, click the blue check sign to the right of the work set name.  This will add the work set name and version to the upper right context cookies window and you will get a green message that the work set selection was successful.

<figure><img src="../../../../../.gitbook/assets/image (950).png" alt=""><figcaption><p>Selecting a work set</p></figcaption></figure>
