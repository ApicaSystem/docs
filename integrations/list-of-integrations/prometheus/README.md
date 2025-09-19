# Prometheus

Prometheus is an open-source system monitoring and alerting toolkit. Prometheus collects and stores its metrics as time-series data, i.e. metrics information is stored with the timestamp at which it was recorded, alongside optional key-value pairs called labels.

#### **What are metrics?** <a href="#what-are-metrics" id="what-are-metrics"></a>

In layperson terms, _metrics_ are numeric measurements. _Time series_ means that changes are recorded over time. What users want to measure differs from application to application. For a web server, it might be request times, for a databas&#x65;**,** it might be a number of active connections or number of active queries, etc.

Metrics play an important role in understanding why your application is working in a certain way. Let's assume you are running a web application and find that the application is slow. You will need some information to find out what is happening with your application. For example, the application can become slow when the number of requests is high. If you have the request count metric you can spot the reason and increase the number of servers to handle the load.

\
