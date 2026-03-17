---
description: >-
  A Searchable Table lets you explore large datasets with search, filters, and
  pagination. Use it for investigation and validation.
---

# Searchable-table

The Searchable Table is used to explore, filter, and inspect large datasets. It helps you quickly find specific records by searching across columns and applying filters.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-15 14-23-45.png" alt=""><figcaption></figcaption></figure>

It’s ideal for:

* Metrics inspection
* Log review
* Event tracking
* Alert analysis

### What it represents

* Each row represents one record in the dataset.
* Each column represents one attribute (time, instance, service, value).

It shows raw, detailed data in a structured and interactive format.



### Search

The search box lets you:

* Search across all visible columns
* Instantly filter matching rows



### Column-based filters

Filters let you:

* Narrow results by time, value, or labels
* Include or exclude specific field values
* Focus on relevant data

This enables precise exploration without changing the underlying query.

### Pagination

Large datasets are split into pages to:

* Improve performance
* Make browsing manageable

You can move between pages to view more records.

### What this visualization tells you

The Searchable Table is designed for deep investigation. It lets you:

* Inspect individual data points
* Validate metric values
* Debug issues
* Audit system behavior

### When to use Searchable Table

Use a Searchable Table when:

* You need row-level visibility
* You are troubleshooting
* You need to explore large datasets

{% hint style="info" %}
Use a normal [Table](table.md) when you just need a static grid. Use Searchable Table when you need fast filtering and exploration.
{% endhint %}
