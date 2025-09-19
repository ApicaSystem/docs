# Assign a Value from the Coverage Matrix

To begin the assignment process, select 'Assignment Rules' from the 'Data Assembly' section of the menu.  This will open the Assignment Rules page in TDO.

<figure><img src="../../../../../.gitbook/assets/image (825).png" alt=""><figcaption><p>Assignment Rules main page</p></figcaption></figure>

In the left pane the steps from the scenario are listed.  Click on the first step and the list of fields from the output format linked in the action will populate in the center pane. Click on the first field to create a rule for that field.&#x20;

<figure><img src="../../../../../.gitbook/assets/image (826).png" alt=""><figcaption><p>List of output fields in the selected step</p></figcaption></figure>

In the right pane, under the label 'Rules', there is a plus (+) sign and a trash can.  The plus sign will create a new rule, and the trash can will delete a highlighted rule.  Click the plus sign to create a new rule and the rule name (field\_rule\_mongoID) will populate in the 'Rules' box.

{% hint style="warning" %}
The rule container shown below is reserved in the database, but will not be saved until you create a rule for that container.  If you leave this page or click a different field name before creating a rule, this container will be lost and will need to be recreated.
{% endhint %}

<figure><img src="../../../../../.gitbook/assets/image (827).png" alt=""><figcaption><p>Rule name container created</p></figcaption></figure>

Click on the rule name in the 'Rules' pane and two new panes will open in the lower half of the window.  The left pane ('Conditions') will be covered in the 'Assigning a Value using Conditions' section later.  For now we will focus on the right hand section, 'Operands'.  This pane shows all rules  assigned to the selected rule container. To create a new rule, click on the 'Compose' button at the bottom of the Operands window.

<figure><img src="../../../../../.gitbook/assets/image (828).png" alt=""><figcaption><p>Conditions and Operands windows</p></figcaption></figure>

This will open the 'Compose Operands' window.  This window has four main sections.  The upper left pane, labeled 'Sources' contains a list of all of the data views from the workset.  This will also contain a list of any steps from this scenario that have data assignment rules completed; the 'request\_step' does not show yet because we have not created the first rule.  In this pane, select the coverage view (first one listed) as that is the view we will select data from.

Selecting a view will populate the center pane ('Attributes') with a list of the fields in that data view.  We are populating the 'channel' value in this field, so we will click on the field name 'channel' in the center pane.  This will populate the name of the data view and field in the right hand ('Operators') pane.  The first line in this pane ('Operators') is the action we want the rule to complete.  In this case, we want it to assign the value selected to the field we are working on.  Other options from this list will be show in the calculation and concatenation sections.  The second line ('Function') is prepopulated with 'No Function'.  We will not change that for this rule; this field will be addressed in the 'Assigning a Vaule using a Format Function' section.

Once the field name is populated in this pane, click on the blue plus (+) sign below the field name in that pane.  This will populate the bottom pane ('Operands') with the Operator (Assign - Apply), the Function (blank, for none selected), and the Reference Attribute/Value (view\_name.field\_name).

The rule creation is complete. Click the 'Save' button in the bottom right corner of the window to save the rule.

<figure><img src="../../../../../.gitbook/assets/image (829).png" alt=""><figcaption><p>Creating an assignment rule</p></figcaption></figure>

When you save the rule, the bottom right (Operands) pane of the Assignment Rules window now displays the rule that was created.

<figure><img src="../../../../../.gitbook/assets/image (830).png" alt=""><figcaption><p>Field with assignment rule</p></figcaption></figure>
