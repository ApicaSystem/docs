# Object Store Forwarding

You may want to store all the log messages as raw file, and you may want to use it in future for further processing.

Apica provides a forwarder plugin for forwarding messages to object store. The log messages are stored as text file in the object store where each text file will be having collection of logs messages.

The maximum file size in the object store for forwarding logs can be configured using the `Maximum forwarding object size` . You can also configure the interval for flushing logs to object store using the `flush to bucket interval`

So the logs will be pushed to object store either if the log messages have accumulated to `Maximum forwariding object size` or if the duration is exceed more than `flush to bucket interval`

These two values can be configured when creating any object store forwarder.

### Supported Object Store <a href="#supported-object-store" id="supported-object-store"></a>

* Any S3 Compatible Object store
* Azure Blob Storage
