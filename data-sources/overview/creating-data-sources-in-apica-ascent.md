# Creating Data Sources in Apica Ascent

## Creating Data Sources in Apica Ascent

Apica Ascent allows you to connect multiple data sources for unified observability across logs, metrics, checks, and reports.\
Follow the steps below to configure basic data sources to interact with metrics, logs, checks and reports.

***

### 1. Ascent Logs

**Purpose:** Enables access to logs coming in different dataflows.

**Steps:**

1. Navigate to **Integrations → Data Sources**.
2. Click **Add New Data Source**.
3. Select **Logs** from the available data source types.
4.  In the **Name** field, enter:

    ```
    Ascent Logs
    ```
5. Click **Save**.
6. After saving, click **Test Connection**.
   * Expected Result: `Success`

***

### 2. Ascent Reports

**Purpose:** Enables access to creating reports in Ascent.

**Steps:**

1. Navigate to **Integrations → Data Sources**.
2. Click **Add New Data Source**.
3. Select **Reports**.
4.  In the **Name** field, enter:

    ```
    Ascent Reports
    ```
5. Click **Save**.
6. Click **Test Connection**.
   * Expected Result: `Success`&#x20;

***

### 3. Ascent Checks

**Purpose:** Connects to Ascent's synthetic check results for analysis and visualization.

**Steps:**

1. Navigate to **Integrations → Data Sources**.
2. Click **Add New Data Source**.
3. Select **Checks**.
4.  In the **Name** field, enter:

    ```
    Ascent Checks
    ```
5. Click **Save**.
6. Click **Test Connection**.
   * Expected Result: `Success`

***

### 4. Ascent Metrics

**Purpose:** Integrates the Prometheus endpoint used by Ascent to access metrics.

**Steps:**

1. Navigate to **Integrations → Data Sources**.
2. Click **Add New Data Source**.
3. Select **Apica Ascent Prometheus**.
4.  In the **Name** field, enter:

    ```
    Ascent Metrics
    ```
5.  In the **Apica Prometheus API URL** field, enter:

    ```
    http://<namespace>-thanos-query:9090
    ```

    * Replace `<namespace>` with your environment’s Kubernetes namespace (for example: `apica-thanos-query:9090`).
6. Click **Save**.
7. Click **Test Connection**.
   * Expected Result: `Success`

***

### Verification

After completing all the configurations:

* Each data source will appear under **Integrations → Data Sources**.
* Dashboards and queries can now utilize these sources for visualization and alerting.
