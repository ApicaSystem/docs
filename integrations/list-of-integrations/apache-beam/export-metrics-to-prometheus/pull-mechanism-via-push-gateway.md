# Pull Mechanism via Push-Gateway

You can use the [LOGIQ-IO Connector](https://github.com/logiqai/logiq-io) provided by Apica Ascent via GitHub to push Apache Beam metrics to Push-Gateway.

## Setting up Push-Gateway via Docker (recommended)

In order to set up push-gateway, just run the provided docker image.

```bash
docker pull prom/pushgateway
docker run -d -p 9091:9091 prom/pushgateway
```

You'll now have an instance of push-gateway running on your machine, you can verify by running the below command.

```bash
docker ps
```

Once the instance is up and running, we can then specify it in our prometheus.yaml config file.

View the sample prometheus.yaml file below.

```yaml
scrape_configs:
  - job_name: 'pushgateaway'
    scheme: http
    static_configs:
    - targets: ['localhost:9091']
```

Great, now you will have Prometheus scraping the metrics from the given PushGateway endpoint.

## Setting up Apache Beam to export the Metrics to Push-Gateway

Now that you have configured the push-gateway and Prometheus, it's time that we start configuring the Apache Beam Pipeline to export the metrics to the Push-Gateway instance.

For this, we will refer to the tests written in the LOGIQ-IO Connector here.

```
package logiqio

import org.apache.beam.sdk.Pipeline
import org.apache.beam.sdk.transforms.Create
import org.apache.beam.sdk.metrics.Metrics
import org.apache.beam.sdk.transforms.DoFn
import org.apache.beam.sdk.transforms.ParDo
import kotlin.test.Test

class ApplyMetrics : DoFn<LogiqEvent, LogiqEvent>() {
    private var counter = Metrics.counter("Pipeline Metrics", "logiq_events_processed");

    @ProcessElement
    fun processElement() {
        counter.inc()
    }
}

class LibraryTest {
       @Test fun metrics() {
        val pipeline = Pipeline.create()

        val elems = List(1029) {
            LogiqEvent("ns$it", "$it Events occurred", it, "host-$it", "process-$it", "app-$it", "cos$it")
        }

        pipeline
            .apply("Create", Create.of(elems))
            .apply(ParDo.of(ApplyMetrics()))

        val result = pipeline.run()
        val metrics = result.metrics()

        PushGateway("http://localhost:9091/metrics/job/test").write(metrics)
    }
}

```

The `metrics()` method is responsible for sending the metrics to the given push-gateway endpoint. Once the pipeline has been modeled, we are good to view the result. we should be able to access the metrics of the PipelineResult at `PipelineResult.metrics`, now just pass this to the Push-Gateway class with the correct endpoint and call the `write()` method with the metrics.

Hooray, you have successfully pushed your Apache Beam Metrics to Push-Gateway. These metrics will shortly be scraped by Prometheus and you would be able to access them.

You can check your results on Push-gateway Instance and Prometheus Instance.

### Advanced

If you want to apply any transformations other than the default transformers, you can specify the functions with `withCounterTransformer, withDistributionTransformer, withGaugeTransformer` provided by the PushGateway class. This allows you to perform complex operations and achieve granularity within your metrics.
