---
description: >-
  A Pie chart shows how a total is divided across categories. Use it for quick
  part-to-whole breakdowns.
---

# Pie

A Pie chart shows how a total is divided among categories. It answers one question:

**“What portion of the whole does each category represent?”**

It’s ideal for:

* Market share / contribution
* Status distribution (success vs failure)
* Resource usage split by category
* Error breakdown by type

### What a Pie chart represents

A Pie chart displays a single total (100%) broken into slices. Each slice represents a category’s share of that total.

* Full circle = 100%
* Each slice = percent of total

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-15 13-54-30.png" alt="Example Pie chart showing category slices as proportions of a total"><figcaption><p>Example Pie chart</p></figcaption></figure>

### Data it uses

A Pie chart requires two fields:

* **Label**: category name
* **Value**: numeric measure

Example input:

```
category  value
A         40
B         35
C         25
```

### Configure a Pie chart

Set **Chart type** to **Pie**. Pick:

* **Label column** (category)
* **Value column** (numeric)

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-15 13-56-37.png" alt=""><figcaption></figcaption></figure>

### Pie chart configuration options

| Option       | Purpose                            |
| ------------ | ---------------------------------- |
| Chart type   | Must be **Pie**.                   |
| Label column | Category name for each slice.      |
| Value column | Numeric value used to size slices. |

{% hint style="info" %}
Key rules:

* A Pie chart is about proportions, not trends.
* Use 2–6 categories for readability.
* Too many slices = switch to a bar chart.
{% endhint %}

###

### What this chart tells you

A Pie chart helps users understand:

* Which category is largest
* How data is distributed
* Whether one category dominates
* Relative contribution of each part

### When to use a Pie chart

Use a Pie chart when:

* You’re showing part-to-whole.
* The category count is small (2–6).
* Differences are visually clear.

### When not to use a Pie chart

Avoid a Pie chart when:

* There are too many categories.
* Values are very similar.
* You need precise comparisons.
* You’re showing trends over time.

Use a bar/line chart instead.
