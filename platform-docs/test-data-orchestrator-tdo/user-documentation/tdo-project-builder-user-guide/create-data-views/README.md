# Create Data Views

Data Views are how TDO ‘joins’ the different data blocks containing data to the coverage matrix and to each other.  They are similar to WHERE or JOIN statements in SQL.  Data views are used in the Work Set to identify where data should come from and how it is joined/linked.

{% hint style="warning" %}
When a coverage matrix is created for the first time, TDO will automatically create the associated coverage set and source file data views.  Note that these views will only link fields in the data views where the names of the fields are the same as the determining attribute names used in the coverage set. &#x20;

You should review all of these data views to make sure that the links are appropriate, add any missing links, and delete any incorrect links.
{% endhint %}

You can also manually create a Data View using your Coverage Set/Coverage Matrix.  This is the main data view, as it links to the business rules directly.  The instructions in the remainder of this manual section cover the manual creation and editing processes.

{% hint style="info" %}
Every Work Set must have a Data View linked to the coverage set.  You will probably have at least one more data view in the work set linked to an ingested data block.
{% endhint %}

It is important that your data views are created in the right sequence - i.e., the file that is serving as the reference/lookup file must have it's view created first.  So the Coverage Set data view is always the first data view created.

Also note that you can use the same file for multiple data views.  This is sometimes needed when using the same values for multiple different lookups.
