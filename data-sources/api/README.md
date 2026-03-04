---
icon: webhook
---

# API Overview

The Ascent platform is architected as an API-first operational data fabric, meaning nearly every action available in the UI can be performed programmatically. This design makes it uniquely adaptable to both traditional telemetry and observability use cases, as well as non-traditional use cases (such as Robotic Process Automation (RPA), IoT monitoring, and automated compliance auditing).

Below are the primary customer-accessible capabilities that support deep integration and customization:

#### 1. Unified Platform APIs (RESTful)

Ascent provides extensive REST APIs that allow developers to treat the observability platform as a programmable backend.

* Flow & Fleet Management API: Programmatically deploy agents, update pipeline configurations, and manage data routing rules. This allows for "Observability as Code," where pipelines are automatically provisioned alongside new microservices.
* InstaStore™ Query API: Directly query the Lake from external applications. Because InstaStore indexes 100% of data in S3, custom business intelligence (BI) tools can pull historical telemetry without the delays of "rehydration."
* Synthetic Monitoring API: Automate the creation and execution of complex user-journey scripts, DNS checks, and API tests, integrating them directly into CI/CD pipelines.

#### 2. Custom Forwarders (JavaScript-based)

For non-standard integration targets, Apica Ascent Flow offers Custom Forwarders.

<a class="button secondary"></a>

* Flexibility: Users can write custom JavaScript code directly within the Flow pipeline to transform or enrich data before sending it to a unique destination.
* Use Case: If you need to send specific security logs to a proprietary on-premise forensic tool or a niche government database, you can code the logic for that specific handshake and data format within Ascent.

#### 3. Programmable Webhooks & Payload Mapping

The platform features an advanced Webhook Engine that supports complex, multi-step integrations.

* Field & Payload Mapper: You don't just "send an alert." You can use the Payload Mapper to restructure the outgoing JSON to match the exact schema required by the receiving service (e.g., custom MS Teams cards, Jira tickets, or proprietary automation triggers).
*   Conditional Logic: Trigger different API calls based on whether an incident is "Triggered" or "Resolved," with support for Basic Auth, OAuth2, and custom headers.

    <a class="button secondary"></a>

#### 4. Adaptability for Non-Traditional Use Cases

The combination of these APIs and the ZebraTester scripting engine allows Ascent to handle scenarios beyond standard IT monitoring:

* IoT & IIoT Monitoring: Use lightweight agents and MQTT connectors to feed industrial data into the pipeline, utilizing Flow to normalize and secure data from "dumb" sensors.
* Mainframe Integration: Bridging legacy TN3270 environments with modern observability by using custom exporters that pipe z/OS data into the Ascent Lake.
* Financial Compliance Replay: Use the Flow Replay capability to programmatically re-process months of raw data against a new set of security or fraud-detection rules.

***

#### Summary of Integration Capabilities

| **Capability**  | **Customization Level** | **Best For**                                       |
| --------------- | ----------------------- | -------------------------------------------------- |
| REST APIs       | High (Programmatic)     | Automation, CI/CD, and custom BI dashboards.       |
| JS Forwarders   | Maximum (Code-based)    | Connecting to proprietary or non-standard targets. |
| Payload Mapping | Medium (Config-based)   | Tailoring alert schemas for third-party tools.     |
| TDO (Test Data) | High (AI-driven)        | Provisioning compliant test data for QA/Dev.       |

***

Would you like me to provide a sample JavaScript snippet for a Custom Forwarder to see how you can transform log data in-flight?
