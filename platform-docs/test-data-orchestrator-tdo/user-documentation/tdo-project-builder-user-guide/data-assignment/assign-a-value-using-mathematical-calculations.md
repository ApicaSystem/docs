# Assign a Value using Mathematical Calculations

TDO can also perform mathematical calculations as part of a data assignment rule.

In the example below, we are calculating a fee based on a payment amount.

The calculation for the rule is 'payment amount x fee percentage' and the output is rounded to 2 digits.  This rule is created by creating a rule container for the 'fee' field, and then opening the 'Compose' window for that rule.  First, the payment amount is assigned to the rule.  Then the Operator of 'Multiply' is selected, and the field 'fee' from the 'fee\_view' is selected.  This is then added (click the plus sign) to the Operands list.

<figure><img src="../../../../../.gitbook/assets/image (840).png" alt=""><figcaption><p>Creating a mathematical calculation rule</p></figcaption></figure>

Finally, the Operator 'Round' is selected, an a value of '2' assigned.  ('Round' will round the amount to the right of the decimal point to the number of digits specified.)  The full rule is shown below.

<figure><img src="../../../../../.gitbook/assets/image (841).png" alt=""><figcaption><p>Completed rule for mathematical calculations</p></figcaption></figure>

When assembled, the data output is shown below.

<figure><img src="../../../../../.gitbook/assets/image (842).png" alt=""><figcaption><p>Output of calculated field</p></figcaption></figure>
