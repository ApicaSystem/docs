---
description: >-
  A Status chart displays a single metric as a health state using text and
  color. Use it to show UP/DOWN/OK style states based on thresholds.
---

# Status

A Status chart displays a single metric as a health state using text and color. Use it to show whether something is **UP**, **DOWN**, **OK**, **Warning**, or **Critical**. You define these states using threshold rules.

It’s ideal for:

* Service health
* SLA status
* Error rate checks
* Queue depth
* Availability
* Latency thresholds

### What a Status chart represents

The chart evaluates one numeric value and maps it to a status rule.

Your data typically looks like:

`value → threshold rules → text + color`

This produces a single tile like:

`UP` _(green)_

<figure><img src="../../../.gitbook/assets/image (552).png" alt="Example Status chart tile showing a state label and color"><figcaption><p>Example Status chart</p></figcaption></figure>

### Configure a Status chart

Set **Chart type** to **Status**. Then pick the numeric column to evaluate. Optionally enable custom rules for text and colors.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-10 08-16-37.png" alt="" width="427"><figcaption></figcaption></figure>

### Status configuration options

Use these options to control how the Status chart renders.

| Option        | Purpose                                                                  |
| ------------- | ------------------------------------------------------------------------ |
| Chart type    | Must be **Status**.                                                      |
| Select column | Numeric metric being evaluated.                                          |
| Custom config | Enables threshold rules.                                                 |
| Condition     | Logical check operator (`>`, `<`, `>=`, `<=`, `=`). \*evaluated in-order |
| Threshold     | Comparison value used by the condition.                                  |
| Text          | Label shown on the tile (for example `UP`).                              |
| Color         | Tile color when the rule matches.                                        |

Common **Select column** values:

* `value`
* `availability`
* `error_rate`
* `latency`
* `queue_depth`

{% hint style="info" %}
Key rules:

* Status evaluates a single numeric value.
* Turn on **Custom config** to define rule-based states.
* Rules are evaluated **top-to-bottom** (in order).
* The tile uses the **first rule** whose condition is satisfied.
* Add a “default” rule last, if you need one.

Example (rule order matters):

* `value > 90` → `CRITICAL` (red)
* `value > 80` → `WARNING` (yellow)

If `value = 95`, the chart shows **CRITICAL** (not WARNING).
{% endhint %}

### When to use a Status chart

Use Status charts when you want to:

* Show a single health signal at a glance
* Convert a metric into a readable state
* Build dashboards for on-call or NOC views

They’re not a trend visualization. Use a line/area chart to show change over time.
