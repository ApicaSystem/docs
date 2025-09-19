# Create a Determining Attribute from a Data Block

To see a more detailed explanation of determining attributes, see the ‘Determining Attributes’ section of this guide.  What is important to know here is that you should only set a determining attribute on a field that does not contain unique values.  In this file, for instance, you would not set a determining attribute on the ‘account\_num’ field, as each row  contains unique data.  Fields such as ‘account type’ and ‘currency’, however, are good candidates for a determining attribute, as these are values that can be used to select an account for testing.

To create a determining attribute, click on the field name in the lower left panel.  This will show the settings for that field in the lower right panel.  In the bottom section, click on the check box for ‘Determining’ and click ‘Apply’ to set the determining attribute.  TDO will return a message to indicate that the action was successful, and a check mark will replace the check box.

<figure><img src="../../../../../../.gitbook/assets/image (922).png" alt=""><figcaption><p>Structure Manager window with Determining Attribute set</p></figcaption></figure>
