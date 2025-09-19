# Assign a Value using String Concatenation

To begin, select the field you will be working with and create the rule container.  Click 'Compose' in the 'Operands' pane to open the Rule page.

When concatenating strings, you can use fields from data views, fixed values, spaces and special characters, and functions to create the final string.  This example is to create a transaction ID for the response message.

Mathematical operators are available to use from the 'Operator' line in the 'Operators' pane.  Click on the down arrow to the right of this line to see the available operators.  While most of these are purely mathematical operators for fields defined as Number, the first two are also String operators.

Assign - Apply will always be used for the first field.  Add, when working with a string field, also acts as a Concatenate operator.

In the example below, we are building a field that contains multiple codes in a specific format for a file coming in from an external web site.  The field standard is ':RET:9999-9^:RET:9999-9.  In this case, the numeric codes are coming from a look up table, and the remainder is a fixed value.  So the rule is set up to concatenate these values in the format 'string+field+string+field'.

<figure><img src="../../../../../.gitbook/assets/image (843).png" alt=""><figcaption><p>Concatenating multiple fields and values using the 'ADD' operand</p></figcaption></figure>

When assembled, the output of this field is shown below.

<figure><img src="../../../../../.gitbook/assets/image (844).png" alt=""><figcaption><p>Assembled data from a concatenation rule</p></figcaption></figure>
