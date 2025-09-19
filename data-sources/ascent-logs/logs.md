---
description: >-
  How to use Ascent Logs data source to query logs from namespaces and
  applications
---

# Logs

### Follow the steps below to create and execute a query using the Ascent Logs Data Source.

***

### 1. Go to the Queries Page

* Navigate to the queries page in your dashboard to begin
* In the Queries page, click on the "New Query" button to start a new query

<figure><picture><source srcset="../../.gitbook/assets/Screenshot 2025-01-29 at 2.31.58 PM.png" media="(prefers-color-scheme: dark)"><img src="../../.gitbook/assets/Screenshot 2025-01-29 at 2.29.38 PM.png" alt=""></picture><figcaption></figcaption></figure>

### 2. Select "Ascent Logs" from the Left Sidebar

* On the left sidebar, click on **Ascent Checks**. This will display a list of all available checks that you can query.

<figure><img src="../../.gitbook/assets/image (590).png" alt=""><figcaption></figcaption></figure>

### 3.Write the query

* Write the query in YAML format and execute query, for example:

```
namespace: "Alerts"
application: "alerts-app"
keyword: ''
duration: '1h'
```

<figure><img src="../../.gitbook/assets/image (591).png" alt=""><figcaption></figcaption></figure>
