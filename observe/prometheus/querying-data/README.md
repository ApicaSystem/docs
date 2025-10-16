# Writing queries

The Apica Ascent infra and application monitoring stack is compatible with Prometheus, Thanos, and Victoria Metrics and allows metrics to be pushed via the prometheus remote write protocol. This also allows user to query the metrics using standard PromQL style expressions. Using the query editor, type the PromQL query and see your data and create visualizations in an instant.

<figure><img src="../../../.gitbook/assets/image (563).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Head over to the [Time Series Insights](../../../autonomous-insights/time-series-ai-ml/) section to learn how to apply various anomaly and forecasting capabilities.
{% endhint %}

### Query language

The query language is nothing but the PromQL expression and any additional parameters that would be sent to the Prometheus Query API. The query starts with a `query=` prefix and ends with optional URL parameters that are sent to the query API

Let's look at an example

```
query=go_gc_duration_seconds&duration=15m&step=60
```

In the above query, we are looking for the `go_gc_duration_seconds` metric, sampled at 60-second intervals and duration for which data is needed which is the last 15 minutes.

The Prometheus Query API expects `start_time` and `end_time` to be provided in queries. Apica Ascent has a simplified `duration` syntax that is compatible with the Prometheus Query API.

Apica Ascent translates the duration values to appropriate start and end times before issuing the Query API call

\{% hint style="info" %Apica Ascent} Using the duration syntax allows you to construct dynamic time range queries without specifying start or end time.

```
example: instant query
  query=http_requests_total

example: range query
  query=http_requests_total&start=2018-01-20T00:00:00.000Z&end=2018-01-25T00:00:00.000Z&step=60s

example: until now range query
  query=http_requests_total&start=2018-01-20T00:00:00.000Z&step=60s
  query=http_requests_total&start=2018-01-20T00:00:00.000Z&end=now&step=60s
  
example: using duration
  # end is assumed now, start is end-duration
  query=http_requests_total&duration=1h5m10s20ms&step=60s 
  # end is (start + duration)
  query=http_requests_total&start=2018-01-20T00:00:00.000Z&duration=1h&step=60s 
  # start is (end - duration), end is now
  query=http_requests_total&duration=1h&step=60s
  #start is (end - duration), end is now
  query=http_requests_total&end=2018-01-20T00:00:00.000Z&duration=1h&step=60s 
```

### PromQL compatibility

Apica Ascent's query language is 100% compatible with PromQL, primarily because all query expressions are translated to appropriate Prometheus Query / Query range API calls.

Let's look at a more complicated expression below

```
query=(100-(avg(irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100))&duration=1h&step=30s
```

In the above example we are using several prometheus constructs

* Label based filtering e.g. `mode="idle"`
* Function such as `irate`, `avg`
* Using the vector syntax `[5m]`
* Mathematical operator like `* /` `-`
