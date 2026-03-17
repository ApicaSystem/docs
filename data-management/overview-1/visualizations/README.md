---
description: >-
  Apica offers a variety of visualizations to support different use cases. This
  section of the documentation highlights the built-in visualizations, their
  options and typical usage.
---

# Visualizations

In Data Explorer, each widget renders data using a **visualization type**. You can switch the visualization type from the widget UI, or set it in JSON (for example, `chart_type: "line"`).

{% hint style="info" %}
Use lowercase visualization type names (for example, `table`). Some legacy dashboards may still reference older casing (for example, `Table`).
{% endhint %}

### Supported visualization types

#### Time series & charts

* [`line`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/WjLs1HGlKd44GSxbRkEu): Time series line chart for trends over time.
* [`bar`](bar.md): Compare categorical values using bars.
* [`area`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/dVbvW1IdZnz1ip1kayRY): Time series chart with filled area.
* [`scatter`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/ZpneXECircFD4x0dchi1): Plot points to show correlation or distribution.
* [`barrace`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/2Fsj8N9F4tgR4vPxzBQ7): Animated ranked bars for changes over time.
* [`bubble`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/iteHYycRdXcqMqpSjRi4): Scatter chart with bubble size as a third dimension.
* [`boxplot`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/NcD9WwSakUr0gQDl91YI): Summarize distributions using quartiles and whiskers.
* [`heatmap`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/J0sMLvIu32hhSlzeQF2i): Visualize magnitude using a two-dimensional color grid.
* [`sunburst`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/U0Y1lwsdEJRv82112bb7): Visualize hierarchical data as concentric rings.
* [`funnel`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/96QVGbedMMAn5tf5h0OB): Visualize drop-off across sequential stages.
* [`sankey`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/qU5gxxl6ah7wdOrAURp5): Visualize flows between nodes using weighted links.

#### Status & single-value

* [`status`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/6hbz4StM4AjEWZq5nHYl): Show state over time using color-coded tiles.
* [`counter`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/IuHRzVRgVbvGDIM4jFzT): Show a single KPI as a big number.
* [`stat`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/Bt1NIAhgxhtz0zdLeHPV): Show a key number with optional sparkline.
* [`size`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/QQTSPY5ZTlKi8P7Jceqw): Show magnitude using size-based marks.
* [`gauge`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/eFr6c3DFzHYBxSclmRh8): Show a single metric against thresholds.
* [`disk`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/Z03cKVI5tNZme5kFtT00): Show disk usage style values and capacity.
* [`datetime`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/fsB87dGE6QifcPYB5y0L): Show a timestamp or date-time value.
* [`densestatus`](densestatus.md): Show dense state grids for many series.
* [`honeycomb`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/CpbJO3gF8fjjJchc9l8i): Show many values as a honeycomb of tiles.
* [`pie`](/broken/spaces/-LmzGprckLqwd5v6bs6m/pages/LkSAm068AdNkObs15Yep): Show proportions as slices of a whole.

#### Tables & lists

* [`table`](table.md): Show raw results in a table.
* [`list`](list.md): Show results as a simple list.
* [`pivottable`](pivottable.md): Pivot and aggregate data by rows and columns.
* [`searchtable`](searchable-table.md): Table optimized for searching and filtering large result sets.
* [`details`](details.md): Show a drill-down or key/value style details view.

### JSON schema configuration

For JSON examples and widget configuration patterns, see [Visualization](../creating-json-schema/visualization/).

***
