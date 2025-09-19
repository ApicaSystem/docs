# Performing Table Updates

## Orson Test Data Orchestrator

### Test Data Extractor (TDX) User Guide

### Updating Tables Using TDX

One other function TDX can perform is updating table values.   When performing updates, you can only update one table at a time.  It is also important to note that in order to perform this function, your User ID must have write/update permission in the database; if you only have read access, you cannot perform this function.

&#x20;

TDX is often used to manage, coordinate and control table updates, by setting up reusable extract profiles in TDX rather than allowing individuals or teams to make table updates directly. From a data governance perspective it is preferable to limit direct table updates in controlled environment to the bare minimum required.

&#x20;

When you use TDX to manage this process, you can ensure that table updates are only done by those who have the right credentials, you can ensure that are using repeatable templates to make the updates, thereby reducing human error, and you can also automate the sequence of updates once your update profile has been baselined and validated. Thereafter, you can often simply tweak your criteria in TDO, and then execute the updates using TDX as part of an automated workflow.

&#x20;

### Setting this up in TDO

In TDO, you would create data assignment rules that contain the fields you want to modify as well as the fields you want to use as key fields in the lookup.  Once that output file is created (see the TDO User Guide for instructions on how to create an output file) you can then use it to update tables.

&#x20;

In TDX, select a table from the DB Tables section.  It can be on either the available (left) or selected (right) side of this section.  \[You can only select one table at a time.]

&#x20;

<figure><img src="../../../../.gitbook/assets/update page.png" alt=""><figcaption><p>Selecting a table to update</p></figcaption></figure>

A dialog box ‘Update \<database\_name>.\<table\_name> using Data Block’ will pop up.  (See screen print below for examples of all entries.)

&#x20;Click on this box and a table update window will open.  In the URL box at the top of the window, paste the URL for the data block from the TDO Assembled Data page, changing ‘core/1.1/API’ to core/1.0/API’.  Click the ‘Read’ button to the right of the URL and the window will populate with the table fields.

We will first identify the key field – the field TDX will use to identify the records to be updated.  This does not have to be the primary key for the database but should be a unique value.

Click the checkbox for the primary key.  (Note that you can update a field identified as the primary key for this function, but updating primary key fields is not recommended.)  In the ‘DataBlock Attributes’ column, select the associated data block field that contains the primary key value to be used to look up the records to be changed.

&#x20;Next, for the fields you want to update, go to the ‘DataBlock Attribute’ column and open the drop-down list.  This list contains every field in the Data Block you are using for the updates.  Select the field you want to use to update the associated table field.&#x20;

&#x20;In this example, I am using the ‘amount’ field in the output data block to update the ‘balance’ field in the table, and the ‘currency’ field in the output data block to update the ‘currency’ field in the table.  You do not need to take any action for fields you are not updating or using as Primary key(s).

&#x20;

<figure><img src="../../../../.gitbook/assets/table info.png" alt=""><figcaption><p>Table update window - sample entries</p></figcaption></figure>

Click ‘OK’ to process the update, or ‘Cancel’ to exit out of the window without updating.  When the update is complete, the update window will close, and a message will pop up.  If an error occurs, an error message will populate to inform you of the error.

&#x20;

<figure><img src="../../../../.gitbook/assets/update complete.png" alt=""><figcaption><p>Table update completed message</p></figcaption></figure>
