---
description: >-
  This page explains how to forward logs to Azure Log Analytics from Apica
  Ascent
---

# Azure Log Analytics Forwarding

Logs can be forwarded to the Azure log analytics platform. This will enable running queries on log data which will provide more insights from data.

#### Prerequisite <a href="#prerequisite" id="prerequisite"></a>

* Azure log analytics workspace

#### Create Log Analytics Forwarder <a href="#create-log-analytics-forwarder" id="create-log-analytics-forwarder"></a>

* Navigate to the integrations page and select the forwarders tab
* Click on the "Add Forwarder" Button and select Log analytics
* Provide the `workspace id` of Log Analytics workspace
* Provide the `Shared Key` from Log Analytics workspace. This can be found under the agents menu in log analytics
* Select the log type If `Use source type in log as log type` is selected, then the value in the source type attribute from the log will be used as a custom table name. For example, if the log has source\_type `fluent bit` then those logs will be stored under `fluent bit` table in the log analytics workspace. If `Provide log type manually` is selected, then provide the log type manually in the `Custom log type` text field.
* Sending filtered data or raw data to the forwarder is controlled by the boolean value in `Filter Forward.`&#x20;
* Provide a name for the forwarder
* Click on Create

After creating the log analytics forwarder, it can be mapped to any namespace and application. The Log Analytics workspace will get the data once the logs are ingested into the namespace/application that is mapped.
