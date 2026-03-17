---
description: >-
  A Sankey chart visualizes how a numeric metric flows across ordered stages.
  Use it to understand movement between categories and spot imbalances.
---

# Sankey

A Sankey chart shows how a numeric metric flows across ordered stages. It highlights sources → stages → targets. Link width is proportional to the metric value.

It’s ideal for:

* Log or event flow tracking
* Data pipeline visualization
* Request routing
* Cost or traffic movement
* Namespace → app → destination mapping

### What a Sankey represents

Each column represents one **stage** in the flow. Each node is a category inside a stage. Each link shows the amount moving between two categories.

* **Node**: a category at a stage
* **Link**: flow between two categories
* **Link width**: magnitude of the metric
* **Color**: grouping (depends on the field used by your data)

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 19-03-09.png" alt="Example Sankey chart showing flows between stages"><figcaption><p>Example Sankey chart</p></figcaption></figure>

### Configure a Sankey chart

Set **Chart type** to **Sankey**. Use the **Plot** panel to define flow stages and the metric.

<figure><img src="../../../.gitbook/assets/Screenshot from 2026-01-09 19-04-21.png" alt="Sankey chart settings in the Plot panel"><figcaption><p>Sankey configuration (Plot panel)</p></figcaption></figure>

### Sankey chart options

Use these options to control how the Sankey chart renders.

| Option                 | Purpose                                       | Typical values / notes                                                                                                        |
| ---------------------- | --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Flow columns (ordered) | Defines the path data follows (left → right). | Examples: `cluster → namespace → app`, `namespace → app → pod`, `service → endpoint → status_code`. Order matters. Minimum 2. |
| Value column           | Numeric metric that sets link thickness.      | Examples: `value`, `request_count`, `cost`, `bytes`. Duplicate paths are aggregated.                                          |
| Apply                  | Applies changes to the widget.                | Changes do not render until you click **Apply**.                                                                              |

{% hint style="info" %}
Key rules:

* Use at least 2 flow columns.
* Column order defines flow direction.
* Value column must be numeric.


{% endhint %}

###

### When to use a Sankey chart

Use Sankey charts when you want to:

* Understand movement between systems or states
* Identify bottlenecks or dominant paths
* Detect imbalances (skewed flows)
* Explain pipelines and routing

They’re best for composition and routing analysis, not trends over time.
