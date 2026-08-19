---
description: >-
  Build dashboards from a description, edit the dashboard you are viewing by
  talking to Venn, and draft queries without knowing the query language.
---

# Dashboards and Queries with Venn

### Create a dashboard from a description

* _"Create a dashboard on the logs data source for the prod namespace"_
* _"Create a dashboard from goroutine metric"_
* _"Build a CPU and memory overview for the payments service"_

Venn drafts the full dashboard (tabs, widgets, and their queries) and opens it in the Data Explorer import wizard for you to review, adjust, and save.

What makes the drafts trustworthy:

* **Your words, your sources.** Venn resolves the data source from how you refer to it: "checks", "my synthetics", or "the log source" find the right registered source; it never silently assumes Prometheus.
* **Real identifiers only.** Before drafting, Venn discovers the source's actual inventory (metric names, check names, namespace and application pairs, tables). Drafts are verified against your live inventory, and the reviewed draft shows that verification.
* **Mixed sources are fine.** A synthetic-checks panel and a Prometheus panel can sit side by side; each widget carries its own source and query language.

<figure><img src="../.gitbook/assets/image (285).png" alt=""><figcaption></figcaption></figure>

### Edit the dashboard you are looking at

Open any saved dashboard and ask Venn to change it in place:

* _"Change this widget to a bar chart"_
* _"Add a p99 latency panel"_
* _"Add a forecast band to the error-rate chart"_ (forecasting, baselining, standard-deviation bands, and anomaly detection can be added as widget algorithms)
* _"Rename the second tab to Capacity"_, _"move the top widget down"_

While live editing, the drawer shows a **Live edit** tag. Each change appears with a confirm and cancel control before it is applied, and a record of applied changes after. When Venn edits a single widget, only that widget refreshes, so the rest of the dashboard does not flicker or reload.

### Draft queries

* _"Write a query that counts 5xx responses by service over the last day"_

Venn drafts the query and opens it pre-filled in the query editor, marked as AI-prefilled, where you review, run, and save it like any query you wrote yourself.
