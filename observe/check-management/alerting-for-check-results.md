# Alerting for Check Results

### Create Alert Destination <a href="#create-alert-destination" id="create-alert-destination"></a>

1.  Navigate to **Integrations** > **Alert** **Destinations** and click on **“New Alert Destination”**

    <figure><img src="../../.gitbook/assets/image (17).png" alt=""><figcaption></figcaption></figure>

    &#x20;
2.  Select your type of Alert Destination (This example will use an email recipient)

    <figure><img src="../../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>

    &#x20;
3. Enter a name and email address for the recipient. Subject Template can be customized as required. Currently, alert\_name and state are the supported placeholders.

<figure><img src="../../.gitbook/assets/image (19).png" alt=""><figcaption></figcaption></figure>

C[lick **“Create”** to save your Alert Destination](#user-content-fn-1)[^1].

### Add Alerting to your Synthetics Check <a href="#add-alerting-to-your-synthetics-check" id="add-alerting-to-your-synthetics-check"></a>

1. Navigate to **Explore** > **Check Analytics** and find your check
2.  Under the more options (kebab menu) select **New Alert**

    <figure><img src="../../.gitbook/assets/image (20).png" alt=""><figcaption></figcaption></figure>

    &#x20;
3. Configure the alert
   1. **Alert Name** - Give your alert a unique name
   2. **Trigger alert when** - Most common option for synthetics you want to be alerted when the check is considered “down”, when the measuring is not working as intended. Select the “severity” column and the severity value you want to be alerted on.
      1. Example #1 - Severity is equals to Critical
         1. This will only alert when the check severity is Critical
      2. Example #2 - Severity is not equal to info
         1. This will alert when the check severity is anything but Info
   3. **Refresh Interval** - How often the alert should be executed
   4. **Alert Severity** - Severity of the alert
   5.  **Alert Destinations** - The recipient(s) of the alert, as configured earlier. Multiple selections are possible.

       <figure><img src="../../.gitbook/assets/image (24).png" alt=""><figcaption></figcaption></figure>

<mark style="color:purple;">**NOTE: Based on your Refresh Interval, whenever this check reports as Critical, an Email will be sent to your Alert Destination.**</mark>

\


[^1]: 
