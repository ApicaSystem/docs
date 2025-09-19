# Data Assembly

Data assembly can be started from two locations. &#x20;

On the 'Assignment Rules' page, there is a grid in the lower right corner.  Click on that grid, and the time out window will appear.  The time out value is the length of time that the work set will be locked (unavailable to other users).  This window defaults to 15 minutes but it can be changed to any value desired.  Click the 'Assemble' button to kick off the data assembly process.

<figure><img src="../../../../.gitbook/assets/image (851).png" alt=""><figcaption><p>Starting data assembly from Assignment Rules page</p></figcaption></figure>

Once you start data assembly, the progress bar will appear and will show the progress of your assembly job.  When data assembly completes, the progress bar will disappear.

<figure><img src="../../../../.gitbook/assets/image (852).png" alt=""><figcaption><p>Data assembly progress bar</p></figcaption></figure>

Data assembly can also be kicked off from the Work Sets page.  In the list of icons to the right of the work set name, the one to the far right is a grid.  Click on that grid to start data assembly.  When data assembly is kicked off from this page, you will not have an option to set the lock period; it will automatically be set at 15 minutes.

<figure><img src="../../../../.gitbook/assets/image (853).png" alt=""><figcaption><p>Work Sets page with lock 'on'</p></figcaption></figure>

Once data assembly is started, the lock is placed on the work set.  On the work set page, you can see this in the icons to the right of the work set name.  This lock will remain in place until the time period specified in the assembly process has passed.

{% hint style="info" %}
If the work set is locked, you will not be able to start the data assembly.  You will either need to remove the lock, if you are the one who placed it, or wait for it to expire.
{% endhint %}

Once data assembly is complete, you can view the results either using one of the data download API's (instructions for those are located at [https://docs.apica.io/platform-docs/test-data-orchestrator-tdo/user-documentation/api-guide/data-movement-apis/download-data-files](https://docs.apica.io/platform-docs/test-data-orchestrator-tdo/user-documentation/api-guide/data-movement-apis/download-data-files)) or can be viewed in TDO by selecting 'Assembled Data' from the 'Data Assembly' section of the main menu.  That will open the 'Assembled Data' page. &#x20;

<figure><img src="../../../../.gitbook/assets/image (854).png" alt=""><figcaption><p>Assembled Data page</p></figcaption></figure>

Each step in your scenario will have it's own line on this page.  You can view the data in the step by clicking the blue eyeball icon to the right of the step information.  In this window, each row of data is individually displayed.  Click on the row number to view the associated data.  If you have more than 10 rows of data, click the arrows at the bottom of the 'Row Manager' pane to navigate through pages.

<figure><img src="../../../../.gitbook/assets/image (855).png" alt=""><figcaption><p>Viewing data in the Content Manager window.</p></figcaption></figure>



&#x20;The Assembled Data page also shows the URL for downloading the data in .csv format.  Copy the URL string in the 'API' column and paste it in a new tab to download a .csv file of the assembled data. &#x20;

<figure><img src="../../../../.gitbook/assets/image (856).png" alt=""><figcaption><p>URL for downloading a .csv file</p></figcaption></figure>
