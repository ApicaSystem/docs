---
description: How to Use the Ascent Checks Data Source to Query Checks
icon: shield-check
---

# Checks

### Follow the steps below to create and execute a query using the Ascent Checks Data Source.

***

### 1. Go to the Queries Page

* Navigate to the queries page in your dashboard to begin
* In the Queries page, click on the "New Query" button to start a new query

<figure><picture><source srcset="../../.gitbook/assets/Screenshot 2025-01-29 at 2.31.58 PM.png" media="(prefers-color-scheme: dark)"><img src="../../.gitbook/assets/Screenshot 2025-01-29 at 2.29.38 PM.png" alt=""></picture><figcaption></figcaption></figure>

### 2. Select "Ascent Checks" from the Left Sidebar

* On the left sidebar, click on **Ascent Checks**. This will display a list of all available checks that you can query.

<figure><picture><source srcset="../../.gitbook/assets/Screenshot 2025-01-29 at 2.32.34 PM.png" media="(prefers-color-scheme: dark)"><img src="../../.gitbook/assets/Screenshot 2025-01-29 at 2.38.29 PM.png" alt=""></picture><figcaption></figcaption></figure>

### 3. Expand a check to uncover more details

* From the list, expand the check you want to query by clicking on it. This will show more details about the check.

<div align="left"><figure><picture><source srcset="../../.gitbook/assets/Screenshot 2025-01-29 at 2.40.21 PM.png" media="(prefers-color-scheme: dark)"><img src="../../.gitbook/assets/image (569).png" alt="" width="325"></picture><figcaption></figcaption></figure></div>

### 4. Append the CheckID to the Query Editor to consume this check.

* Click on the right arrow next to the check id to append it to the query editor

<figure><picture><source srcset="../../.gitbook/assets/Screenshot 2025-01-29 at 2.42.28 PM.png" media="(prefers-color-scheme: dark)"><img src="../../.gitbook/assets/Screenshot 2025-01-29 at 2.41.55 PM.png" alt=""></picture><figcaption></figcaption></figure>

### 5. Add Duration or Start/End Date

* **To use a specific time range**, enter the **start** and **end** times as Unix epoch values.
* **To query relative durations**, use the **duration** option with a human-readable format (e.g., `1d` for one day, `2h` for two hours, etc.)
* Example:
  * **Start**: `1609459200` (Unix epoch for the start time)
  * **End**: `1609545600` (Unix epoch for the end time)
  * **Duration**: `1d` (relative to the current time)

<figure><picture><source srcset="../../.gitbook/assets/Screenshot 2025-01-29 at 2.49.42 PM.png" media="(prefers-color-scheme: dark)"><img src="../../.gitbook/assets/Screenshot 2025-01-29 at 2.49.30 PM.png" alt=""></picture><figcaption></figcaption></figure>

### 6. Execute the Query

* Once your query is complete, click on **Execute** to run the query and see the results.

<figure><picture><source srcset="../../.gitbook/assets/Screenshot 2025-01-29 at 2.50.51 PM.png" media="(prefers-color-scheme: dark)"><img src="../../.gitbook/assets/image (570).png" alt=""></picture><figcaption></figcaption></figure>



{% hint style="info" %}


### Check Data Source Query Options

The query for the **Ascent Checks Data Source** is written in **YAML** format. The following options are supported:

* **check\_id** (Mandatory):\
  The `check_id` refers to the **checkguid** of the check. You can find this in the sidebar when expanding a check.
* **start (mandatory if no duration)**:\
  The **start** time, provided as a Unix epoch value, defines the beginning of the time range for your query.
* **end (mandatory if no duration)**:\
  The **end** time, also in Unix epoch format, defines the end of the time range for your query.
* **duration (mandatory if no start/end)**:\
  A human-readable format for relative durations. It supports the following units:
  * `s` for seconds
  * `m` for minutes
  * `h` for hours
  * `d` for days\
    Example: `2d` for two days ago, `1h` for one hour ago.
* **limit(optional)**:\
  The **limit** option allows you to specify the maximum number of check results to retrieve. This helps to control the size of the query results.

***

#### Query Execution Notes

* By default, results are sorted by time in **descending** chronological order.
{% endhint %}



















