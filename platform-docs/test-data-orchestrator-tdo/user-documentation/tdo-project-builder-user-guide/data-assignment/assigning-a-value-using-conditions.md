# Assigning a Value using Conditions

Sometimes the decision of what value to assign is a logical decision that is made based on other values in the coverage matrix.  In this use case, the 'direction' field will be assigned based on the channel field value in the coverage matrix.

To create a conditional rule, click on the field in the center pane, then click the plus sign in the right pane to create a new rule.

<figure><img src="../../../../../.gitbook/assets/image (845).png" alt=""><figcaption><p>Beginning a conditional rule</p></figcaption></figure>

Because this is a conditional rule, we will first create the condition.  For our use case, the test conditions are:

* If channel = MOBILE then direction = OUTBOUND
* if channel = ONLINE then direction = INBOUND
* if channel = BRANCH then direction = INBOUND

We will build the rule for the first condition.  Click on the 'Compose' button in the lower left 'Conditions' pane to open the 'Compose Conditions' window.  You will notice that only two data sources are available in this window - the coverage data view, and the current step.  We can only use the Coverage Matrix or assigned values to create conditions.  Click on the data source (the coverage matrix data view in this case) and then on the 'channel' field in the center 'Attributes' pane.  In the left pane, the top line contains the comparison condition (here, we will use 'Equal').  The next line ('Value') is auto populated with the values in the coverage matrix. You can click on one of the value(s) listed, or you can type a value into the line manually.  Click the blue plus (+) sign in the upper right corner of the pane to apply the condition.  Then click the 'Save' button in the lower right corner to save the condition.

<figure><img src="../../../../../.gitbook/assets/image (846).png" alt=""><figcaption><p>Creating  a condition</p></figcaption></figure>

Once the condition is saved, it will display on the main assignment rules page when you have the rule selected.

<figure><img src="../../../../../.gitbook/assets/image (847).png" alt=""><figcaption><p>Condition set for assignment rule</p></figcaption></figure>

Now that we've defined the condition - the 'IF' statement - we need to tell TDO what value goes with that condition.  We will assign a fixed value to this field ('OUTBOUND') - see the 'Assign a Fixed Value' section for details on that process.  The completed rule now has an 'IF' condition in the lower left pane and a 'THEN' condition in the lower right pane.

<figure><img src="../../../../../.gitbook/assets/image (848).png" alt=""><figcaption><p>Completed conditional rule</p></figcaption></figure>

We now have one conditional rule.  At this point, any row in the coverage matrix with the channel 'MOBILE' will have the value 'OUTBOUND' assigned as the direction but any other value in the channel field will be blank in the direction field. &#x20;

We could create two more rules - one for the ONLINE channel and one for the BRANCH channel, but since all channels that are not MOBILE have the same direction (INBOUND) we can do this with one rule.

In the top right pane, click the plus sign to create a new rule.  Click on that rule name and then click 'Compose' in the 'Conditions' pane on the lower left.  Again, click on the coverage matrix data view in the left pane, then on the channel field in the center pane, and on MOBILE in the right pane.  On the top line of the right pane, click on the down arrow on the right and select 'Not Equal' from the conditions list.  Click on the plus sign in the upper right of the Values pane to set the condition and then on the 'Save' button in the lower right corner to save the condition.

<figure><img src="../../../../../.gitbook/assets/image (849).png" alt=""><figcaption><p>Changing operators in conditions</p></figcaption></figure>

The new rule condition now displays in TDO.  In the lower right pane, we have composed a different assignment rule (assign the value INBOUND to the direction field). The final rule is shown below.

<figure><img src="../../../../../.gitbook/assets/image (850).png" alt=""><figcaption><p>Field with conditional rules for data assignment</p></figcaption></figure>
