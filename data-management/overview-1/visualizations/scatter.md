---
description: >-
  A scatter plot shows relationships between two numeric fields. Use it to spot
  correlations, clusters, and outliers.
---

# Scatter

A scatter plot shows individual data points based on an X and Y value. Use it to spot correlations, clusters, and outliers.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 17-07-52.png" alt=""><figcaption><p>Scatter plot</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 17-25-47.png" alt=""><figcaption></figcaption></figure>

### Configure a scatter plot

Use the **Plot** panel to choose axes, grouping, and display settings.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 17-28-32.png" alt="" width="443"><figcaption></figcaption></figure>

### Scatter plot options

Use these options to control how the scatter plot renders.

| Option         | What it controls                      | Typical values / notes                                                                                                  |
| -------------- | ------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| X-axis         | Field used for the X axis.            | Use a numeric field (for example `latency`, `payload_size`). You can also use `timestamp` for time-based scatter plots. |
| Y-axis         | Field used for the Y axis.            | Use a numeric field (for example `error_rate`, `cpu_usage`, `value`).                                                   |
| Group by       | Split points into multiple series.    | For example `pod` colors points by pod. Leave empty for a single series.                                                |
| Y-axis label   | Display label for the Y axis.         | Cosmetic only. Example: “CPU Usage (%)”.                                                                                |
| Y-axis scale   | How values are scaled on the Y axis.  | **Linear** for most data. **Logarithmic** for wide ranges.                                                              |
| Reference line | A horizontal threshold line.          | Example: `80` for an SLA/limit line.                                                                                    |
| Legend         | Show/hide legend.                     | Turn off for a single series or tight layouts.                                                                          |
| Calculations   | Summary overlays on the plotted data. | Min, Max, Avg, Count, Sum, P50, P90, P95, P99.                                                                          |
| Custom color   | Set fixed colors for series.          | Helps keep colors consistent across dashboards.                                                                         |
| Apply          | Applies changes to the widget.        | Changes do not render until you click **Apply**.                                                                        |

### When to use a scatter plot

Use a scatter plot when you want to:

* Understand the relationship between two numeric metrics
* Spot correlation (positive/negative) or lack of correlation
* Identify clusters (groups of similar behavior)
* Find outliers (rare or extreme points)

Typical use cases:

* Latency vs request size
* CPU usage vs memory usage
* Error rate vs throughput
* Cost vs usage (per service/team)

### When not to use a scatter plot

Avoid a scatter plot when:

* One axis is not numeric (use Bar/Table instead)
* You mainly want a trend over time (use Line/Area)
* You need exact record-level inspection (use Table/List/Details)
