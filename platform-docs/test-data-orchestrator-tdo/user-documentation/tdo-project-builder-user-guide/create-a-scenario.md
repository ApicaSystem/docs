# Create a Scenario

Scenarios are where you define data requirements for specific use cases. They often apply at the business process / function level or API / service level. A Scenario has one or more Steps that link to data output file formats.

Steps are aligned under a Scenario. Each step represents a user ‘Action’ for which data needs to be assigned by TDO. e.g., ‘Apply for loan’ or ‘book flight’ or ‘validate outcomes'. The TDO data output format for each ‘step’ is ingested to TDO and linked to each Step as a reusable ‘Action’.

Scenarios can be created two ways - from the Data Blocks page or manually.  If you create from the data blocks page, the actions are created automatially for you.

### Creating from Data Blocks page

To create a scenario from the data blocks page, check the box to the left of the file(s) that will be the output format for your actions.  In the example below, 'payment\_request' and 'payment\_response' are selected.  In the upper right of the page there are four blue icons; the second from the right will create a scenario and action(s) from the selected data block(s).

<figure><img src="../../../../.gitbook/assets/image (3).png" alt=""><figcaption><p>Creating a scenario and actions from data blocks</p></figcaption></figure>

Click the 'generate scenario' icon.  A window will pop up for naming the scenario and generating it.  Name the scenario and click 'Generate' to create the scenario and actions.

<figure><img src="../../../../.gitbook/assets/image (4).png" alt=""><figcaption><p>Naming and generating a scenario</p></figcaption></figure>

After generating the scenario, it is available on the scenario page.  The screen below shows the contents of the scenario that were auto-generated.

<figure><img src="../../../../.gitbook/assets/image (5).png" alt=""><figcaption><p>Auto-generated scenario</p></figcaption></figure>

The actions created as part of this process are also shown on the 'Actions' page.  They can be re-used in any manually created scenario.

<figure><img src="../../../../.gitbook/assets/image (6).png" alt=""><figcaption><p>Auto-created actions</p></figcaption></figure>

### Manual Creation

To create a Scenario, in the 'Projects' section of the menu, select 'Scenarios'.  Click the plus (+) sign in the bottom right corner to open the 'Create Scenario' window.  In the top section, type in a name for your scenaro.  (Note that you do not have to end a scenario with \_scenario.)

In the second section of the window, type in the name of the step you want to create and then click the blue plus sign to the left to add it to the 'Steps' section in the bottom of the window.  For this case, we have two steps - one for the request and one for the response.

<figure><img src="../../../../.gitbook/assets/image (866).png" alt=""><figcaption><p>Create Scenario window</p></figcaption></figure>

After the steps are added, you need to link an existing action to each step.  You can use different actions for each step, as we will here, or you can use the same action for all steps.  Also note that you can have a scenario with one step or multiple steps. &#x20;

To link the action to the step, move your mouse to the right of the step name and click on the blue pencil.  This will open a window to edit the step.  Start to type the name of the action (in this example, 'act' was used as all actions will end with that) and TDO will pull up a list of all actions that match what you have typed.  Select the target action by clicking on the name and TDO will populate the remainder of the window with the action and data block names.  Click 'Save' to link the action to the step.

<figure><img src="../../../../.gitbook/assets/image (867).png" alt=""><figcaption><p>Edit Step window</p></figcaption></figure>

Complete this for all step(s) in the scenario.  The step list will show the steps with their corresponding actions.

<figure><img src="../../../../.gitbook/assets/image (868).png" alt=""><figcaption><p>Steps with actions </p></figcaption></figure>

Once this is done, click 'Save' to save the Scenario.

A scenario can be cloned or copied by opening the 'Edit Scenario' window and changing the name.  After the name is changed, add a new step name in the center pane, and then link the new step to an action in the bottom pane. Click the 'Save' button in the top pane to save the modified scenario under a new name.

<figure><img src="../../../../.gitbook/assets/image (869).png" alt=""><figcaption><p>Cloning a scenario</p></figcaption></figure>

The scenario page will be updated to show both scenarios after this action is complete.

<figure><img src="../../../../.gitbook/assets/image (870).png" alt=""><figcaption><p>Scenario window with updates</p></figcaption></figure>
