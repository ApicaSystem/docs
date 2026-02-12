---
description: Forwarding Logs from Apica Ascent to Microsoft Sentinel
---

# Sentinel Forwarder

This guide explains how to forward logs from **Apica Ascent** into **Microsoft Sentinel** using the **Azure Log Analytics HTTP Data Collector API**.

Microsoft Sentinel does not provide a standalone ingestion endpoint. Instead, it consumes data stored in an **Azure Log Analytics workspace**. Logs forwarded from Apica into Log Analytics automatically become available to Sentinel for querying, analytics rules, and incident generation.

***

### Architecture Overview

```
Apica Ascent
   ↓
Azure Log Analytics Workspace
   ↓
Microsoft Sentinel
```

* Apica forwards logs to the Log Analytics HTTP Data Collector API
* Azure stores the data in a custom log table
* Sentinel queries and analyzes the data from that table

***

### Prerequisites

Before configuring the forwarder, ensure the following:

* A Log Analytics workspace exists
* Microsoft Sentinel is enabled on that workspace
* You have one of the following Azure roles on the workspace:
  * Log Analytics Contributor
  * Monitoring Contributor
  * Owner
* You can access **Azure Cloud Shell** (browser-based CLI)

***

### Required Azure Values

You will need the following values from Azure:

| Field        | Description                             |
| ------------ | --------------------------------------- |
| Workspace ID | GUID of the Log Analytics workspace     |
| Shared Key   | Primary shared key for the workspace    |
| Resource ID  | Azure resource ID of the workspace      |
| DNS Name     | Log Analytics ingestion endpoint suffix |

***

### Step 1: Retrieve the Workspace ID

1. Open **Azure Portal**
2. Navigate to **Log Analytics workspaces**
3. Select your workspace
4. On the **Overview** page, copy:
   * **Workspace ID**

***

### Step 2: Retrieve the Shared (Primary) Key using Azure Cloud Shell

The Azure portal no longer reliably displays shared keys. Use Cloud Shell instead.

1. In the Azure portal, click the **Cloud Shell ( >\_ )** icon
2. Select **Bash** if prompted
3. Paste and run the following command (replace values):

```bash
az monitor log-analytics workspace get-shared-keys \
  --resource-group "<RESOURCE_GROUP_NAME>" \
  --workspace-name "<WORKSPACE_NAME>"
```

4. Copy the value of:

```
primarySharedKey
```

This value will be used as the **Shared key** in Apica.

***

### Step 3: Retrieve the Workspace Resource ID

1. In Azure Portal, open the **Log Analytics workspace**
2. Click **Properties**
3. Copy the full **Resource ID**

Example:

```
/subscriptions/<subscription-id>/resourceGroups/<rg-name>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>
```

***

### Step 4: Configure the Apica Ascent Forwarder

Fill out the forwarder configuration as follows:

| Apica Field    | Value                                                                                                          |
| -------------- | -------------------------------------------------------------------------------------------------------------- |
| Workspace ID   | Log Analytics Workspace ID (GUID)                                                                              |
| DNS name       | `.ods.opinsights.azure.com`                                                                                    |
| Shared key     | Primary shared key                                                                                             |
| Log type       | <p>"Use Sourcetype in log as log type" as default </p><p><br>"Provide log type manually" for custom naming</p> |
| Type           | `ApicaAscentLogs` (example)                                                                                    |
| Resource ID    | Full workspace resource ID                                                                                     |
| Queue policy   | Drop incoming events                                                                                           |
| Filter forward | true                                                                                                           |
| Name           | `azure-sentinel-forwarder` (example)                                                                           |

***

### Step 5: Verify Log Ingestion

Once logs are forwarded, verify ingestion in Log Analytics.

#### Find the Custom Table

Custom logs appear as:

```
<LogType>_CL
```

Example:

```
ApicaAscentLogs_CL
```

#### Verification Query

```kusto
ApicaAscentLogs_CL
| sort by TimeGenerated desc
| take 20
```
