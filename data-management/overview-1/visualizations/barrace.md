---
description: >-
  A bar race chart animates ranked bars across time. Use it to show how top
  categories change between time frames.
---

# Barrace

A bar race chart animates ranked bars across time frames. Use it to show how top categories change over time.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 17-36-17.png" alt=""><figcaption><p>Bar race chart</p></figcaption></figure>

### Configure a bar race chart

Use the **Plot** panel to choose axes, grouping, and display settings.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 17-37-15.png" alt=""><figcaption></figcaption></figure>

### Bar race chart options

Use these options to control how the bar race chart renders.

| Option       | What it controls                           | Typical values / notes                                                                                                   |
| ------------ | ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------ |
| Value column | Numeric metric that determines bar length. | Examples: `value`, `memory_kb`, `cpu_usage`, `bytes_sent`. This column must be numeric.                                  |
| Label column | What each bar represents (entity name).    | Common choices: `pod`, `host`, `process`, `disk`. This column is used to name each bar and track entities across frames. |
| Unit         | Suffix appended to the displayed value.    | Examples: `kB`, `MB`, `ms`, `%`, `ops`.                                                                                  |
| Apply        | Applies changes to the widget.             | Changes do not render until you click **Apply**.                                                                         |

### When to use a bar race chart

Use a bar race chart when you want to:

* Show how rankings change over time (top N moving up/down)
* Highlight “winners” and “losers” across time frames
* Tell a story about change, not just a final snapshot

Typical use cases:

* Top services by request volume over time
* Top namespaces by log ingest over time
* Top hosts by CPU usage over time
* Top teams by cost over time

### When not to use a bar race chart

Avoid a bar race chart when:

* You need precise value comparisons (use Bar/Table)
* You have too many categories (animation becomes noisy)
* You want a continuous time series trend (use Line/Area)
* You need record-level inspection (use Table/List/Details)
