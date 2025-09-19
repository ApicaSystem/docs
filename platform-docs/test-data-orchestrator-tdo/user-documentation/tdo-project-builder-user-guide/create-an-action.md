# Create an Action

Actions are reusable data blocks (list of attributes for which data needs to be assigned). Specific data blocks (output file formats) are attached to an ‘Action’ which can be assigned to any Step. This makes replacing file formats, without impacting output generation, much easier to do.

To create an action, you must first have your data block for the output format uploaded via the 'Ingest Data' step, and the data block must be validated.  On the menu, select 'Actions' from the 'Projects' section of the menu.  In the bottom right corner, click the plus (+) sign to open the 'Create Action' window.  Enter a name for the action on the top line.  Remember that this name must end in 'action'.  (If you forget to do that, TDO will pop up an error message and ask if you want to add \_action to the end of the name you have provided.)

<figure><img src="../../../../.gitbook/assets/image (863).png" alt=""><figcaption><p>Create Action window</p></figcaption></figure>

On the second line, click the blue pencil and select the data block that contains your desired format from the list of available data blocks.  Click 'Save' at the bottom of the window to add the data block to the action.  Only one data block can be added to an action.

<figure><img src="../../../../.gitbook/assets/image (864).png" alt=""><figcaption><p>Data block selection list</p></figcaption></figure>

The next step is to click the 'Save' button in the 'Create Action' window to save your action.  In the screen print below, we have created two actions - one for the request message in the API under test, and one for validating the API response.

<figure><img src="../../../../.gitbook/assets/image (865).png" alt=""><figcaption><p>Actions window with list</p></figcaption></figure>
