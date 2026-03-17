# Bar

A bar chart compares values across categories using horizontal or vertical bars. Each bar represents a category, and bar length represents the value.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 16-17-55.png" alt=""><figcaption><p>Bar chart</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 16-18-43.png" alt=""><figcaption><p>Grouped bar chart</p></figcaption></figure>

### Configure a bar chart

Use the **Plot** panel to choose axes, grouping, and display settings.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 16-24-51.png" alt="" width="423"><figcaption></figcaption></figure>

### Bar chart options

Use these options to control how the bar chart renders.

| Option         | What it controls                          | Typical values / notes                                                                                              |
| -------------- | ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| X-axis         | Field used for the X axis.                | Use `timestamp` for time-based bars. Use a label field for categorical bars (for example `service`, `pod`, `host`). |
| Y-axis         | Numeric field to plot.                    | Common choices: `value`, `cpu_usage`, `latency`, `error_rate`.                                                      |
| Group by       | Split into multiple bar series per group. | For example `pod` creates one series per pod. Leave empty for a single series.                                      |
| Y-axis label   | Display label for the Y axis.             | Cosmetic only. Example: “CPU Usage (%)”.                                                                            |
| Y-axis scale   | How values are scaled on the Y axis.      | **Linear** for most data. **Logarithmic** for wide ranges.                                                          |
| Reference line | A horizontal threshold line.              | Example: `80` for an SLA/limit line.                                                                                |
| Legend         | Show/hide legend.                         | Turn off for a single series or tight layouts.                                                                      |
| Calculations   | Summary overlays on the plotted data.     | Min, Max, Avg, Count, Sum, P50, P90, P95, P99.                                                                      |
| Smooth graph   | Smooths the rendered curve/series.        | Useful for long time ranges. Avoid for step-like data.                                                              |
| Custom color   | Set fixed colors for series.              | Helps keep colors consistent across dashboards.                                                                     |
| Apply          | Applies changes to the widget.            | Changes do not render until you click **Apply**.                                                                    |

### When to use a bar chart

Use a bar chart when you want to:

* Compare values across categories at a point in time
* Rank items (top N / bottom N)
* Compare groups side-by-side (grouped bars)
* Show distribution across discrete buckets

Typical use cases:

* Requests by service / endpoint
* Errors by status code
* Cost by team / namespace
* Latency by region

### When not to use a bar chart

Avoid a bar chart when:

* You need trends over time across many points (use Line/Area)
* You need part-to-whole as percentages (use Pie/Disk)
* You need detailed row-level inspection (use Table/List/Details)
