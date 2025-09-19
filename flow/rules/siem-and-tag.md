# SIEM

SIEM rule is Log2Metric rule that can be used to tag data for any interesting events. Apica Ascent Log2Metrics is a powerful feature that helps you convert your log data into a real-time metric. Using Log2Metrics, you can visualize your log data, plot distributions, create a custom index, and create alerts for events.

This is useful for identifying the interesting events that may occur in logs in real-time. For example track, user login failures, track load balancer or ingress status codes, etc... See the section about [Log2Metrics](../../observe/log-management-overview/metrics-and-custom-indices.md) for additional information.

Apica Ascent has hundreds of inbuilt SIEM rules which can be accessed on the "Explore -> Pipeline -> Rules" tab .

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-22 13-42-30.png" alt=""><figcaption><p>Rules List</p></figcaption></figure>

### Creating an SIEM Rule in Apica Ascent

Follow these steps to create a SIEM or TAG rule in your pipeline:

#### 1. Go to Your Pipeline

* Open the desired pipeline.
* Click **Configure Pipeline** from the pipeline’s action menu.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-05-21 17-48-48.png" alt=""><figcaption><p>Pipelines List</p></figcaption></figure>

#### 2. Add a New SIEM Rule

#### 2. Add a New Rule

* Hover over the `+ Add Rule` button.
* Select `SIEM` from the rule type dropdown.
* A modal will open with a form organized into tabs.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-11 17-59-06 (1).png" alt=""><figcaption><p>Choose Rule</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-11 17-59-30.png" alt=""><figcaption><p>SIEM Rule</p></figcaption></figure>

#### Step-by-Step Rule Configuration

#### 3. Fill in Rule Details

**A. Details Tab**

Configure the basic rule properties:

*   **Name:**

    Enter a unique and descriptive name for the SIEM rule (e.g., `404 Login Attempt - User Not Found`).
*   **Level:**

    hoose the severity (Low, Medium, High, Critical).
*   **Group:**

    Assign the rule to an existing group or create a new one (e.g., _Login Access_).
*   **Description:**

    Explain the rule’s purpose (e.g., “Detects login attempts with 404 errors when the username doesn’t exist”).
*   **Add Conditions (`+ Add More Parameters`):**

    Set filters to define what this rule should detect.\
    Example condition: `event_type == login_attempt && status_code == 404`  &#x20;

Sample SIEM rule dashboard

**B. Metric Labels Tab**

This tab allows you to tag logs with structured labels for visualization, analysis, and metric generation.

> **Note:** Please choose the data flow, namespace and application to auto-populate the available field labels.

*   **Labels:**

    Choose fields (e.g., event type, username, status code) to label logs under the `_event` structure. These labelled events can later be used to generate metrics or reports.
*   **Default Label for Visualization:**

    Select the main label field to group results in visualizations and PromQL queries (e.g., group by `status_code`, `username`, etc.).

**C. Dashboard tab**

This section is for visualizing rule outputs via dashboards.

*   **Select dashboard for visualization:**

    Choose or create a dashboard to show data from this rule (e.g., _404 Login Attempts_).
*   **Select Values below to plot:**

    Choose which field(s) from the logs you want to visualize (status\_code, port).
* **Plot Types:**
  * **Occurrences:** View average occurrences over time.
  * **Distributions:** View percentile metrics (50th, 90th, 99th) and average duration over the last 5 minutes.

**D. Alerts tab**

This tab allows you to configure alerts for your SIEM rule based on the metrics or log queries you've defined. To enable alerting, switch **"Enable Alert"** to active. Then, specify the **threshold value** and **comparison operator** (e.g., `> 5`) to determine when the alert should trigger based on the rule’s output.

Next, choose your **alert destination channel** (such as **email**, **Slack**, or **webhook**) to receive notifications. This option becomes available once the alert is activated.

You can also fine-tune alert behaviour by configuring parameters such as:

* **Rearm**: Controls how frequently the alert can be re-triggered after it has already fired.
* **Refresh Interval**: Defines how often the query is evaluated to check if the alert condition is met.

***

**Example: Detect Login Attempts with 404 Errors**

***

#### Enter the following details:

* **Name:** login attempt with 404 user not found
* **Level:** Low
* **Group:** _Login Access_
* **Description:** Detects login attempts with HTTP 404 status (user not found)
* **Add Condition:** `event_type == login_attempt` && `status_code == 404`

<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-11 18-06-16.png" alt=""><figcaption><p>Rule Details</p></figcaption></figure>



<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-11 18-09-25.png" alt=""><figcaption><p>Add condition</p></figcaption></figure>

**Metric Labels:**

* **Labels:** username
* **Default Label for Visualization:** username

<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-11 21-21-26.png" alt=""><figcaption><p>Select Metric Labels</p></figcaption></figure>

**Dashboard Settings:**

* Create or select: _login attempt 404_ dashboard
* Plot Values: `status_code`
* Plot Metrics: Choose the plot type based on the requirements.
  * Plot occurances: **status\_code**, this will plot a time series graph of the occurrence of variable average over the time during ingest. It will not be a exact per event graph but will be an overview of what is happening.
  * Plot distribution: **status\_code**, this will plot the following graphs:
    * Average duration of each observation over the last 5 mins
    * Observation mapped into 50th, 90th and 99th percentile bucket

<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-11 21-36-47.png" alt=""><figcaption><p>Dashboard and Plot Metrics</p></figcaption></figure>

**Alerts:**

* Enable alerts
* Change the desired value and operator for the alert evaluation.
* Send to: Slack/email/webhook
* Rearm & Refresh Interval: Configure based on alerting needs

<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-11 21-40-51.png" alt=""><figcaption><p>Enable Alert Rule Metric</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-11 21-41-30.png" alt=""><figcaption><p>Enable Alert for the field metric</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-11 21-41-30 (1).png" alt=""><figcaption><p>Destination and Config Parameters</p></figcaption></figure>

After saving and applying the pipeline to the data flow, wait a few minutes and then verify that the rule-based dashboards and alerts are functioning correctly.

<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-11 21-49-04.png" alt=""><figcaption><p>Configured Dashboard</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-12 10-06-34.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot from 2025-06-11 21-54-24.png" alt=""><figcaption><p>Configured alerts</p></figcaption></figure>
