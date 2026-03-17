---
description: >-
  A sunburst chart visualizes hierarchical data using concentric rings. Use it
  to understand proportional breakdowns across levels.
---

# Sunburst

A sunburst chart visualizes hierarchical data using concentric rings. It shows how a total metric is broken down across multiple levels.

It’s ideal for:

* memory breakdown per instance
* cost or usage hierarchy
* resource allocation
* drill-down analysis

### What a sunburst represents

Each ring represents one level in the hierarchy.

* **Center**: root (total of all values)
* **Inner ring**: first hierarchy column
* **Next rings**: deeper hierarchy levels
* **Slice size**: proportional to metric value
* **Color**: category grouping

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 18-15-01.png" alt=""><figcaption><p>Sunburst chart</p></figcaption></figure>

### Configure a sunburst chart

Use the **Plot** panel to choose the hierarchy levels and the value column.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 18-16-26.png" alt=""><figcaption></figcaption></figure>

### Sunburst chart options

Use these options to control how the sunburst chart renders.

| Option                      | Purpose                                              | Typical values / notes                                                                                                  |
| --------------------------- | ---------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| Hierarchy columns (ordered) | Ordered levels for drill-down (inner → outer rings). | Examples: `cluster → namespace → app`, `instance → pod → container`, `service → endpoint → status_code`. Order matters. |
| Value column                | Numeric metric used to size each slice.              | Examples: `value`, `memory_bytes`, `cost`, `request_count`. Duplicate paths are aggregated.                             |
| Apply                       | Applies changes to the widget.                       | Changes do not render until you click **Apply**.                                                                        |

{% hint style="info" %}
Key rules: at least one hierarchy column is required, hierarchy order matters (inner → outer), and Value column must be numeric.
{% endhint %}

### When to use a sunburst chart

Use sunburst charts when:

* your data has multiple categorical levels
* you want visual drill-down
* you need proportional breakdown across hierarchy

They’re best for composition analysis (breakdowns), not trends.
