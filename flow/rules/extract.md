---
description: Creating and using EXTRACT Rules in Apica Ascent
---

# EXTRACT

### Creating an EXTRACT Rule in Apica Ascent

To configure field extraction from log messages, follow the steps below to create an **EXTRACT** rule within a pipeline.

EXTRACT rule can help you convert unstructured logs into structured logs by using regex with re2 syntax.

#### 1. Navigate to the Configure Pipeline

* Go to the pipeline where you want to apply the rule.
* Click on `Configure Pipeline` from the pipeline’s action menu.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-21 17-48-48.png" alt=""><figcaption><p>Pipeline List view</p></figcaption></figure>

#### 2. Add a New EXTRACT Rule

* Hover over the `+ Add Rule` button.
* Select `EXTRACT` from the rule type dropdown.
* A modal will open with a form organized into tabs.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-21 17-57-39.png" alt=""><figcaption><p>Create Rule</p></figcaption></figure>

From here, you can define the fields that you want to extract and configure the rule to match your specific use case.

When you select the **EXTRACT** rule, a new form will appear on the left side of the modal. The form is organized into tabs based on logical groupings.

#### 3. Fill in Rule Details

In the **Details** tab:

* Specify the **rule name**, **description**, and other required fields.
* Click `+ Add More Parameters` to define matching conditions.&#x20;

Example:

```
Message =~ my-app
```

This ensures the rule is applied only to logs containing specific patterns.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-21 18-06-10.png" alt=""><figcaption></figcaption></figure>

#### 4. Define the Extraction Pattern

* Enter a **regular expression** in **RE2** syntax in the Pattern field that the rule will use to match and extract the desired fields from your log data. After filling in all required details, click **Save** to create the **EXTRACT** rule.
* This expression should match the log structure and include named capture groups to extract values. We recommend testing your regex in `regex101.com`. Additionaly you can validate the pattern by selecting the `Validate` button.

{% hint style="info" %}
Apica Ascent uses [re2 Regular expressions](https://github.com/google/re2/wiki/Syntax) for creating pattern expression, A sample expression for extracting ingress logs are mentioned below.&#x20;
{% endhint %}

**Example RE2 Pattern (Ingress Logs):**

```regex
^(?P<timestamp>\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d+Z)\s+(?P<level>[A-Z]+)\s+\[(?P<app>[^\]]+)\]\s+\[pod=(?P<pod>[^\],]+),\s*namespace=(?P<namespace>[^\],]+),\s*environment=(?P<environment>[^\]]+)\]\s+(?P<message>.+)$
```

This pattern extracts the following fields:

* `timestamp`
* `level`
* `app`
* `pod`
* `namespace`
* `environment`
* `message`

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-21 18-34-23.png" alt=""><figcaption><p>EXTRACT RULE PATTERN</p></figcaption></figure>

#### 5. Validate the Pattern

* In the modal, navigate to the right panel.
* Click **Use Sample Logs** → **Custom Logs**.
* Paste the following sample log data into the editor window and click `Preview`

Sample Raw logs:

```json
[
    {
        "message": "2025-05-13T12:29:00.123456789Z INFO [my-app] [pod=my-app-abcd-12345, namespace=default, environment=production] Request received for delete rule"
    },
    {
        "message": "2025-05-13T14:29:00.123456789Z INFO [my-app] [pod=my-app-abcd-12345, namespace=default, environment=development] Request received for get rule"
    }
]
```

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-21 18-29-59.png" alt=""><figcaption><p>Preview Editor</p></figcaption></figure>

* Click **Preview** to confirm that fields are correctly extracted.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-22 12-24-42.png" alt=""><figcaption><p>Matching Expression</p></figcaption></figure>

Verify the extracted fields from the raw message.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-21 19-01-41.png" alt=""><figcaption><p>Logs Details</p></figcaption></figure>

Change the expression not to match the logs, save pipeline and click preview

```
Message !~ my-app
```

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-22 12-24-42 (1).png" alt=""><figcaption><p>Non-Matching Expression</p></figcaption></figure>

Select any log from the logs and observe the extracted fields. No fields were extracted due to a non-matching expression.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-22 12-52-41.png" alt=""><figcaption><p>No Fields Extracted</p></figcaption></figure>

#### 6. Use JavaScript for Advanced Transformations

EXTRACT rules support inline JavaScript. Use the `Event` object to manipulate fields or define custom fields. [Read Code Rule](code.md) for more details. For example:

```javascript
if (Event.AppName == "appERP") {
  Event.copyOfAppName = "appERPData";
}
```

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-21 19-15-09.png" alt=""><figcaption><p>Code</p></figcaption></figure>

Save pipeline and click preview to verify the new field added

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-21 19-18-07.png" alt=""><figcaption><p>New Field</p></figcaption></figure>

#### 8. Save and Apply the Rule

* Once all fields are configured and validated, click **Save**.
* The rule will be applied to incoming log lines that match the defined criteria.
* Extracted fields will be available for filtering, visualization, and alerting.

#### 9. Use Pre-Built Rules (Optional)

Apica Ascent also provides pre-configured EXTRACT rules for commonly used log formats such as:

* IIS Logs
* Kubernetes Ingress Logs
* AWS VPC Flow Logs

These can help you get started quickly without writing custom patterns.
