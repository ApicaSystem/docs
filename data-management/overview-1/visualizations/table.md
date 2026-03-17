---
description: >-
  A Table chart shows query results as rows and columns. Use it when you need
  exact values instead of a visual summary.
---

# Table

A Table chart shows your query output in a simple grid. It’s the most direct way to inspect raw values.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-15 14-04-50.png" alt=""><figcaption></figcaption></figure>

It’s ideal for:

* Top N lists (slowest endpoints, highest cost services)
* Breakdown views (by `namespace`, `service`, `status_code`)
* Validation and debugging of queries
* Export-ready views for reports

### What a Table chart represents

Each row is one record from the query result. Each column is one field from the result schema.

Tables do not convert values into trends or percentages. They display the numbers and strings as-is.

### Data it uses

Tables work with any result set. Your query defines what columns exist.

Common patterns:

* **Time-series to table**: aggregate first, then show grouped columns.
* **Dimensional breakdown**: `group by` fields become columns.
* **Raw events**: show the latest rows (logs-like view).

###

{% hint style="info" %}
Key rules:

* Tables are only as good as your query output.
* Use aggregation to avoid huge row counts.
* Prefer stable column names for dashboards.
{% endhint %}

### When to use a Table chart

Use Table when you need precision. Use other charts when you need patterns at a glance.
