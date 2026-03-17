---
description: >-
  A heat map shows how a numeric metric varies across two dimensions using color
  intensity. Use it to spot hotspots and patterns.
---

# Heatmap

A heat map visualizes how a numeric metric varies across two dimensions using color intensity. It helps you spot hot spots, spikes, and distribution patterns.

It’s ideal for:

* log volume per app per namespace
* traffic distribution
* error concentration
* workload imbalance

### What a heat map represents

Each colored cell corresponds to one **(X, Y)** combination.

* **Column**: X-axis category
* **Row**: Y-axis category
* **Cell color**: metric intensity (value column)
* **Color scale**: low → high values

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 18-06-19.png" alt=""><figcaption><p>Heat map</p></figcaption></figure>

### Configure a heat map

Use the **Plot** panel to choose axes and display settings.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 18-07-51.png" alt=""><figcaption></figcaption></figure>

### Heat map options

Use these options to control how the heat map renders.

| Option        | Purpose                               | Typical values / notes                                                                                                   |
| ------------- | ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| X-axis column | First (horizontal) dimension.         | Categorical field. Examples: `exported_namespace`, `cluster`, `region`. You can also use `timestamp` for time buckets.   |
| Y-axis column | Second (vertical) dimension.          | Categorical field. Examples: `app`, `service`, `pod`, `host`.                                                            |
| Value column  | Metric used for coloring (intensity). | Must be numeric. Examples: `value`, `request_count`, `error_count`, `bytes_sent`. Duplicate (X, Y) pairs are aggregated. |
| Apply         | Applies changes to the widget.        | Changes do not render until you click **Apply**.                                                                         |

{% hint style="info" %}
Key rules: X-axis and Y-axis should be categorical fields, and Value column must be numeric. If your dataset has duplicate (X, Y) pairs, they will be aggregated.
{% endhint %}

### When to use a heat map

Use heat maps when you want to analyze:

* which app produces most traffic
* which namespace is overloaded
* where errors are concentrated
* workload imbalance across services

They work best when your data has two categorical dimensions and you want fast visual pattern recognition.
