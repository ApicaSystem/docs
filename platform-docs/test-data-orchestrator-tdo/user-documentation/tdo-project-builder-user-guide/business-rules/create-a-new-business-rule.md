# Create a New Business Rule

To create a new business rule, select ‘Business Rules’ from the ‘Coverage Engine’ section of the menu.  In the lower right corner, click on the plus (+) sign to create a new business rule.  This will open the ‘Create Business Rule’ window.

The attributes you selected in your coverage set will be populated on the left-hand side under ‘Determining Attributes’.  You must select one or more values for each attribute in the list to create a valid rule.

Click on the attribute name and a list of values for that attribute will populate in the center pane (‘Values’).  You can select one or more values by clicking on the value.  If you want to select all values in the list, click on the ‘Select All’ button at the top of the values list.  The values you have selected will show in the right-hand list (‘Selected’).&#x20;

If you selected a value in error, or want to change your selection, you can remove the value from the ‘Selected’ list by clicking on it.&#x20;

<figure><img src="../../../../../.gitbook/assets/image (930).png" alt=""><figcaption><p>Create Business Rule window</p></figcaption></figure>

If you set filters in your determining attributes, you will see the impact in the ‘Values’ list. In this case, we put a filter on ‘has\_app’ and ‘has\_online’ based on ‘customer\_type’. In this case, Corporate customers must have online enrollment. Here, the values list only displays ‘true’ for the ‘has\_online’ attribute based on our selection of ‘Corporate’ customer\_type.

<figure><img src="../../../../../.gitbook/assets/image (931).png" alt=""><figcaption><p>Filtered Determining Attributes in Values list</p></figcaption></figure>

When you have finished setting values for the Business Rule, click on the 'Set' button in the lower right-hand corner.  The completed rule will display in the Business Rules page.

<figure><img src="../../../../../.gitbook/assets/image (932).png" alt=""><figcaption><p>Completed business rule</p></figcaption></figure>

Note that you can have one or more business rules; each rule describes a test or set of tests with similar characteristics.  The rule shown above is for corporate accounts; in the list below one has been added for retail accounts.

<figure><img src="../../../../../.gitbook/assets/image (933).png" alt=""><figcaption><p>Multiple business rules</p></figcaption></figure>
