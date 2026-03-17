---
description: >-
  A bubble chart plots X and Y values and uses bubble size for a third metric.
  Use it to compare three dimensions at once.
---

# Bubble

A bubble chart plots points on X and Y axes, and uses bubble size to represent a third metric.

Use it to compare **three dimensions** at once:

* **X position**: X-axis field
* **Y position**: Y-axis field
* **Bubble size**: Bubble size column

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 17-44-54.png" alt=""><figcaption><p>Bubble chart</p></figcaption></figure>

### Configure a bubble chart

Use the **Plot** panel to choose axes, grouping, and display settings.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 17-44-10.png" alt="" width="438"><figcaption></figcaption></figure>

### Bubble chart options

Use these options to control how the bubble chart renders.

| Option             | Purpose                                 | Typical values / notes                                               |
| ------------------ | --------------------------------------- | -------------------------------------------------------------------- |
| X-axis             | Horizontal position of bubbles.         | Common: `timestamp`, `request_time`, `host`, `pod`.                  |
| Y-axis             | Vertical position of bubbles.           | Numeric field. Examples: `value`, `latency`, `response_size`, `cpu`. |
| Bubble size column | Controls bubble radius (3rd dimension). | Numeric field. Examples: `value`, `request_count`, `bytes`.          |
| Min bubble size    | Smallest allowed bubble radius.         | Prevents tiny values from becoming invisible. Example: `5`.          |
| Max bubble size    | Largest allowed bubble radius.          | Prevents large values from dominating the chart.                     |
| Group by           | Splits bubbles into series (colors).    | Examples: `pod`, `instance`, `status_code`, `service`.               |
| Y-axis label       | Display label for the Y axis.           | Cosmetic only. Example: “HTTP Response Size (Bytes)”.                |
| Y-axis scale       | Scale for Y-axis values.                | **Linear** for most data. **Logarithmic** for wide ranges.           |
| Reference line     | Horizontal threshold line.              | Example: `500000` to mark a 500 KB limit.                            |
| Legend             | Show/hide series names and colors.      | Turn off for single-series charts or tight layouts.                  |
| Calculations       | Stats derived from Y-axis values.       | Count, Min, Max, Avg, P90, P95, P99.                                 |
| Custom color       | Manual color assignment per series.     | Useful for consistent dashboard colors.                              |
| Apply              | Applies changes to the widget.          | Changes do not render until you click **Apply**.                     |

{% hint style="info" %}
Bubble charts work best when **Y-axis** and **Bubble size column** are numeric. If bubbles look “flat”, check that the size column isn’t constant or null.
{% endhint %}

### When to use a bubble chart

Use a bubble chart when you want to:

* Compare **three** metrics at once (X, Y, size)
* Identify clusters and outliers with a “magnitude” dimension
* Show trade-offs (for example latency vs throughput, sized by traffic)

Typical use cases:

* Latency (Y) vs request rate (X), sized by error count
* CPU (Y) vs memory (X), sized by pod count
* Cost (Y) vs usage (X), sized by traffic volume

### When not to use a bubble chart

Avoid a bubble chart when:

* You only need two dimensions (use Scatter)
* You need a clear ranking across categories (use Bar)
* You have too many points and it becomes cluttered (use Table/List or filter first)
* You mainly want trends over time (use Line/Area)
