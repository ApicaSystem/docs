# Creating a Work Set

Before you create a work set, you must have the Action(s), Scenario, Coverage Set, Business Rules, and Data Views completed.  You can create a workset manually, or from the Data Views page

### Manual Work Set Creation

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

### Creating a Work Set from Data Views Page

To create a work set from the data views page, you first need to make sure that your coverage set and scenario are selected and visible in the context cookies box (blue box in very upper right hand corner) as these will be used as part of this process.

Navigate to the data views page from the main menu.  Click the check box to the left of the data views you want to include in your work set.

{% hint style="info" %}
Selection needs to be from a single page.  If you have more than 10 data views (default view) then you need to use the 'rows per page' option in the lower left corner of this window to expand the page to show all of the data views you want to use before selecting and proceeding.
{% endhint %}

After selecting your views, go to the icons in the upper right corner of the list.  The second from the right icon (wrench in a blue circle) is the 'generate data views' button.  Click this button to generate your work set with selected data views.

<figure><img src="../../../../../.gitbook/assets/image (1150).png" alt=""><figcaption><p>Creating a work set from data views</p></figcaption></figure>

A dialog box will pop up asking you to name the workset.  Enter the name (remember, it must end with '\_workset'; if you do not include this TDO will prompt you and add it automatically).  Press the 'generate' button to generate the work set or the 'cancel' button to cancel the operation.

<figure><img src="../../../../../.gitbook/assets/image (1151).png" alt=""><figcaption><p>Name work set dialog</p></figcaption></figure>

A green message box will pop up when the work set is generated.  At this point it is available on the Work Sets main page.

{% hint style="warning" %}
When creating a work set this way, the data views will be listed in the same sequence as they are on the data views page.  If your data views include inter-view links (i.e., a join between two views where neither one is the overall coverage view) you need to ensure that they data views are in the proper order in the work set before using the work set.

As an example, in the workset shown above, there is a link between the 'accounts' and 'customers' data view on the 'cust\_id' field.  The 'customers' data view is the source for this field, so in the work set the 'customers' view needs to appear avove 'accounts' view.

To perform this operation, you will need to edit the work set, delete the view that is out of order, and then re-add it. &#x20;
{% endhint %}





### Selecting and Working with a Work Set

To use the work set, from the main work set page, click the blue check sign to the right of the work set name.  This will add the work set name and version to the upper right context cookies window and you will get a green message that the work set selection was successful.

<figure><img src="../../../../../.gitbook/assets/image (1152).png" alt=""><figcaption><p>Work Sets main page - work set not selected</p></figcaption></figure>

<figure><img src="../../../../../.gitbook/assets/image (1157).png" alt=""><figcaption><p>Work Sets main page - work set selected</p></figcaption></figure>

There are six icons available to the right of the work set on this page if the work set is not selected; up to seven icons are visible if the work et has been selected.  Instructions on using  these icons are in the detailed instructions for those functions.  From left to right, they are:

* Blue check box: select work set&#x20;
* Blue pencil - edit work set
* Plus sign in a blue shadowed box - clone work set
* Blue clipboard with lines - automatically create assignment rules
* Small blue trash cans with right lines - delete existing assignment rules
* Blue trash can - delete work set
* Blue grid (only visible on a selected work set) - assemble data \[note: assignment rules must be in place for this function to work; instructions on using this button can be found under the 'Data Assembly' section of this manual]

Note that some of these icons may not be visible to all users, depending on your assigned role.
