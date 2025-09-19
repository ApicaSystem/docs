# Assign a Value from a Prior Rule

Values that have been created in data assignment rules previously are available along with the data in the data views.

In this example, we will use the 'currency' value from the request step to populate the 'account\_currency' field in the response step. &#x20;

To begin, select the step and field on the main 'Assignment Rules' page and create a rule container.  Click 'Compose' in the Operands page to open the Rules page.

<figure><img src="../../../../../.gitbook/assets/image (833).png" alt=""><figcaption><p>Selecting the rule to create</p></figcaption></figure>

In the left hand pane (Sources) the step(s) will be shown below the data views.  Here, we will select 'request\_step' and then the 'account\_currency' field from that step in the center pane (Attributes).  Once the field name populates in the right hand pane, click the blue plus sign to move it to the Operands section in the lower pane.  Click the 'Save' button to save the rule.

<figure><img src="../../../../../.gitbook/assets/image (834).png" alt=""><figcaption><p>Using a field from a step to assign a value</p></figcaption></figure>
