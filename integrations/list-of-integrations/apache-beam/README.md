# Apache Beam

## Overview

Apache Beam is an open-source, unified model for defining both batch and streaming data-parallel processing pipelines. Using one of the open-source Beam SDKs, you build a program that defines the pipeline. The pipeline is then executed by one of Beam’s supported **distributed processing back-ends**, which include [Apache Flink](https://flink.apache.org/), [Apache Spark](https://spark.apache.org/), and [Google Cloud Dataflow](https://cloud.google.com/dataflow).

Beam is particularly useful for [embarrassingly parallel](https://en.wikipedia.org/wiki/Embarassingly_parallel) data processing tasks, in which the problem can be decomposed into many smaller bundles of data that can be processed independently and in parallel. You can also use Beam for Extract, Transform, and Load (**ETL**) tasks and pure data integration. These tasks are useful for moving data between different storage media and data sources, transforming data into a more desirable format, or loading data onto a new system.

Apica Ascent provides integrations to let you integrate Apica Ascent with Apache Beam. Checkout the submodules to learn more about it.



{% content-ref url="export-metrics-to-prometheus/" %}
[export-metrics-to-prometheus](export-metrics-to-prometheus/)
{% endcontent-ref %}

{% content-ref url="export-events-to-ascent.md" %}
[export-events-to-ascent.md](export-events-to-ascent.md)
{% endcontent-ref %}
