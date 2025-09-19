# Boolean Formats

Boolean formatting can be used to transform values into a Boolean true/false output or to create Boolean output using logic rules.  The options for Boolean output are listed in the table below.

&#x20;To use these functions, the target field in the output format file should be defined as ‘Boolean’.

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">EXAMPLE</td><td valign="top">RESULT</td></tr><tr><td valign="top">%B|1</td><td valign="top">true</td></tr><tr><td valign="top">%B|0</td><td valign="top">false</td></tr><tr><td valign="top">%B|y</td><td valign="top">true</td></tr><tr><td valign="top">%B|n</td><td valign="top">false</td></tr><tr><td valign="top">%B|yes</td><td valign="top">true</td></tr><tr><td valign="top">%B|no</td><td valign="top">false</td></tr><tr><td valign="top">%B|true</td><td valign="top">true</td></tr><tr><td valign="top">%B|false</td><td valign="top">false</td></tr></tbody></table>

&#x20;

You can use logical conditions to set these formats. To use values from the coverage matrix, or a prior field in the same or a prior step, you can set conditional rules governing when to assign a specific value.  In the example shown below, we have used the ‘channel’ field to set the value for the following field.  Both conditions, and the associated rules, are shown.

&#x20;Using conditional rules (logic) to set Boolean values is the most common way of using this formatting function, as it sets the value based on a prior condition.

<figure><img src="../../../../.gitbook/assets/image (822).png" alt=""><figcaption><p>Example 1: using logic to set Boolean values</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/image (823).png" alt=""><figcaption><p>Example 2: using logic to set Boolean values</p></figcaption></figure>

The value assigned to the field is based on the assigned value in the prior field, from the business  rules.

&#x20;Note that if the field is not defined as a ‘boolean’ format in the output file, this format function will not work.

<figure><img src="../../../../.gitbook/assets/image (824).png" alt=""><figcaption><p>Boolean output for 'direction' field set using Boolean format and logic</p></figcaption></figure>
