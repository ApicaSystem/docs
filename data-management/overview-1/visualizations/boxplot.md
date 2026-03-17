---
description: >-
  A box plot shows the distribution of a metric across time buckets or groups.
  Use it to spot variability and outliers.
---

# Boxplot

A box plot visualizes the statistical distribution of a metric over time or across groups. It shows how values spread and where outliers occur.

It’s ideal for:

* memory usage analysis
* latency distribution
* detecting outliers
* identifying instability or leaks

### What a box plot represents

Each box corresponds to one **time bucket** (for example, a timestamp window) or one **group** (for example, a pod).

* **Box**: 25th to 75th percentile (IQR)
* **Middle line**: median (P50)
* **Whiskers**: normal min and max
* **Outlier dots**: abnormal values outside the whiskers

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 18-00-12.png" alt=""><figcaption><p>Box plot</p></figcaption></figure>

### Configure a box plot

Use the **Plot** panel to choose axes, grouping, and display settings.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 17-54-55.png" alt="" width="456"><figcaption></figcaption></figure>

### Box plot options

Use these options to control how the box plot renders.

| Option         | Purpose                                         | Typical values / notes                                                                      |
| -------------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------- |
| X-axis         | Defines how data is bucketed into boxes.        | Typical: `timestamp` (each box = one time window). Other options: `pod`, `host`, `service`. |
| Y-axis         | Numeric metric to analyze (distribution).       | Examples: `value`, `memory_bytes`, `latency_ms`, `cpu`. Must be numeric.                    |
| Group by       | Split into multiple distributions per X bucket. | Example: `pod` gives one box per pod for each time bucket.                                  |
| Y-axis label   | Display label for the Y axis.                   | Cosmetic only. Example: “Stack Memory (Bytes)”.                                             |
| Y-axis scale   | Scale for Y-axis values.                        | **Linear** for most data. **Logarithmic** for very large ranges.                            |
| Reference line | Horizontal threshold line.                      | Example: `6000000000` to mark a 6 GB limit.                                                 |
| Legend         | Show/hide series names and colors.              | Useful when Group by is set.                                                                |
| Calculations   | Summary stats derived from Y-axis values.       | Count, Min, Max, Avg, P50, P90, P95, P99.                                                   |
| Smooth graph   | Not used for box plots.                         | Present for consistency across chart types.                                                 |
| Custom color   | Control colors for boxes and outliers.          | Often used to differentiate normal vs outlier points.                                       |
| Apply          | Applies changes to the widget.                  | Changes do not render until you click **Apply**.                                            |

{% hint style="info" %}
Box plots need enough samples per bucket to be meaningful. If boxes look “flat” or disappear, increase the time range, reduce grouping, or increase bucket size.
{% endhint %}

### When to use a box plot

Use box plots when you care about:

* variability and stability over time
* spikes and outliers
* distribution shifts (median and spread changes)

They work especially well for memory, latency, response size, and CPU metrics.

### When not to use a box plot

Avoid box plots when:

* You only need a single value (use Counter/Stat/Status)
* You need a simple trend line (use Line/Area)
* You need a part-to-whole view (use Pie/Disk)
* Your buckets have too few samples to form a distribution (use a larger time range or different chart)
