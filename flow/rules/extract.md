---
description: Creating and using EXTRACT Rules in Apica Ascent
---

# EXTRACT

### Creating an EXTRACT Rule in Apica Ascent

EXTRACT rule uses regular expressions to parse and extract certain labels from log events. Extract rules help convert unstructured event data, such as logs, to more structured data with well-defined labels.

#### To Add a New EXTRACT Rule

Open **Configure Pipeline**, click **Add Rule** under **Rules**, then select **EXTRACT**. Complete the shared fields and condition in [.](./ "mention").

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-18 15-00-05.png" alt=""><figcaption></figcaption></figure>

From here, you can define the fields that you want to extract and configure the rule to match your specific use case.

When you select **EXTRACT**, its form opens in **Pipeline Configuration**. The form is organized into logical tabs.

#### 3. Fill in Rule Details

In the **Details** tab:

* Specify the **Name**, **Group**, **Description**, and other required fields.
* Click **+ Add more parameters** to define matching conditions.

#### 4. Define the Extraction Pattern

* Enter a **regular expression** in **RE2** syntax in the Pattern field that the rule will use to match and extract the desired fields from your log data. After filling in all required details, click **Save** to create the **EXTRACT** rule.
* This expression should match the log structure and include named capture groups to extract values. We recommend testing your regex in `regex101.com`. Additionally you can validate the pattern by selecting the `Validate` button.

{% hint style="info" %}
Apica Ascent uses [re2 Regular expressions](https://github.com/google/re2/wiki/Syntax) for creating pattern expression, A sample expression for extracting ingress logs are mentioned below.
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

#### 5. Validate the Pattern

* Click **Use Sample Logs** → **Custom Logs**.
* Paste the following sample log data into the editor window. The preview updates automatically after every change.

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

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-18 19-10-40.png" alt=""><figcaption></figcaption></figure>

* Switch to the `Diff` tab in **Pipeline Preview** to view changes applied by the rule.

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-18 19-10-56.png" alt=""><figcaption></figcaption></figure>

#### 6. Use JavaScript for Advanced Transformations

EXTRACT rules support inline JavaScript. Use the `Event` object to manipulate fields or define custom fields. [Read Code Rule](code.md) for more details.

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
