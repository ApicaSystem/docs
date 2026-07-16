---
description: >-
  The CODE rule type enables a user to add the JavaScript code to enhance the
  logs.
---

# CODE

With the help of Code Block, add Code Rule to improve your pipelines. Code Rules takes in a JavaScript function that gets integrated with your pipeline.

With Code Rules add:

* Data Parsing Rules: These rules define how log data should be parsed to extract\
  relevant information. This includes defining regular expressions or specific patterns to identify log fields such as timestamp, log level, and message
* Data Validation Rules: Validation rules ensure that ingested log data meets certain\
  criteria or standards. For example, validating timestamps to ensure they are in the\
  correct format, checking for required fields, or filtering out invalid log entries.
* Data Transformation Rules: Sometimes, log data must be transformed into a\
  centralised system before ingestion. This could involve converting timestamps to a\
  standardised format, anonymizing sensitive information, or enriching log entries with additional contextual data.

Code Blocks is enriched with JavaScript code completion and syntax highlighting. Easily add or update your JS code by typing or importing a code file.

The Code Rule empowers users to create and execute custom scripts or rules for processing incoming logs. This flexibility allows for highly tailored log processing logic to be implemented, beyond what can be achieved with predefined rewrite or extraction rules. Users can leverage their programming skills to manipulate log data in sophisticated ways, enabling tasks such as complex data transformations, enrichment, filtering, or integration with external systems. This Rule offers advanced customization options for handling diverse log processing requirements.

### Built-in Variables and Functions <a href="#built-in-variables-and-functions" id="built-in-variables-and-functions"></a>

In the code environment, the following built-in variables and functions are available:

**Functions**

* `fetchSync(url, cfg)`: Makes a synchronous HTTP request to the specified endpoint.
  * **Arguments**:
    * `url`: The URL of the target endpoint.
    * `cfg`: Configuration object containing the method, headers, and body of the request.
  * **Returns**: The response from the target endpoint.
* `console.log(message)`: Logs messages to the console.
  * **Arguments**: `message` (string) - The message to log.
* For other functions, please look over the [functions](../functions/).

**Variables**

* **`Event`**: The incoming event to be processed by the CODE rule.
* `Clones` : Special list that allows for streaming rules to different namespaces, apps
  * Push your message in this list, and the message will be sent to the setup

{% hint style="info" %}
While the CODE rule is a special rule type, you can also use JavaScript code as part of other rule types, such as REWRITE and EXTRACT Rules for more complex rewrite/data extraction workflows. The available Built-in variables and [functions](../functions/) are the same for these rule types as well.
{% endhint %}

### To Add A Code Rule:

* Open the `Configure Pipeline` page of the desired pipeline. To know more about creating and editing pipelines, [click here](../pipeline-management/data-flow-pipelines-new.md).
* Hover over the `+ Add Rule` button.
* Select `CODE` from the rule type dropdown.
* A form organized into tabs should be created in the `Pipeline Configuration` section of the page.

<figure><img src="../../.gitbook/assets/image (1171).png" alt=""><figcaption></figcaption></figure>

* Enter the name and select a group for the Code rule

<figure><img src="../../.gitbook/assets/image (1197).png" alt=""><figcaption></figcaption></figure>

* Click on the `CODE` to switch to the code block

<figure><img src="../../.gitbook/assets/image (1195).png" alt=""><figcaption></figcaption></figure>

### Code block support for REWRITE and EXTRACT rules.

**REWRITE RULE:**

The Rewrite Rule is responsible for modifying log events by applying rules defined through regular expressions. These rules are used to mask or replace sensitive information within the logs, ensuring data privacy and security.

For example, it can replace credit card numbers, social security numbers, or any other sensitive data with placeholder values, thus anonymizing the logs while retaining their informational value.

Rewrite rule has an optional code field. Clicking on the toggle Code field, you can add or remove your code from your rule. Clicking on the import button, you can import the code file whose contents are immediately hydrated in the Code Block.

