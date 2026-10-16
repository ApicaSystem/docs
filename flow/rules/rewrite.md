---
description: Use RE2 regular expressions to match, mask, or replace log content.
---

# REWRITE

If your incoming log data contains personally identifiable information (PII) or other sensitive data, you may need to redact or replace it. This helps meet security requirements and business needs. A rewrite rule uses regular expressions to match log content, then replaces or masks the matching content.

Apica Ascent supports [RE2 regular expressions](https://github.com/google/re2/wiki/Syntax) for these match patterns.

A rewrite rule can also use JavaScript to access the log as an `Event` object. For details, see the Code rule documentation.

### Example: Masking selected PII values in log data

In this example, the following data comes from an incoming log stream.

```
[
 { "message": "2021-08-28 01:34:55.001Z Jane Smith phone number : (408) 555-1212"},
 { "message": "2021-08-29 01:34:55.002Z Raj Singh local phone number => 206-555-1212"},
 { "message":  "2021-08-30 01:34:55.003Z Tim White office phone number is 4085551212"},
 { "message":  "2021-08-31 01:34:55.004Z Alice Brown credit card: 4111-1111-1111-1111"},
 { "message": "2021-09-01 01:34:55.005Z Bob Davis SSN: 123-45-6789"},
 { "message":  "2021-09-02 01:34:55.006Z Carol Evans email: carol.evans@example.com"}
]
```

The data includes names and US phone numbers that contain PII. The phone pattern supports `(408) 555-1212`, `206-555-1212`, and `4085551212`. Use the following regular expressions to match and mask this data.

The replacement text can change based on your requirements.

<table><thead><tr><th width="163.6796875">PII Type</th><th width="407.5164794921875">Match regex</th><th>Replacement text</th></tr></thead><tbody><tr><td>Phone number</td><td>(?:\(\d{3}\)\s*\d{3}-\d{4}|\d{3}-\d{3}-\d{4}|\b\d{10}\b)</td><td>[REDACTED-PHONE]</td></tr><tr><td>Credit card</td><td>\b\d{4}-\d{4}-\d{4}-\d{4}\b</td><td>[REDACTED-CC]</td></tr><tr><td>SSN</td><td>\b\d{3}-\d{2}-\d{4}\b</td><td>[REDACTED-SSN]</td></tr><tr><td>Email address</td><td>\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,}\b</td><td>[REDACTED-EMAIL]</td></tr></tbody></table>

The following log data shows the result after the rewrite rule runs.

```
[
 { "message": "2021-08-28 01:34:55.001Z Jane Smith phone number : [REDACTED-PHONE]"},
 { "message": "2021-08-29 01:34:55.002Z Raj Singh local phone number => [REDACTED-PHONE]"},
 { "message":  "2021-08-30 01:34:55.003Z Tim White office phone number is [REDACTED-PHONE]"},
 { "message":  "2021-08-31 01:34:55.004Z Alice Brown credit card: [REDACTED-CC]"},
 { "message": "2021-09-01 01:34:55.005Z Bob Davis SSN: [REDACTED-SSN]"},
 { "message":  "2021-09-02 01:34:55.006Z Carol Evans email: [REDACTED-EMAIL]"}
]
```

Use context-specific expressions when possible. A numerical-only expression can replace values that are not phone numbers.

```
(?P<phone>\D*\d{3}\D*\d{3}\D*\d{4})
```

{% hint style="info" %}
For RE2 search-and-replace syntax and best practices, see the [RE2 documentation](https://qinwenfeng.com/re2r_doc/#2_replace_a_substring).
{% endhint %}

### Creating a PII masking rule via the UI

Open **Configure Pipeline**, click **Add Rule** under **Rules**, then select **REWRITE**. Complete the shared fields and condition in [.](./ "mention").

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-18 15-00-05.png" alt=""><figcaption></figcaption></figure>

To configure your rewrite rule, do the following.

1. Provide a **Name** for your rule.
2. Select a **Group**.
3. Provide a **Description** of the rule.
4. Provide your **Match** and **Rewrite** expressions to rewrite on the message field.
5. To rewrite a field value, select the field under **Choose fields to mask their values**. Optionally, enter a replacement value. The default replacement value is `*****`.
6. Optionally, click **+ Add more parameters** to add a condition for the selected data flow.
7. Click **SAVE**.

#### Pipeline Preview

_Phone number masking_

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-22 13-42-58.png" alt=""><figcaption></figcaption></figure>

_Credit card masking_

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-22 13-43-08.png" alt=""><figcaption></figcaption></figure>

_SSN masking_

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-22 13-43-17.png" alt=""><figcaption></figcaption></figure>

_Email address masking_

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-22 13-43-36.png" alt=""><figcaption></figcaption></figure>

Your rewrite rule is part of the pipeline. When the pipeline processes matching logs, the rule finds patterns that match the expression and rewrites the log data.

Apica Ascent offers many built-in rules for obfuscating sensitive information like credit card numbers, SSN, phone numbers, and many more.
