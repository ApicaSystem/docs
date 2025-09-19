# Export Metrics to Prometheus

By utilizing the Ascent I/O Connector, we can directly send the Apache Beam metrics created , to Prometheus as Metrics.



There are two mechanisms to achieve this, namely :

### Push Mechanism done via remote-write method

In the context of the push mechanism done via remote-write, Prometheus can be used to collect and store the data that is being pushed from the source system to the destination system. Prometheus has a remote-write receiver that can be configured to receive data using the remote-write protocol.

Once the data is received by the remote-write receiver, Prometheus can store the data in its database and perform real-time analysis and aggregation on the data using its powerful query language. This allows system administrators and operators to monitor the performance of various components of the system in real-time and detect any issues or anomalies.

In this way, Prometheus can replicates it data to third-party system for backup , analysis and long-term storage .   &#x20;

### Pull Mechanism done via Push-Gateway method&#x20;

In a distributed system, the pull mechanism is a common way of collecting data from various sources by querying them periodically. However, there may be cases where it's not feasible to collect data using the pull mechanism, such as when the data is only available intermittently or when it's costly to query the data source repeatedly. In such cases, the PushGateway method can be used to enable a pull mechanism via a push approach.

Prometheus offers a PushGateway component that allows applications to push metrics into it via an HTTP API. Applications can use this API to push metrics to the PushGateway instead of exposing an endpoint for Prometheus to scrape. Prometheus can then pull the data from the PushGateway, acting as if it were a normal Prometheus target.

To use the push gateway method in a pull mechanism, applications periodically push their metrics data to the Push-gateway via the HTTP API. Prometheus, in turn, periodically queries the Push-Gateway to collect the data. The Push-Gateway stores the metrics data until Prometheus scrapes it, which can be configured to occur at regular intervals.

This approach can be useful when collecting metrics from systems that are not always available or when it's not feasible to pull the data frequently. Additionally, it allows applications to expose metrics data without exposing an endpoint for Prometheus to scrape, which can be more secure.

Overall, the Push-Gateway method can be a powerful tool in enabling a pull mechanism for collecting metrics in a distributed system via Prometheus.

The "LOGIO-IO" Connector currently accepts pushing metrics to Prometheus by this method. For more info, refer to this post.

[pull-mechanism-via-push-gateway.md](pull-mechanism-via-push-gateway.md "mention")



