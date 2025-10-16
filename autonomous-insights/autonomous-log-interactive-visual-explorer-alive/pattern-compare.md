---
description: >-
  This section provides an overview of the feature, including its introduction,
  key functionalities, usage guidelines, and a step-by-step example
  demonstrating the Alive log comparison process.
---

# ALIVE Log Compare

## ALIVE Log Compare Introduction

Log events are massive and difficult to comprehend due to their machine/human-like information nature. Yet they contain helpful information that needs to be harvested to get the process going. This process includes maintaining smooth operation flow, debugging complex modern distributed systems, security overlooks, tracking changes, etc. It is highly desirable to discern anomalies out of the log events.

One simple heuristic technique for discerning anomalies is to compare the subject with a known golden sample, which yields outliers. Nevertheless, comparing event logs is not a trivial task. &#x20;

The ALIVE Log Compare utilises Apica Ascent's log analysis underlying feature pattern-signature and compares log pattern signatures across different time ranges. This feature is powerful and handy for separating needles from haystacks. &#x20;

Some of the key features

* Simple to use
* Large working set and capable of looking over a large volume of log events
* Isolate subtle and apparent differences
* Tracking log event changes
* Search for specific keywords in logs
* Set a threshold to refine search results, allowing you to adjust the strictness of pattern matching based on your requirements.

### Key Usage Direction

Users can begin by selecting a **namespace** and **application**, then loading all available logs. Once logs are fetched, they can navigate to the **"Alive"** tab and define a second **time range** for comparison. Initially, users may choose the same duration but for different time periods to analyze variations.

After defining the time range, clicking **"Apply"** will load logs for the selected **Time Range B**. Users can then apply filters such as:

* **Percentage-Based Comparison** – Compares log counts as a percentage.
* **Absolute Count Comparison** – Uses raw log counts without percentage adjustments.

A T**hreshold Filter** is available to refine results. If the difference in percentage or absolute count between **Time Range A** and **Time Range B** exceeds the set threshold, it is considered an anomaly, and the corresponding logs will be filtered out. To view all data, users can set the threshold to **0**, effectively disabling anomaly detection.\
By default threshold is set to **10%**.

The interface consists of three primary sections:

1. **Bar Chart Analysis** – Visual representation of log pattern variations.
2. **Donut Chart Statistics** – Summaries loaded log counts and difference exceeding the threshold.
3. **Log Table** – Displays log messages and their respective counts for **Group A** and **Group B**.

<figure><img src="../../.gitbook/assets/image (658).png" alt=""><figcaption><p>Example showing 3 sections.</p></figcaption></figure>



Additionally, a **Full-Screen Mode** is available for the bar chart, enabling a detailed investigation of log patterns and anomalies.

### Example Usage Steps

#### To compare patterns in the ALIVE tab, follow these steps:

1. Select a Namespace and an Application from the list.

<figure><img src="../../.gitbook/assets/image (648).png" alt=""><figcaption><p>Select Namespace and Application</p></figcaption></figure>

2. Select timerange and click on Apply.

<figure><img src="../../.gitbook/assets/image (651).png" alt=""><figcaption><p>Select timerange and click Apply</p></figcaption></figure>

3. Click **Fetch more logs** to fetch all logs for the selected configuration. you can increase the logs load count.

<figure><img src="../../.gitbook/assets/image (652).png" alt=""><figcaption><p>Fetch all logs</p></figcaption></figure>

4. Move to the Alive tab and select Compare from left pane.

<figure><img src="../../.gitbook/assets/image (653).png" alt=""><figcaption><p>Select Compare from Alive Tab</p></figcaption></figure>

5. Select a second Time Range (B) for comparison. You can choose a  the same duration in a different time frame and click Apply to load logs for Time Range B.

<figure><img src="../../.gitbook/assets/image (654).png" alt=""><figcaption><p>fetching logs for time range B</p></figcaption></figure>

6. Choose between **Percentage** or **Absolute** count comparison and adjust the Threshold Filter.

<figure><img src="../../.gitbook/assets/image (656).png" alt=""><figcaption><p>Selection for absolute, percentage and threshold%</p></figcaption></figure>

7. Now you can analyze the data between the two time ranges to gain deeper insights and identify patterns or anomalies.\


<figure><img src="../../.gitbook/assets/image (658).png" alt=""><figcaption><p>Insights for the Comparing two different time range.</p></figcaption></figure>

8. Click the **Full Screen** button to enlarge the **Bar Graph** for clearer analysis.

<figure><img src="../../.gitbook/assets/image (657).png" alt=""><figcaption></figcaption></figure>

### Key Benefits

* **Efficiency**: Reduces the time required to manually sift through logs by visually presenting pattern changes.
* **Accuracy**: Enhances the detection of anomalies or unusual patterns that may indicate security breaches, performance issues, or operational changes.
