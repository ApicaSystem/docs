# Data Retrieval

## Retrieving and Transforming Data

The /fetch API provides fast, one-request access to common complex data extraction requirements. It allows for fetch submissions in both FlatBuffers and JSON formats, and returns DF4 output format available in both FlatBuffers and JSON encoding.

API description: See "Retrieving and Transforming Data" under [Developer API](https://apidocs.apica.io/irondb/dev)

### Transforms

**Numeric (`kind` = `numeric`)**

* `average` - the average of measurements in the period.
* `sum` - the sum of measurements in the period.
* `count` - the number of measurements in the period.
* `counter` - the positive rate of change of the measurements in the period.
* `counter_stddev` - the standard deviation of the positive rate of change of the measurements in the period.
* `derivative` - the rate of change of the measurements in the period.
* `derivative_stddev` - the standard deviation of the rate of change of the measurements in the period.
* `stddev` - the standard deviation of measurements in the period.

**Histogram (`kind` = `histogram`)**

* `none` - pass the input through unmodified.
* `count` - the number of samples in each histogram.
* `rate` - the number of samples per second in each histogram (count/period).
* `count_above` - calculate the number of samples that are greater than the supplied parameter.
  * `transform_params` the threshold value for measurements.
* `count_below` - calculate the number of samples that are less than the supplied parameter.
  * `transform_params` the threshold value for measurements.
* `inverse_percentile` - calculate what percentage of the population is smaller than the supplied parameter (output in \[0,100] or NaN)
  * `transform_params` the threshold value for measurements.
* `inverse_quantile` - calculate what ratio of the popultion is smaller than the supplied parameter (output in \[0,1] or NaN)
  * `transform_params` the threshold value for measurements.
* `percentile` - produce a numeric quantile after dividing the parameter by 100.
  * `transform_params` a value in the range \[0,100]
* `quantile` - produce a numeric quantile
  * `transform_params` a value in the range \[0,1]
* `sum` - approximate sum of the samples in each histogram
* `mean` - approximate mean value of the samples in each histogram

**Text (`kind` = `text`)**

* `none` - pass the input through unmodified.
* `count` - return a numeric count of the number of text entries in the period.
* `count_cumulative` - return a cumulative count of text entries starting at zero for the first period requested.
* `count_distinct` - return a numeric count of the number of unique text entries in the period.
* `count_distinct_cumulative` - return the total distinct values seen from the beginning of the first period requested through the end of the current period.
* `count_transition` - return a numeric count of the number of times a text entries changes during the period. The first period's first value does not count as a transition.
* `count_transition_cumulative` - return the cumulative transitions seen from the beginning of the first period requested through the end of the current period.
* `rate` - return the text entries per second seen in each period.
* `rate_distinct` - return the unique text entries per second in each period.
* `rate_distinct_cumulative` - return the newly unique text entries per second in each period.
* `rate_transition` - return the number of text entry changes per second in each period.

### Reductions

**`pass` - pass the inputs to outputs unmodified**

* `method_params` none
* Inputs can be numeric, histogram, or text.

**`groupby_mean` - group inputs and calculate a mean over the grouping**

* `method_params` a list of tag categories on which to perform grouping
* Inputs must be numeric.

**`groupby_sum` - group inputs and calculate a sum over the grouping**

* `method_params` a list of tag categories on which to perform grouping
* Inputs must be numeric.

**`groupby_merge` - group inputs and merge into a histogram stream**

* `method_params` a list of tag categories on which to perform grouping
* Inputs must be either numeric or histogram.

**`mean` - calculate the mean across input streams**

* `method_params` none
* Inputs must be numeric.

**`merge` - group inputs and merge into a histogram stream**

* `method_params` none
* Inputs must be either numeric or histogram.

**`sum` - calculate the sum across input streams**

* `method_params` none
* Inputs must be numeric.

**`topk` - filter a set of inputs to the top K**

* `method_params` : `[ K, <mech>, <mech_param> ]`
* Inputs must be either numeric or histogram.
* Allowable `mech` values are `mean` (default), `max`, or `quantile`. The `quantile` `mech` value requires a `mech_param` in the range \[0,1]. All measurements in the input stream are accumulated and a mean or quantile is calculated. This calculated value is used as a rank for the stream and the K largest ranks are selected and passed to the output set.

## Retrieving Graphite Data

Fetches Graphite-style data. The data returned is always **average** data and this endpoint will scale the `rollup_span` to match the time range of data requested.

See [graphite rendering](../integrations/graphite.md#get).
