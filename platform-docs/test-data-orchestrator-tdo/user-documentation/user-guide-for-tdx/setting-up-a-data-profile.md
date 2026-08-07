# Setting up a Data Profile

## Orson Test Data Orchestrator

### Test Data Extractor (TDX) User Guide

### Create an Initial Profile

Enter the connection string for your database in the ‘Connection String’ field in the top right section of the page. Enter the User ID and Password for the database in the User and Password fields.

If you do not have the connection string, contact your database administrator to get the proper string.

You must have, at a minimum, read access database credentials (User ID and password) to access the database. If you do not have these credentials, follow your organization’s approved process for obtaining them.

Click ‘Connect’ to connect to the database. You will see the list of tables that your User

ID has access to in the left side of the ‘DB Tables’ section when the connection is established. If you cannot see what you are looking for, you may need to require extended access privileges to additional tables or schemas.

<figure><img src="../../../../.gitbook/assets/db connect.png" alt=""><figcaption><p>Database connection</p></figcaption></figure>

### Saving a Profile

At this point, you should save this as your basic connection profile. At the bottom right of the window, click on the ‘Save Profile’ button. A standard file saving dialog box will pop up. Select the directory you want to save the profile in (Data Extractor/Profiles is the recommended directory) and give the file a name (e.g.: basic profile).

File type of XML is already chosen by the application; do not modify this.

Click ‘Save’ to save this profile.

Saved profiles make loading work easier, as you do not need to remember the database connection string.

Note that TDX does not save the User ID or password in the profile; you will need to provide this each time you load a profile.

<figure><img src="../../../../.gitbook/assets/image (391).png" alt=""><figcaption><p>File dialog box</p></figcaption></figure>

### Loading a Saved Profile

At the bottom right of the TDX window, click on ‘Load Profile’. A file open window dialog will open. You may need to navigate to the subdirectory where your profiles are saved.

If you do not see any saved profiles, change the ‘Files of Type’ field from ‘XML files’ to ‘All Files’.

Click on your profile name to select it and click ‘Open’.

TDX will prompt you to enter the User ID and password for the database.

<figure><img src="../../../../.gitbook/assets/conn3.png" alt=""><figcaption><p>Opem Profile Dialog</p></figcaption></figure>

### Setting up an Extract Profile

To extract data, enter the URL for your desired coverage matrix in the ‘Coverage Matrix URL’ field at the top right, just below the database credentials line.

Your URL will be in the format:

http://\<server\_name>:8080/core/1.0/API/project/\<project\_name>/\<ver\_no>/datablocks/\<cov\_matrix\_name>/\<ver\_no>/

Here is an example of the coverage matrix retrieval URL:

[http://52.512.68.75:8080/core/1.0/API/project/payments\_demo/1.0/datablocks/payments\_coverage/1.0/](http://35.214.71.106:8080/core/1.0/API/project/payments_demo/1.0/datablocks/payments_coverage/1.0/)

Note that this could be http or https, depending on how TDO is loaded in your environment.

The server name could be in multiple formats, including an IP address, ‘localhost’, or a VM or server name.

The project name and the coverage matrix name are the ones used in TDO.

Once the coverage matrix name is entered, click on the ‘Get Coverage Matrix’ button to the right of the URL.

To confirm that the connection to the coverage matrix is established, look in the center box below the ‘Attributes to Select’ section of the window. You should be able to click on the dropdown box and see all of the determining attribute names from your coverage matrix.

<figure><img src="../../../../.gitbook/assets/image (393).png" alt=""><figcaption><p>Coverage matrix attributes populated in drow-down box</p></figcaption></figure>

Next, we will tell TDX where to put the extracted data and what name to give the data block.  You have two options for the output.  The primary method is to have TDX load the data directly back to TDO but you can also have the output saved as a file on the same server where TDX is located. (Note: the second option is often used for workflow actions in TDO.)

#### Sending Data to TDO

On the bottom row, enter the project name, project version, and data block name for your extract. Generally speaking, the project name and project version will be the same ones used in the coverage matrix URL. The data block name should be one that is easy to identify as coming from your extraction. Finally, remember that all file names in TDO must be lower case with underscores instead of spaces.

<figure><img src="../../../../.gitbook/assets/image (394).png" alt=""><figcaption><p>Identifying target project, version, and data block name</p></figcaption></figure>

#### Saving Data in a CSV File on the Server

Immediately above the row with the project, version, and data block name information, there is a row with several checkboxes:

<figure><img src="../../../../.gitbook/assets/image (170).png" alt=""><figcaption><p>Options row in TDX</p></figcaption></figure>

The 'throw error if no data found' checkbox is generally only used when running TDX within a larger TDO workflow and you want the workflow to stop if no data is found.  This will send an error message back to the workflow and stop execution with this step.

Check the 'Save Extract to File' box if you want to send the output file to the server and not to TDO.  If you check this box, any information on the bottom row will be disregarded.  If this box is not checked, any information in the 'include header' and file name text boxes will be ignored.

The 'Include Header' box allows you to send the file with a header row (box is checked) or without a header row (box is not checked).

Finally, there is a text box. You need to enter the full drive:\directory\filename destination path on the server that TDX is running on.  The file will be saved to this location.