<figure><img src="../../.gitbook/assets/image (1192).png" alt=""><figcaption><p>Rewrite Rule with a Code Block</p></figcaption></figure>

**EXTRACT RULE:**

The Extract Rule parses and extracts specific labels or fields from unstructured log events using regular expressions. This process helps to convert raw log data into a more structured format by identifying and extracting key pieces of information.

For instance, it can extract timestamps, IP addresses, user agents, or any other relevant data points from log entries, facilitating easier analysis and categorisation of the logs.

Like REWRITE RULE, you can add an optional code field to your rule by clicking the toggle code button in the `CODE` tab in the EXTRACT rule form.

<figure><img src="../../.gitbook/assets/image (1196).png" alt=""><figcaption><p>Extract Rule</p></figcaption></figure>

**View CODE:**

In the Rules section, an option is available for viewing your code. You can filter rules according to your preference and examine their configuration by selecting the dropdown ('+' icon). To view the code for a specific code rule, locate the NodeJS icon within the dropdown description. Clicking on it will open a modal that displays the code in a read-only code block.

Please be informed that the code block is set to read-only mode. To modify the code, please proceed to the edit pipeline procedure.

<figure><img src="../../.gitbook/assets/image (1193).png" alt=""><figcaption><p>View Code</p></figcaption></figure>

```
// if(Event.AppName=="appERP") {
//	Event.copyOfAppName="appERPData"
// } this new code block
Event.masked_host = ascent.encode.b64(Event["kubernetes.host"]);
Event.formatted_time = ascent.time.strftime(Event.date, "01/02/2006 15:04:00");
Event["kubernetes.host"] = ascent.mask.REDACTED;
Event.region = ascent.variables.get("REGION");
Event.encrypted = ascent.crypto.aes("10").encrypt("ToEncrypt");
Event.decrypted = ascent.decode.b64(ascent.crypto.aes("10").decrypt(Event.encrypted));
const errors = ascent.lookups.get("0196f2dc-d1ee-7f41-9a62-ea6fa5df6775", "Error");
Event.err = errors[0];
ascent.persist.set("monitorying-app","ascent")
Event.monitoringApp = ascent.persist.get("monitorying-app")
```

### Testing code rule output

The built-in Preview functionality allows a user to test a code rule before making it permanent. Click on the Preview button to launch the code transformation preview window.

You can test code updates directly within the app with the `Diff` view in the `Pipeline Preview` section of the `Configure Pipeline` page. Simply provide a code snippet to update the log object, and instantly visualize the differences with our intuitive JSON compare view. Highlighted lines indicate changes, making it easy to review modifications at a glance. This feature not only streamlines the testing process but also empowers you to confidently manage updates to your log object.

<figure><img src="../../.gitbook/assets/image (1195).png" alt=""><figcaption></figcaption></figure>

### Additional examples

This is an example of how you can grab epoch date values and convert it into normal date time:

<figure><img src="../../.gitbook/assets/image (22).png" alt=""><figcaption></figcaption></figure>

```
if (Event.date) {
    var epoch = parseFloat(Event.date);

    if (!isNaN(epoch)) {
        var normalDate = new Date(epoch * 1000).toISOString();

        Event.date = normalDate;
    }
}
```



This is an example of how you can extract parts of your log message:

<figure><img src="../../.gitbook/assets/image (23).png" alt=""><figcaption></figcaption></figure>

```
// CODE rule: extract productId + question from Message, add to StructuredData
// Message shape: Receive AskProductAIAssistant for product id:<ID>, question: <TEXT>

const msg = Event.message || "";

// product id: everything after "product id:" up to the comma
const idMatch = msg.match(/product id:\s*([^,]+?)\s*,/i);

// question: everything after "question:" to end of line
const qMatch = msg.match(/question:\s*(.+)$/i);

if (idMatch) {
  Event.extractProductId = idMatch[1].trim();
}

if (qMatch) {
  Event.extractedQuestion = qMatch[1].trim();
}
```
