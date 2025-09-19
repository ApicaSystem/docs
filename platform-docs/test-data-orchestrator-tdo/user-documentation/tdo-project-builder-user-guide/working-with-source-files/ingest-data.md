# Ingest Data

TDO can upload .csv files. To import data files, go to the ‘Data Management’ section of the menu, and select ‘Ingest Data’. This will open a list of all files that have been imported in your project.

<figure><img src="../../../../../.gitbook/assets/image (918).png" alt=""><figcaption><p>Ingest Data page</p></figcaption></figure>

To import a new file, click on the plus sign in the  lower right hand corner of the window.  The ‘Upload Data’ window will open.

On the top line, you will need to provide a name for your data block in TDO.  Since the same file can be imported multiple times, the data block name is the unique name that TDO will use to manage this file.  You can give it a new data block name, or you can use an existing data block name.  If you use an existing data block name, TDO will find the most recent version and increase the version number accordingly.

TDO will also perform a .csv validation on the file.  If there are any errors that need to be fixed, these will show as red boxes in the upper right section of the window.  If the file passes validation, a green box will show in the upper right corner.

<figure><img src="../../../../../.gitbook/assets/image (919).png" alt=""><figcaption><p>Upload Data window</p></figcaption></figure>

Some of the most common errors are in the column headers.  As stated in the introduction to this guide, all TDO objects must adhere to JSON naming conventions. This means that all column headers must be lower case only, underscore instead of space, no special characters.  Column headers must also not contain any leading spaces, and there cannot be any duplicate column names.&#x20;

Data rows are not subject to these rules.

Once imported, the file name will be shown at the bottom of the list of uploaded files.  Note that on this screen, the actual file name that was imported will be shown.

<figure><img src="../../../../../.gitbook/assets/image (920).png" alt=""><figcaption><p>Imported file name displayed</p></figcaption></figure>
