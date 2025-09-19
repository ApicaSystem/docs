# Ingest (Upload) Data Files

Currently, only csv files can be ingested by TDO.  These files must meet some simple rules:

·       Each file must contain column headers in the first row, and at least one row of data.

·       The column header field names must be lower case only, and use underscores instead of spaces.

·       Files cannot contain commas.  This is due to rules governing csv files, which interpret a comma as a field delimiter. Including a comma in a field will cause it to be split into two fields upon ingestion and all subsequent fields in that row will be out of sync with the column headers.

&#x20;Data upload is sent as two separate API’s, first a POST request to load the data and create an object ID in TDO and then a PUT request to provide the object names in TDO.&#x20;

There are two ways to send the data file to TDO - by pasting it in the body of the POST request, or by identifying the path/file in the body of the post request.

Regardless of the method used to move the data into TDO, the POST request must always be followed by a PUT request that links the uploaded data to a specific project, file name, and data block name.

#### Including data in the body of the POST request

&#x20;The file contents are the body of the message for the POST request, and for the PUT request the body must contain the file name and the data block name.  If this is a new upload, that is all that is needed.  If this is a refresh of an existing data block then you may also include a third line in the body, with a version number for the existing data block that is to be updated. If you do not include a version number, TDO will assign the the next sequence number available (i.e., 1.0 for a new data block name, 1._n_ for an existing data block).

&#x20;The POST request format is  http://\<server:port>/core/1.0/API/upload.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (583).png" alt=""><figcaption><p>Header and body of POST message - data in body</p></figcaption></figure>

The return message contains the UUID for the object as well as the sample for the second API.



**Identifying the path/file in the POST request**

The format of the request remains the same (URL).  In your automation tool (Postman is used here to demonstrate) select 'binary' as the format for the body of the request.  A 'select file' box will be displayed.  Click on the '+' sign next to 'New file from local machine' and a file explorer/file selection window will open.  Navigate to the desired file, highlight it, and click 'Open' and the file name will populate in the window.

<figure><img src="../../../../../.gitbook/assets/image (584).png" alt=""><figcaption><p>Selecting the path/file using 'binary' </p></figcaption></figure>

Note that any automation program that supports binary as an input option in the body (e.g., Insomnia, Postman, etc.) will support this process.

Click 'Send' to run this call, and you will receive the same return message as shown above.

<figure><img src="../../../../../.gitbook/assets/image (585).png" alt=""><figcaption><p>Return message - file and path identified in body of message</p></figcaption></figure>

#### PUT Request to identify data in TDO

The second API URL is http://\<server:port>/core/1.0/API/project/\<project-name>/\<project-version>/upload/\<file-id>.

&#x20;In Postman, the header line, body, and response for a new file put will look like the below example.  TDO will automatically version the upload - if this data block ('test3\_block') already exists as version 1.0, TDO will assign version 1.1 to your uploaded data.  If this data block name is new in the project, TDO will assign version 1.0.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (587).png" alt=""><figcaption><p>PUT command and response message in Postman</p></figcaption></figure>

&#x20;After this is run, you can see the resulting data block in TDO.  You will not be able to see the data block in TDO until this call is completed; this is what associates the data to a specific project and data block name.

&#x20;

<figure><img src="../../../../../.gitbook/assets/image (574).png" alt=""><figcaption><p>Newly created data block in TDO (bottom of list)</p></figcaption></figure>

The contents of the data block can be viewed in TDO.

<figure><img src="../../../../../.gitbook/assets/image (575).png" alt=""><figcaption><p>Contents of first row of data </p></figcaption></figure>

