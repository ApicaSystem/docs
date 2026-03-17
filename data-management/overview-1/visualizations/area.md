---
description: >-
  An area chart shows trends over time with the area under the line filled in.
  Use it to highlight magnitude and compare multiple series.
---

# Area

An area chart shows trends over time with the area under the line filled in. Use it to emphasize magnitude and compare multiple series.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 17-01-13.png" alt=""><figcaption><p>Area chart</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 17-02-36.png" alt=""><figcaption><p>Grouped area chart</p></figcaption></figure>

### Configure an area chart

Use the **Plot** panel to choose axes, grouping, and display settings.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 17-03-45.png" alt="" width="416"><figcaption></figcaption></figure>

### Area chart options

Use these options to control how the area chart renders.

| Option         | What it controls                      | Typical values / notes                                                                                                  |
| -------------- | ------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| X-axis         | Field used for the X axis.            | Use `timestamp` for time-based charts. Use a label field for categorical charts (for example `service`, `pod`, `host`). |
| Y-axis         | Numeric field to plot.                | Common choices: `value`, `cpu_usage`, `latency`, `error_rate`.                                                          |
| Group by       | Split into multiple series per group. | For example `pod` creates one area series per pod. Leave empty for a single series.                                     |
| Y-axis label   | Display label for the Y axis.         | Cosmetic only. Example: “CPU Usage (%)”.                                                                                |
| Y-axis scale   | How values are scaled on the Y axis.  | **Linear** for most data. **Logarithmic** for wide ranges.                                                              |
| Reference line | A horizontal threshold line.          | Example: `80` for an SLA/limit line.                                                                                    |
| Legend         | Show/hide legend.                     | Turn off for a single series or tight layouts.                                                                          |
| Calculations   | Summary overlays on the plotted data. | Min, Max, Avg, Count, Sum, P50, P90, P95, P99.                                                                          |
| Smooth graph   | Smooths the rendered curve/series.    | Useful for long time ranges. Avoid for step-like data.                                                                  |
| Custom color   | Set fixed colors for series.          | Helps keep colors consistent across dashboards.                                                                         |
| Apply          | Applies changes to the widget.        | Changes do not render until you click **Apply**.                                                                        |

### When to use an area chart

Use an area chart when you want to:

* Show trends over time while emphasizing magnitude
* Visualize accumulation or total volume (especially with stacked series)
* Compare series while keeping a strong sense of “how much”
* Spot spikes and sustained load more clearly than a thin line

Typical use cases:

* Traffic volume over time (bytes, requests)
* Resource usage over time (CPU, memory)
* Error volume over time
* Cost/usage over time

### When not to use an area chart

Avoid an area chart when:

* You need exact comparisons across many categories (use Bar)
* You have many overlapping series and it becomes cluttered (use Line)
* You need record-level details (use Table/List/Details)
