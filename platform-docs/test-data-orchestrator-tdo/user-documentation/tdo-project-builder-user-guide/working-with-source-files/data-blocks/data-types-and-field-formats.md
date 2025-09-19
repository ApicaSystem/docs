# Data Types and Field Formats

All data is brought into TDO as ‘String’ data type.  You have the option to set data types of ‘Number’, ‘Date’ and ‘Boolean’. in addition to 'String'.  To set the ‘balance’ field to a ‘Number’ data type, and apply a format mask that includes 2 decimal points, click on the field in the lower left pane.  In the lower right pane, click on the drop down under ‘Data Type’ and select ‘Number'.  In the ‘Patterns’ space, immediately below ‘Data Type’, type in the format mask – in this case, ‘#####0.00’.  Once this is done, click ‘Apply’ to set the format.

You can set a data type without applying a field format, and you can apply a field format without setting a data type.  For more details on formats supported in TDO, you should reference the ‘Format Functions Guide’ section of the online manuals or the help menu in TDO.

<figure><img src="../../../../../../.gitbook/assets/image (923).png" alt=""><figcaption><p>Structure Manager with a data type and format mask applied</p></figcaption></figure>

{% hint style="danger" %}
Please note that you are working with .csv files.  You should never set a number field with a mask that contains commas, as those are interpreted as field delimiters.
{% endhint %}

Once you have completed editing the file (ie, setting determining attributes and data types/field formats) click on ‘Save’ in the upper pane to complete the file validation process.

In the data block list, the data block will now show ‘true’ under the ‘Validated’ column, along with the user ID who performed the validation and the date it was completed.

<figure><img src="../../../../../../.gitbook/assets/image (924).png" alt=""><figcaption><p>File validation completed</p></figcaption></figure>

Before moving onto the next step, complete the validation process for all ingested data blocks.  Note that, even if you are not making any changes to the file, you need to open the file and save it to validate that file.  In this case, you are confirming that all fields in the file are strings, there are no determining attributes sourced from that file, and no special formats are needed.

If you are going to perform any mathematical calculations during data assignment, you need to set all of the fields involved in the calculations to ‘Number’ data types.  Dates can be set to ‘String’ or ‘Date’.  Boolean fields (values of only Y/N, True/False, 0/1 that are used in a logical comparison) should be set to ‘Boolean’.
