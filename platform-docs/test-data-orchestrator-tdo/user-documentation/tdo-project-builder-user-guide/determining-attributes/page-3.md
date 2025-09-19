# Filtering Determining Attributes

You can filter values against any other field in the same file.  In the files shown here, you can filter account currency by account type (since both are in the accounts data block).  You can filter the has\_app and has\_online attributes by customer type, as both are in the customers data block.  However, you cannot filter account type by customer type, since they are in two separate data blocks.

{% hint style="info" %}
You can create a consolidated data set when you are using TDX (see [TDX User Guide](../../user-guide-for-tdx/)) to extract data, as long as both schemas are in the same database.  E.g., if you had 'Customers' and 'Accounts' in the same database, you could extract both customer and account data and bring them into TDO as a single data block.  In this case it would be possible to group account type by customer type.
{% endhint %}

Filtering helps to prevent invalid data combinations from being selected by end users.

To create a filter, click on the pencil by the determining attribute name to open the ‘Edit Determining Attribute’ window.  (We are editing the ‘currency’ determining attribute.) Scroll down to the ‘Criteria’ section of the window (below the values section).  A list of all of the fields available for filtering will be shown.  We want to filter by  ‘account\_type’ so go to that line, and then select  ‘account\_type’ from the drop-down list on the right.&#x20;

<figure><img src="../../../../../.gitbook/assets/image (897).png" alt=""><figcaption><p>Setting a Determining Attribute filter</p></figcaption></figure>

Scroll up and click the ‘Save’ button to save the filter criteria. (In this use case, some account types are only offered in USD, but others are offered in all supported currencies.)

The impact of setting a filter is seen in the Business Rules section of TDO.  In this case, when you select an account type in your business rule, the currency values available for selection will be filtered to only display those that are available for your selected account type. &#x20;
