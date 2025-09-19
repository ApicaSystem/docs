# Creating a Coverage Set Data View

Select 'Data Views' from the 'Data Management' section of the menu.  This will open the 'Data Views' main page, where you can view/edit/delete existing data views and create new data views.  Click the plus (+) sign in the lower right corner to create a new data view.  This will open the 'Create Data View' window. &#x20;

{% hint style="warning" %}
All Data Views must end in '\_view'.  If you forget to do this, TDO will prompt you and will add it automatically.
{% endhint %}

In the window, provide a name for the data view.  Click the blue pencil below the name line (to the right of the 'Source' label) to select the coverage matrix that will be the source file for this data view.  A list of all available data blocks will pop up.  To reduce the number of files shown, you can type one or more words that are in your target file and hit enter; this will filter the list down to only the matching files.  Click the check box to the left of the file you want to use as your source, and click the 'Save' button to complete the selection.

<figure><img src="../../../../../.gitbook/assets/image (871).png" alt=""><figcaption><p>Select files list with filter line </p></figcaption></figure>

Since this is the coverage set view, we will not add any criteria to this data view since the coverage set data view acts as the pivot table for the remaining data views.  Click the 'Save' button to save the data view. &#x20;

<figure><img src="../../../../../.gitbook/assets/image (872).png" alt=""><figcaption><p>Creating a new data view</p></figcaption></figure>

If you forgot to end the data view with '\_view' this message will pop up.  You can click 'OK' and TDO will complete the object name for you, or you can click 'Cancel' and correct it yourself.

<figure><img src="../../../../../.gitbook/assets/image (873).png" alt=""><figcaption><p>Error message</p></figcaption></figure>

Once this data view is saved, you can now build data views for your source files.
