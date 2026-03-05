# Port Management

### Overview

The **Port Management** feature in Ascent allows administrators to **enable or disable specific network ports** (TCP and UDP) and direct traffic to internal Kubernetes services - **without raising a ticket**.

This feature is available in the **Admin Settings** under **Settings → Port Management**.

***

### Who Can Use This?

* Only users with **Admin** privileges can view and use the Port Management feature.

***

### Supported Standard Ports

The following ports are supported out of the box with their standard purposes:

***

| Port  | Description                | Protocol | Service     |
| ----- | -------------------------- | -------- | ----------- |
| 514   | Syslog                     | UDP      | logiq-flash |
| 515   | CEF (Common Events Format) | TCP      | logiq-flash |
| 517   | Raw TCP                    | TCP      | logiq-flash |
| 2514  | RELP TLS                   | TCP      | logiq-flash |
| 4317  | OTLP/gRPC                  | TCP      | tracing     |
| 4318  | OTLP/HTTP                  | TCP      | tracing     |
| 7514  | Syslog TLS                 | TCP      | logiq-flash |
| 7515  | CEF TLS                    | TCP      | logiq-flash |
| 9999  | json\_batch and tenant API | TCP      | logiq-flash |
| 14250 | Jaeger collector (gRPC)    | TCP      | logiq-flash |
| 14268 | Jaeger collector (HTTP)    | UDP      | logiq-flash |
| 20514 | RELP                       | TCP      | logiq-flash |
| 24224 | Fluentd forward            | TCP      | logiq-flash |
| 24225 | Fluentd forward TLS        | TCP      | logiq-flash |
| 25224 | Logstash                   | TCP      | logiq-flash |
| 25225 | Logstash TLS               | TCP      | logiq-flash |

## How to Enable a New Port

1. **Navigate to Admin Settings → Port Management**
2. Click **Enable New Port**.
3. In the drawer:
   * **LB Port Number**: External port to expose (e.g., `514` for Syslog)
   * **Protocol**: Select `TCP` and `UDP` depending on the type of traffic
   * **Target Service**: Internal Kubernetes service
   * **Target Service Port**: Port on the selected service
4. Click **Enable Port**

The port will now be listed in the table with the target mapping.

***

### How to Disable a Port

1. Find the port you want to disable in the table
2. Click **Disable**
3. Confirm the action

***

### FAQs

#### Q: Do I need to know the pod name or container?

**No.** You only need to know the internal **Kubernetes service name and port**. These are auto-populated in the dropdown.

#### Q: What if my port or protocol isn’t listed?

Enter any valid **port number** (`1-65535`) and select TCP or UDP.

#### Q: Why isn’t my port showing up after enabling?

Make sure:

* You selected the correct **Target Service** and **Target Port**
* Ensure the service is deployed and reachable

Try disabling and re-enabling it if needed.

#### Q: Can customers use this directly?

Yes, if they have admin access.

***

### Known Limitations

* **Target services** must be deployed in the same namespace.
* Port 80, 443, and 8081 are reserved and cannot be enabled.
* If the required internal service or port is missing, you won’t see it in the dropdown.

***

### Final Note

This feature makes port routing self-service and immediate. Use it carefully — misconfigured ports can expose internal services unintentionally.
