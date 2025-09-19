# Data Assembly

## Orson – Test Data Orchestrator

End User Guide

### Selecting the Work set

To assign data to each row in the coverage matrix, you first need to select a Work set.  From the ‘Data Assembly’ section of the menu, select Work sets to open the Work Sets page.  Hover to the right of the work set you have been provided for your set of tests and click on the blue check box.  The work set you have selected will populate in the context box in the upper right corner.

&#x20;

You will notice that the ‘Locked by’ column will not populate when you select the work set, this will only be locked when you are assembling data.  We will discuss these locks more in the next section, but if a work set is locked you cannot select it or assemble data.  Only the person who set the lock, or an Admin user, can remove the lock manually.  These locks are set for a specific period of time (default is 15 minutes) and will automatically expire.

&#x20;

<figure><img src="../../../../.gitbook/assets/image (379).png" alt=""><figcaption><p>Select Work Set screen</p></figcaption></figure>

&#x20;

### Assembling Data

To assemble the data (i.e., to assign test data to each row in the coverage matrix) select Assignment Rules from the ‘Data Assembly’ section of the menu.

&#x20;

The Assignment Rules page will open.  In the bottom right corner is a blue box with a white grid.

&#x20;

Note that TDO has the option to allow data to be uniquely used or to be reused; the project builder will set that lock.  If the lock is ‘on’ for a specific source table, then each row in that table can only be used once.  This allows for test data to be reserved so that it cannot be assigned to multiple tests.  Your project builder can let you know if your project has this feature enabled.

&#x20;

<figure><img src="../../../../.gitbook/assets/image (380).png" alt=""><figcaption><p>Assignment Rules page and data assembly button location</p></figcaption></figure>

&#x20;Click on the grid in the lower right box  and the Set Lock Timeout dialog box will open.  This is pre-populated with 15 minutes; you can change this to be shorter or longer as needed.

&#x20;

<figure><img src="../../../../.gitbook/assets/image (381).png" alt=""><figcaption><p>Lock Timeout dialog box</p></figcaption></figure>

&#x20;

The purpose of this lock is to ensure that you have time to download the data you have assembled before someone else can run a new data assembly process.  Once your lock timeout is ready, click ‘ASSEMBLE’ to assign data to your tests.

&#x20;

The ‘Set Lock Timeout’ dialog box will close and a data assembly progress bar will appear on your screen.

&#x20;

<figure><img src="../../../../.gitbook/assets/image (382).png" alt=""><figcaption><p>Data Assembly progress bar</p></figcaption></figure>

&#x20;

&#x20;

### Viewing Assembled Data

From the ‘Data Assembly’ section of the menu, select Assembled Data.

&#x20;

The Assembled Data screen will display.  This will show one file for each step in your work set.  A work set can have one or more data steps.

&#x20;

<figure><img src="../../../../.gitbook/assets/image (383).png" alt=""><figcaption><p>Assembled Data screen</p></figcaption></figure>

&#x20;

To view the data, hover to the right of the row you want to view and click on the blue eyeball icon.  The Content Manager page will open.  From here, you can view the data assigned to a single row by clicking on the row number in the Row Manager section on the left.  The data assigned to each field will show on the right.

&#x20;

<figure><img src="../../../../.gitbook/assets/image (384).png" alt=""><figcaption><p>Assembled Data content screen</p></figcaption></figure>

&#x20;

This page is best used for doing quick checks of data.  If you want to view all the assigned data, you should download the data to a file.
