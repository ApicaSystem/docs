---
description: >-
  The JS Code forwarder is a robust batch processing tool designed to
  efficiently handle and forward batches of events.
---

# JS Code Forwarding

#### Overview <a href="#overview" id="overview"></a>

The **JS Code forwarder** is a robust batch processing tool designed to efficiently handle and forward batches of events. It supports forwarding arrays of event objects to a specified endpoint, and includes built-in functions for recording metrics, making HTTP requests, and logging.

This forwarder, equipped with JavaScript execution capabilities, revolutionises log shipping by allowing users to dynamically process transported logs in real-time with custom JavaScript functions.

For example, users can define JavaScript functions to scan incoming logs, identify specific patterns or anomalies, and automatically trigger actions, like filing tickets in response to detected issues. This seamless integration of JavaScript-based log processing directly within the forwarder streamlines the log management workflow, enabling organisations to swiftly and efficiently respond to critical events or conditions detected within their log data, thereby enhancing operational efficiency and proactive incident management.

<figure><img src="../../.gitbook/assets/image (528).png" alt=""><figcaption><p>JS Code Forwarder in forwarders section</p></figcaption></figure>

### Implementation <a href="#implementation" id="implementation"></a>

**Batch Forwarding**

The JS Code forwarder operates as a batch forwarder, capable of receiving and processing one or more events in a single batch. It handles the array of event objects and forwards them to the designated endpoint.

**Metrics Recording**

A built-in metric function logs essential forwarder metrics, such as successful data forwarding instances and the total bytes of data forwarded. This aids in monitoring and optimizing the forwarder’s performance.

#### Design <a href="#design" id="design"></a>

The JS Code forwarder processes batched events instead of individual events, passed to the forwarder as an array.

**Event Object Format**

Each event within the batched array follows a specific format:

Copy

```json
[
  {
    "event": {
      "group_by": "grp2",
      "facet": "45",
      "host_uuid": "Logiq_a0e45f01c76e92",
      "sequence": "1",
      "_size": "620",
      "path": "./flash-test-framework",
      "some_int": "964",
      "kubernetes_annotations_cni_projectcalico_org/podip": "45",
      "hostname": "Ranjans-MacBook-Pro.local",
      "timestamp": "2024-06-02T00:59:45.009671Z",
      "message": "flash test message FAIL 0 2024-06-01T17:59:45-07:00 #:0:# Facet1=v45 \"metric_type\" : devices \"LoginSuccess\" Facet2=v4024 Facet4=v-14 FacetU=6e23c405-fb70-420c-b286-840ff2277942 nginx: response code 400"
    },
    "timestamp": "2024-06-02T00:59:45Z",
    "sourcetype": "_json",
    "host": "Ranjans-MacBook-Pro.local",
    "severityString": "critical"
  },
  {
    "event": {
      "group_by": "grp4",
      "timestamp": "2024-06-02T00:59:45.009692Z",
      "hostname": "Ranjans-MacBook-Pro.local",
      "facet": "45",
      "sequence": "2",
      "path": "./flash-test-framework",
      "message": "flash test message FAIL 1 2024-06-01T17:59:45-07:00 #:1:# Facet6=v45 \"metric_type\" : json \"LoginSuccess\" Facet2=v4292 Facet3=v-14 ",
      "kubernetes_annotations_cni_projectcalico_org/podip": "45",
      "some_int": "382",
      "_size": "539",
      "host_uuid": "Host_4567aefcd"
    },
    "timestamp": "2024-06-02T00:59:45Z",
    "sourcetype": "_json",
    "host": "Ranjans-MacBook-Pro.local",
    "severityString": "emergency"
  }
]
```

#### Built-in Variables and Functions <a href="#built-in-variables-and-functions" id="built-in-variables-and-functions"></a>

In the jscode forwarder code environment, the following built-in variables and functions are available:

**Functions**

* **`fetchSync(url, cfg)`**: Makes a synchronous HTTP request to the specified endpoint.
  * **Arguments**:
    * `url`: The URL of the target endpoint.
    * `cfg`: Configuration object containing the method, headers, and body of the request.
  * **Returns**: The response from the target endpoint.
* **`console.log(message)`**: Logs messages to the console.
  * **Arguments**: `message` (string) - The message to log.

**Variables**

* **`Events`**: An array containing the events to be forwarded to the target endpoint.

#### Example <a href="#example" id="example"></a>

The following example demonstrates how to implement a jscode forwarder:

Copy

```javascript
let cfg = {
    method: "POST",
    headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer <API_KEY goes here>"
    },
    body: JSON.stringify(Events),
};

let ret = fetchSync("https://target.example.com", cfg);
console.log("Response from the endpoint:", ret);
```

This example shows how to configure and use the `fetchSync` function to forward the batched events to a specified endpoint. The `cfg` object includes the HTTP method, headers, and the body containing the events to be forwarded.

#### Conclusion <a href="#conclusion" id="conclusion"></a>

The JS Code forwarder is a powerful tool for batch forwarding of events, equipped with built-in functions for HTTP requests and console logging. By following this documentation, users can effectively implement and utilize the jscode forwarder in their systems.
