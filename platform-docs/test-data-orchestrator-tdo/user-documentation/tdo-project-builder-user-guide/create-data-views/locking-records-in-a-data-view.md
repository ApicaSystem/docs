# Locking Records in a Data View

TDO will automatically select the first available record that matches the join criteria in the data views unless you 'Lock' the records.

A Lock will prevent data reuse and will assign each record in the locked data block only once.  To re-use the data in the data block, you will have to remove the lock and run data assembly once, then put the lock back on.  To replace the data in the data block with a new file, see 'Editing Data Source in a Data View'.

A Lock can be placed when creating a data view or can be done later by editing the data view. &#x20;

{% hint style="info" %}
If you are in the build phase, it is recommended that you do not set the Lock until you have completed creating and testing your data assembly rules.  Using the Lock feature during testing will result in test data getting 'used' during the rule development phase.
{% endhint %}

To edit the data view, hover to the right of the data view name and click on the blue pencil icon.  The 'Edit Data View' window will open.  Below the 'Criteria' section is a list of the fields in the source data block.  To the right of the field names is a column with the header 'Locked'.  To lock this file by account number, we have checked the 'Locked' box next to the 'account\_num' field.  This will ensure that each account number is used only once.  Click the 'Save' button to save the lock on the data view.

<figure><img src="../../../../../.gitbook/assets/image (881).png" alt=""><figcaption><p>Data view with data lock set</p></figcaption></figure>
