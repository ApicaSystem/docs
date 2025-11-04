---
description: Perform statistical operations on telemetry data.
---

# AGGREGATE

The **Aggregate Rule** is a component of Ascent’s Telemetry Pipelines that enables users to perform statistical operations on MELT data. A single Aggregate Rule can include multiple aggregate functions.

> **Note:** All results are calculated independently by each pod based on the data it ingests.

As with other rule types, an optional filter can be applied to restrict the dataset on which the rule operates. The filter requires selecting a field and providing a regular expression (regex) to match against that field’s value.

#### Aggregate Functions

* **Count:** Returns the number of occurrences of the selected field in the ingested data.
* **Sum:** Computes the total of all numeric values for the specified field.
* **Average:** Calculates the average of all numeric values for the specified field.
* **Min:** Returns the minimum numeric value of the specified field.
* **Max:** Returns the maximum numeric value of the specified field.
* **Median:** Provides an approximate median value of the sorted numeric values for the specified field.
* **Mode:** Returns the most frequently occurring value of the specified field.
* **Distinct:** Returns the set of unique values observed for the specified field.
* **Summary:** Computes approximated percentiles for the sorted numeric values of the specified field. In addition to percentile results, this function also returns the sum and average.

#### Output Types

There are two ways to emit the results of an aggregation operation:

* **input-log:** Appends the aggregation result to the  `structured_data` of the event that is received after the interval expires.
* **metric:** Updates a metric corresponding to the rule and function (viewable through the Ascent Metric data source). Metric names follow these formats:
  * **Summary:** `pipeline_summary_aggregation_<rule_name>`
  * **Mode:** `pipeline_mode_aggregation_<rule_name>`
  * **All others:** `pipelines_aggregation_<rule_name>`

#### Interval

Defines the time window over which all functions within the rule operate.

> **Note:** If an ingest pod does not receive any data during the interval, the system publishes the result either by updating the metric or by generating a new event containing the result in `structured_data`.

#### Group By

When configured, the Aggregate Rule groups results based on the distinct values of the selected field, applying aggregation independently to each group.
