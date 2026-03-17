---
description: >-
  A Details Table shows one record at a time as key–value fields. Use it for
  deep inspection of metrics, events, or log entries.
---

# Details

The Details Table is used to display full information for individual records. It provides a field-by-field view of each data row so you can see all attributes of a metric, event, or log entry.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-15 14-36-48.png" alt=""><figcaption></figcaption></figure>

### What it represents

Each page shows one record at a time. All columns for that record are displayed as key–value pairs.

This format is designed to show complete metadata for a single data point.

### What data it uses

The Details Table works with row-level data from a dataset. Each row can contain:

* Timestamp
* Metric value
* Labels such as instance, job, service, namespace
* Any additional attributes

### Pagination

Datasets can contain many rows. The Details Table splits them into pages so you can:

* Move between records
* Inspect each entry individually
* Avoid loading too much data at once

### What this visualization tells you

The Details Table helps you:

* See the exact value of a metric
* View all associated labels
* Verify where the data came from
* Troubleshoot issues at record level

It’s built for deep inspection and debugging.

### When to use Details Table

Use the Details Table when:

* You need complete metadata
* You want to inspect individual data points
* You are validating or troubleshooting metrics

Typical use cases:

* Metric inspection
* Alert verification
* Data validation
* Debugging pipelines

### Summary

The Details Table is a record-level viewer. It shows one dataset row at a time with all its fields, making it the best tool for precise data inspection.
