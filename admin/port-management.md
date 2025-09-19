# Port Management

### Overview

The **Port Management** feature in Ascent allows administrators to **enable or disable specific network ports** (TCP/UDP/SCTP) and direct traffic to internal Kubernetes services — **without raising a ticket**.

This feature is available in the **Admin Settings** under **Settings → Port Management**.

***

### Who Can Use This?

* Only users with **Admin** privileges can view and use the Port Management feature.

***

### Supported Standard Ports

The following ports are supported out of the box with their standard purposes:

***

| Port  | Description                    | Protocol | Service        |
| ----- | ------------------------------ | -------- | -------------- |
| 514   | Syslog                         | UDP      | logiq-flash    |
| 515   | Syslog with TLS                | TCP      | logiq-flash    |
| 2514  | RELP PORT TLS                  | TCP      | logiq-flash    |
| 4317  | OTLP/gRPC                      | TCP      | logiq-flash    |
| 4318  | OTLP/HTTP                      | TCP      | logiq-flash    |
| 7514  | SYSLOG\_DEFAULT\_PORT\_TLS     | TCP      | logiq-flash    |
| 9998  | Internal Ops                   | TCP      | logiq-flash-ml |
| 9999  | json\_batch and tenant API     | TCP      | logiq-flash    |
| 14250 | Jaeger collector (HTTP)        | TCP      | logiq-flash    |
| 14268 | Jaeger agent (Thrift Protocol) | UDP      | logiq-flash    |
| 16686 | Jaeger UI                      | TCP      | logiq-flash-ml |
| 20514 | RELP port                      | TCP      | logiq-flash    |
| 24224 | Fluentd forward port           | TCP      | logiq-flash    |
| 24225 | Fluentd TLD                    | TCP      | logiq-flash    |
| 25224 | Logstash                       | TCP      | logiq-flash    |
| 25225 | Logstash TLS                   | TCP      | logiq-flash    |

\


### How to Enable a New Port

1. **Navigate to Admin Settings → Port Management**
2. Click on the **Enable New Port** button on the top-right.
3. In the drawer:
   * **LB Port Number**: Enter the external Load Balancer port to expose (e.g., `514` for Syslog)
   * **Protocol**: Select `TCP`, `UDP`, or `SCTP` depending on the type of traffic
   * **Target Service**: Choose the internal Kubernetes service that will handle the traffic
   * **Target Service Port**: Choose the internal port from the selected service
4. Click **Enable Port**

The port will now be listed in the table with the target mapping.

***

### How to Disable a Port

1. Find the port you want to disable in the table
2. Click the **Disable** button next to it

This removes the port from the Load Balancer and internal ingress.

***

### FAQs

#### Q: Do I need to know the pod name or container?

**No.** You only need to know the internal **Kubernetes service name and port**. These are auto-populated in the dropdown.

#### Q: What if my port or protocol isn’t listed?

You can type in any valid **port number** (e.g., `514`, `24224`, `4317`) and choose the appropriate protocol.

#### Q: Why isn’t my port showing up after enabling?

Make sure:

* You selected the correct **Target Service** and **Target Port**
* The service is deployed and reachable

Try disabling and re-enabling it if needed.

#### Q: Can customers use this directly?

Yes, if they have admin access.

***

### Known Limitations

* **Target services** must be deployed in the same namespace.
* If the required internal service or port is missing, you won’t see it in the dropdown.

***

### Final Note

This feature makes port routing self-service and immediate. Use it carefully — misconfigured ports can expose internal services unintentionally.
