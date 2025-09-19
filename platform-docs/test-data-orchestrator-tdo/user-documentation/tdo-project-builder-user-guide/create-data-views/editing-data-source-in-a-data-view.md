# Editing Data Source in a Data View

One of the reasons for creating Data Views to hold the join criteria is to make the process of replacing the source data block simple. &#x20;

In the example below, we have imported a new version of the 'accounts' file.  TDO has version controlled this during the Ingest Files process and it is listed as 'accounts 1.1' in the data blocks screen.

To change the data block source in your data view, open the 'Edit Data View' window by clicking the blue pencil icon to the right of the data view name. &#x20;

Click on the blue pencil to the right of the 'source' field where the data block name 'accounts 1.0' is shown.  This will pop up a list of data blocks.  I've used the filter option to only show the data blocks starting with the letters 'acco'.

<figure><img src="../../../../../.gitbook/assets/image (882).png" alt=""><figcaption><p>Selecting a new data source</p></figcaption></figure>

Check the box to the left of the file you want to replace the existing file with ('accounts 1.1') and click 'Save' to update the data view source file field.

The data view is now pointed to the new source file.  Click 'Save' in the upper pane to save the changes to the data view.

<figure><img src="../../../../../.gitbook/assets/image (883).png" alt=""><figcaption><p>Updated data view</p></figcaption></figure>

Because the joins between the files are done in the data view, and not directly in the data block, you can update the source file this way.  As long as the new source file contains the same field names as those used in the join criteria, and any fields used during the data assembly process, the data view update will not impact any downstream operations.

{% hint style="danger" %}
If the new data block does not contain the exact same field names as those used in the join criteria, this will not work.
{% endhint %}
