---
description: >-
  A line chart shows trends over time by connecting data points. Use it for time
  series metrics and comparisons across multiple series.
---

# Line

A line chart shows trends over time by connecting data points. Use it for time series metrics and comparing multiple series.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 16-47-57.png" alt=""><figcaption><p>Line chart</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 16-50-23.png" alt=""><figcaption><p>Grouped line chart</p></figcaption></figure>

### Configure a line chart

Use the **Plot** panel to choose axes, grouping, and display settings.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 16-51-28.png" alt="" width="423"><figcaption></figcaption></figure>

### Line chart options

Use these options to control how the line chart renders.

| Option         | What it controls                          | Typical values / notes                                                                                                  |
| -------------- | ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| X-axis         | Field used for the X axis.                | Use `timestamp` for time-based charts. Use a label field for categorical charts (for example `service`, `pod`, `host`). |
| Y-axis         | Numeric field to plot.                    | Common choices: `value`, `cpu_usage`, `latency`, `error_rate`.                                                          |
| Group by       | Split into multiple bar series per group. | For example `pod` creates one series per pod. Leave empty for a single series.                                          |
| Y-axis label   | Display label for the Y axis.             | Cosmetic only. Example: “CPU Usage (%)”.                                                                                |
| Y-axis scale   | How values are scaled on the Y axis.      | **Linear** for most data. **Logarithmic** for wide ranges.                                                              |
| Reference line | A horizontal threshold line.              | Example: `80` for an SLA/limit line.                                                                                    |
| Legend         | Show/hide legend.                         | Turn off for a single series or tight layouts.                                                                          |
| Calculations   | Summary overlays on the plotted data.     | Min, Max, Avg, Count, Sum, P50, P90, P95, P99.                                                                          |
| Smooth graph   | Smooths the rendered curve/series.        | Useful for long time ranges. Avoid for step-like data.                                                                  |
| Custom color   | Set fixed colors for series.              | Helps keep colors consistent across dashboards.                                                                         |
| Apply          | Applies changes to the widget.            | Changes do not render until you click **Apply**.                                                                        |

### When to use a line chart

Use a line chart when you want to:

* Track a metric over time (trends and seasonality)
* Compare multiple time series (via **Group by**)
* Spot spikes, drops, regressions, or slow drifts
* Validate the impact of deploys or incidents across a time window

Typical use cases:

* CPU / memory utilization over time
* Request rate and throughput
* Latency percentiles (P50/P95/P99)
* Error rate and saturation signals

### When not to use a line chart

Avoid a line chart when:

* You need a part-to-whole view (use Pie/Disk)
* You need exact record-level inspection (use Table/List/Details)
* You’re comparing many categories at one timestamp (use Bar)
