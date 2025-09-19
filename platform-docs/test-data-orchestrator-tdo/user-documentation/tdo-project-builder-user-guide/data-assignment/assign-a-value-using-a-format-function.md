# Assign a Value using a Format Function

Format functions can be used to create data synthetically, in multiple formats.  To see the options available, you can view the 'Format Functions' section of the Help menu in TDO or the 'Format Functions Guide' in the online documents.

In this example, we are going to assign a date 3 days prior to the current date to our 'value\_date' field in the output file.  We are going to specify a format of MM-dd-yyyy for this date. &#x20;

{% hint style="warning" %}
Format indicators are very specific for these functions. Prior to using format functions, you will need to review the documentation recommended above to ensure that you use the right format indicators.  Upper and lower case are also critical indicators - for instance, M is used for 'Month' and m is used for 'minutes'.
{% endhint %}

To create the rule, begin as with the other instructions above by selecting the field, creating the rule container, and clicking 'Compose' in the Operands section to open the Rules window.  Since we are using the Format Functions, we can ignore the 'Sources' and 'Attributes' panes.  This is still 'Assign - Apply' so the first line in the 'Operators' section can be left alone.  On the second line, 'Functions', click the down arrow and select Compose Function.  This tells TDO that the value on the third line is a function and a mask for the formatted output.

<figure><img src="../../../../../.gitbook/assets/image (836).png" alt=""><figcaption><p>Assignment rule with Format Function applied</p></figcaption></figure>

Functions consist of a function call (%DR in this case) and then the data mask (MM-dd-yyyy) and then the mathematical operator (-3).  Each portion of the function is separated by a pipe (|) delimiter.  So our function of %DR|MM-dd-yyyy|-3 translates to 'create a date in this format that is three days less than today'. &#x20;

{% hint style="warning" %}
In TDO, %DR is the function for 'date range' and %D is the function for 'date'.  Because we are doing date math, we want to use the 'date range' function and not the 'date' function.  Using the 'date' function will always return the current date while the 'date range' function will allow the date to be varied.  This is an example of why reading the help section on Format Functions is critical before using these functions.
{% endhint %}

Using a Format Function for dates will always ensure that your dates remain valid without having to manually change the data in the rule each time you run data assembly.

Once the function is defined, click the plus sign to move it to the 'Operands' section and then click 'Save' to save the rule.

After the data is assembled (see 'Data Assembly' section) you can view the data assigned to each row in the coverage matrix.  In the example below, you can see the date has been set to '05-01-2025' based on this format function.

<figure><img src="../../../../../.gitbook/assets/image (837).png" alt=""><figcaption><p>Data assigned to coverage matrix</p></figcaption></figure>

{% hint style="info" %}
If you edit an assignment rule with a format function applied, TDO will default to 'No Function' on the function line and you will have to re-select 'Compose Function' before editing the function.
{% endhint %}

Format functions can be used alone or with other format functions.  In the example below, we are creating a transaction ID using the string 'TRN', the current date, and a randomly generated 4 digit sequence number.

In this case, the format functions are separated by pipe delimiters.

<figure><img src="../../../../../.gitbook/assets/image (838).png" alt=""><figcaption><p>Using multiple format functions in a single rule</p></figcaption></figure>

The three components of this rule are:

* %S|TRN| - assigns the string 'TRN'&#x20;
* %D|MMddyy| - assigns the current date in MMDDYY format
* %NR|###0|1000 - 9999| - assigns a randomly generated number in the format 0000 (no commas) that is between 1000 and 9999

When assembled, the output for this field looks like this.

<figure><img src="../../../../../.gitbook/assets/image (839).png" alt=""><figcaption><p>Output for multiple formats in a single rule</p></figcaption></figure>
