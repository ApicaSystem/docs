# REWRITE

If your incoming log data contains Personally Identifiable Information (PII) or other sensitive data, you may need to redact or replace that data to comply with data security regulations or meet your business needs. With Apica Ascent, you can create custom Rewrite Rules using regular expressions to match patterns in your incoming data stream and mask or replace these patterns.

Apica Ascent uses [re2 Regular expressions](https://github.com/google/re2/wiki/Syntax) for creating pattern expressions. A sample expression for extracting ingress logs is mentioned below.

Rewrite Rule also lets you give a piece of JavaScript code to access the log as an 'Event' object in its scope. Read Code Rule for more details.

### Example: Removing names and phone numbers from log data

In this example, assume that the following lines of data are from an incoming log data stream.

```
2021-08-28 01:34:55.001Z Jane Smith phone number : (408) 555-1212
2021-08-29 01:34:55.002Z Raj Singh local phone number => 206-555-1212
2021-08-30 01:34:55.003Z Tim White office phone number is 408121324
```

You notice that the data you are ingesting includes names and respective US phone numbers that fall under PII. To mask these names and US phone numbers from incoming data, you can use Apica Ascent to create the following regular expression to sample and match incoming data.

```
^(?P<name>\w+\s+\w+)\s+(?P<p1>.*)phone number(?P<p2>.*)\s(?P<phone>\D*\d{3}\D*\d{3}\D*\d{4})\s*$  
```

The regular expression above produces the following capture groups.

* \`$name\`
* \`$p1\`
* \`$p2\`
* \`$phone\`

The rewrite rule for replacing names and phone numbers in the above sample log data is as shown below.

```
XXX-Name ${p1}phone number${p2} XXX-XXX-XXXX
```

The rewrite rule replaces `$name` and `$phone` among these groups while retaining `$p1` and `$p2`, providing the log data with redacted PII as the output, as shown below.

```
2021-08-28 01:34:55.001Z XXX-Name phone number : xxx-xxx-xxxx
2021-08-29 01:34:55.002Z XXX-Name local phone number is xxx-xxx-xxxx
2021-08-30 01:34:55.003Z XXX-Name office phone => xxx-xxx-xxxx
```

It is crucial to be mindful of the context of the regular expression you create for your incoming log data. In the example above, the incoming log data and the created regular expression contain the string "phone number". If you used a non-contextual regex that only matches and replaces numerical patterns, like the following example, you might end up substituting numbers in your log data that are not necessarily phone numbers.

```
(?p<phone>\D*\d{3}\D*\d{3}\D*d{4})
```

{% hint style="info" %}
**Note**: For more information on RE2 search and replace syntax and best practices, do read the [RE2 documentation](https://qinwenfeng.com/re2r_doc/#2_replace_a_substring).
{% endhint %}

### Creating a PII masking rule via the UI

* Open the `Configure Pipeline` page of the desired pipeline. To know more about creating and editing pipelines, [click here](../pipeline-management/data-flow-pipelines-new.md).&#x20;
* Hover over the `+ Add Rule` button.
* Select `REWRITE` from the rule type dropdown.
* A form organized into tabs should be created in the `Pipeline Configuration` section of the page.

<figure><img src="../../.gitbook/assets/image (1171).png" alt=""><figcaption></figcaption></figure>

To configure your rewrite rule, do the following.

1. Provide a **Name** for your rule.
2. Select a **Group**.
3. Provide a **Description** of the rule.
4. Provide your **Match** and **Rewrite** expressions to rewrite on the message field.
5. To rewrite field value, Enter/Select the field to be masked under the `Choose fields to mask their values`. Optional replacement value can also be mentioned, but the default value that will be applied is `*****`.
6. Optionally, add more Parameters as a filter on which this rule must be applied to in the selected data-flow.
7. Click **SAVE**.

<figure><img src="../../.gitbook/assets/image (1161).png" alt=""><figcaption></figcaption></figure>

Your new rewrite rule has been created. Your new rule will apply to all incoming log data for the selected namespace, look for patterns within the log data that match the match expression, and rewrite log data as per the rewrite expression.

Apica Ascent offers many built-in rules for obfuscating sensitive information like credit card numbers, SSN, phone numbers, and many more.

<figure><img src="../../.gitbook/assets/image (1191).png" alt=""><figcaption></figcaption></figure>
