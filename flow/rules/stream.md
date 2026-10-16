---
description: Cloned logs for isolated auditing and pipeline operation.
---

# STREAM

The Stream Rule allows you to clone and ship your logs to a new destination. You can change the namespace and/or the application name for your logs, and your logs will be cloned to the new destination. This rule comes in handy when isolating a certain set of logs for auditing. By using this feature, you can ensure that logs are duplicated and directed to a different namespace and application without disrupting the original log flow. This is particularly useful for maintaining a separate audit trail, where logs can be analyzed independently for compliance and security purposes. Additionally, this isolation helps perform thorough audits without interfering with the ongoing flow pipeline, providing a clear and uncontaminated log record.

### Create a STREAM Rule

Open **Configure Pipeline**, click **Add Rule** under **Rules**, then select **STREAM**. Complete the shared fields and condition in [.](./ "mention").

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-18 15-00-05.png" alt=""><figcaption></figcaption></figure>

Select preview data before choosing stream labels or condition fields. Fields load from **Pipeline Preview**. You can also type a label manually.

The STREAM form opens in **Pipeline Configuration**. Enter the namespace and application of the new stream:

<figure><img src="../../.gitbook/assets/Dark Apica Pipeline Configuration Dashboard.png" alt=""><figcaption></figcaption></figure>

**Store Original Stream**: Enabled by default. When enabled, the original data stream is stored in Instastore (data lake). Disable this option if you do not want to store the original logs, for example, when logs are duplicated to a new namespace and application.

**Namespace and Application**: Specify a new application name to clone the logs while retaining the original namespace. If you want to move the logs to a different namespace, update both the destination namespace and application name accordingly.

### Optionally Creating New Streams:

Monitor Missing Labels (optional)

The Monitor Missing Labels tab lets a stream rule target only events that lack one or more fields. When enabled, any event missing at least one of the selected labels is streamed to the destination. Events that contain all selected labels are left unchanged.

To enable it:

1. Open the Monitor Missing Labels tab on the stream rule.
2. Turn on the Monitor Missing Labels toggle.
3. In Labels to Check, select one or more fields. The list comes from fields seen in your sample logs; you can also type a field name and press Enter.

> Labels to Check lets a stream rule send only those events that are missing at least one of the selected fields to the destination, leaving events that contain all of them untouched.

If the toggle is off or no labels are selected, the rule streams every event that matches its condition.

<figure><img src="../../.gitbook/assets/Dark Apica Pipeline Configuration Dashboard (1).png" alt=""><figcaption></figcaption></figure>

Apply the pipeline to a dataflow. You can then visualize the pipeline flow as shown below.

### Pipeline View

The builder no longer shows a pipeline rules flow graph. Configure stream rules under **Rules**.

<figure><img src="../../.gitbook/assets/Apica Dark Pipeline Dashboard.png" alt=""><figcaption></figcaption></figure>
