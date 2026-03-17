---
description: >-
  A Pivot Table summarizes large datasets into a grid using grouping and
  aggregation. Use it to compare totals across multiple dimensions.
---

# Pivottable

A Pivot Table is used to summarize, group, and analyze large datasets. It turns raw data into structured totals, counts, and comparisons across multiple dimensions.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-15 14-19-07.png" alt=""><figcaption></figcaption></figure>

### What it represents

A Pivot Table organizes data into:

* **Rows**: grouping fields
* **Columns**: breakdown fields
* **Values**: metrics such as count, sum, or average

It converts many records into a compact analytical view.

### What data it uses

The Pivot Table works with tabular data that contains:

* **Dimensions**: labels like `service`, `pod`, `region`, `time`
* **Measures**: numbers like `count`, `duration`, `size`, `usage`

Example input:

```
service  endpoint  requests
A        /login    120
A        /pay      80
B        /login    200
```

### How the pivot works

You choose:

* **Row fields** → how data is grouped
* **Column fields** → how data is split
* **Value field** → what is calculated (count/sum/avg)

Example:

* Rows = `service`
* Columns = `endpoint`
* Values = `count` or `sum(requests)`

This answers:

“How many requests did each service send to each endpoint?”

### What this visualization tells you

A Pivot Table helps you:

* Compare categories side by side
* See totals and subtotals
* Identify heavy usage or gaps
* Analyze patterns across dimensions

It’s ideal for multi-dimensional analysis.

### When to use a Pivot Table

Use a Pivot Table when:

* You have large datasets
* You need grouping and aggregation
* You want to slice data by multiple fields

Typical use cases:

* Logs by service and endpoint
* Metrics by region and time
* Costs by team and project
* Alerts by severity and component

### When not to use a Pivot Table

Avoid Pivot Tables when:

* You only need a single number
* You want trends over time
* You need a visual pattern

Use charts instead for those cases.

{% hint style="info" %}
Pivot Tables work best when row and column cardinality are reasonable. High-cardinality fields can make the grid unreadable.
{% endhint %}
