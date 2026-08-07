# Ingest Data

TDO can upload .csv files. To import data files, go to the ‘Data Management’ section of the menu, and select ‘Ingest Data’. This will open a list of all files that have been imported in your project.

<figure><img src="../../../../../.gitbook/assets/image (918).png" alt=""><figcaption><p>Ingest Data page</p></figcaption></figure>

To import a new file, click on the plus sign in the lower right hand corner of the window. The ‘Upload Data’ window will open.  This will open the upload files page.  You can upload one or more files at one time.  The page will open with a single line for upload; click the 'Add File' button in the upper right corner to add more lines.  Each row will upload a single file.

Click the blue box at the left of the line to open file explorer and select the file.

The next field, 'Data Block Name' will be the name the file has in TDO. Uou will need to provide a name for your data block. Since the same file can be imported multiple times, the data block name is the unique name that TDO will use to manage this file. You can give it a new data block name, or you can use an existing data block name. If you use an existing data block name, TDO will find the most recent version and increase the version number accordingly.

The third field is the 'Description' field; this is a text description of what is in the file. This field is optional.

The trash can on the right removes the file from the upload list.

TDO will also perform a .csv validation on the files. If there are any errors that need to be fixed, these will show as red boxes in the upper right section of the window. If the files pass validation, a green box will show in the upper right corner.

<figure><img src="../../../../../.gitbook/assets/image (225).png" alt=""><figcaption><p>Upload files page</p></figcaption></figure>

Some of the most common errors are in the column headers. As stated in the introduction to this guide, all TDO objects must adhere to JSON naming conventions. This means that all column headers must be lower case only, underscore instead of space, no special characters. Column headers must also not contain any leading spaces, and there cannot be any duplicate column names.

Data rows are not subject to these rules.

Once imported, the file names will be shown at the bottom of the list of uploaded files. Note that on this screen, the actual file name that was imported will be shown.

<figure><img src="../../../../../.gitbook/assets/image (920).png" alt=""><figcaption><p>Imported file name displayed</p></figcaption></figure>
