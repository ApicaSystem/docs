# Splunk Forwarding

After ingestion, data can be forwarded to a Splunk instance. Apica Ascent supports two primary approaches for forwarding data to Splunk:

1. **Using Splunk Forwarders**
   1. HEC Forwarder
   2. Syslog Forwarder (uses TCP)
   3. Syslog CEF Forwarder (uses TCP)
2. **Using a Splunk Forwarder Proxy Source Extension**

The **Forwarder Proxy Source Extension** is recommended when advanced delivery guarantees are required, such as queueing, retries, acknowledgments, backpressure handling, and load balancing. It can also be chosen when data needs to be forwarded to multiple indexers.

The **Ascent Splunk Forwarders** (HEC, Syslog, Syslog CEF) are suitable for lighter workloads where indexer load is not significant and successful delivery is generally assured.
