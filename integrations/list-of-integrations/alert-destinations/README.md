---
description: >-
  Users can choose a variety of incident management integrations to bring
  reliability into your production operations.
---

# Incident Management

When an alert triggers, Apica Ascent Insights sends alert details to its designated alert destinations. Apica Ascent Insights supports the following types of alert destinations.

* **E-mail**
* **ChatWork**
* **Generic Webhook (see** [**Webhooks**](./#slack) **page)**
* **HipChat**
* [**ilert**](../ilert.md)
* **Mattermost**
* **OpsGenie**
* **PagerDuty**
* **ServiceNow**
* **Slack**
* **Zendesk**
* **Zenduty**

## Configuring Destinations

To configure alert destinations navigate to **settings** and open the **“Alert Destinations”** tab

![](<../../../.gitbook/assets/Screenshot from 2022-07-04 17-13-01.png>)

### Email <a href="#email" id="email"></a>

{% hint style="info" %}
It’s required to [configure the e-mail](../../../admin/email-configuration-setup.md) server to receive e-mail notifications.
{% endhint %}

1. Click on + New Alert Destination”, and pick Email.
2. Specify the recipient’s name & email address.
3. The subject is configurable. It’s recommended to use format: **Alert {alert\_name} changed status to {state}.** alert\_name and state are template parameters and will be replaced by the URLs to give more information about the alert that will have occurred.

![James Smith's Email configuration](<../../../.gitbook/assets/Screenshot from 2022-07-04 16-45-37.png>)

Email destination is created by clicking the save button.

![Email Alert Destination](<../../../.gitbook/assets/Screenshot from 2022-07-04 16-46-00.png>)

### Slack <a href="#slack" id="slack"></a>

In your [slack](https://my.slack.com/services/new/incoming-webhook/) console, pick or create a channel such as #alerts-events in this example and create an incoming webhook by clicking on "Add Incoming Webhooks Integration"

![Slack Webhooks integration](<../../../.gitbook/assets/Screen Shot 2020-08-11 at 3.10.58 PM.png>)

In your Apica Ascent Insight's UI, Open the “Alert Destinations” tab in the settings screen, and click on ”+ New Alert Destination”. Pick “Slack” as the type. Set the name, channel, etc, and provide a “Slack Webhook URL”, from above

![Slack Destination Configuration](../../../.gitbook/assets/slack.png)

### Pager Duty <a href="#pagerduty" id="pagerduty"></a>

Obtain the PagerDuty Integration Key from your PagerDuty service. Use Events API v2 Integration Type.

![](<../../../.gitbook/assets/Screen Shot 2020-08-11 at 4.31.41 PM.png>)

After obtaining the Integration Key:

1. Open the “Alert Destinations” tab in the settings screen, and click on ”+ New Alert Destination”.
2. Pick “PagerDuty” as the type.
3. Populate mandatory fields are Name and Integration Key obtained earlier.

![PagerDuty Configuration](<../../../.gitbook/assets/Screenshot from 2022-07-04 17-01-18.png>)

### OpsGenie <a href="#opsgenie" id="opsgenie"></a>

In the OpsGenie UI, navigate to your **Teams** page and select the team for which you want to create the alert integration. In the example below we will use the logflow team.

{% hint style="info" %}
NOTE: More than one OpsGenie alert destination can be defined in Apica Ascent
{% endhint %}

![Select the team](<../../../.gitbook/assets/Screen Shot 2021-11-16 at 9.17.24 PM.png>)

On the Teams page, select **Add integration** and create a new **REST API HTTPS over JSON** Integration type

![Add an integration to the team](<../../../.gitbook/assets/Screen Shot 2021-11-16 at 9.17.38 PM.png>)

![REST API HTTPS OVER JSON](<../../../.gitbook/assets/Screen Shot 2021-11-16 at 9.17.53 PM.png>)

![](<../../../.gitbook/assets/Screen Shot 2021-11-16 at 9.18.49 PM.png>)

Copy the API integration key from the integration created above.

{% hint style="info" %}
The API Key must be created with **Read** and **Create and Update** permissions and must be **Enabled**
{% endhint %}

You are now ready to add the OpsGenie integration in Apica Ascent under alert destinations. Provide a name for the integration and the **OpsGenie API key**. You are now ready to receive incident notifications from Apica Ascent.

![OpsGenie Alert destination](../../../.gitbook/assets/2022-07-04_17-07.png)

#### OpsGenie alerts view for Apica Ascent alerts

You can now see the alerts being raised in the OpsGenie UI under the alerts tab.

![OpsGenie alerts table](<../../../.gitbook/assets/Screen Shot 2021-11-16 at 9.22.53 PM.png>) ![OpsGenie Apica Ascent generated alert detail](<../../../.gitbook/assets/Screen Shot 2021-11-16 at 9.23.18 PM.png>)

## Associating alert destinations to alert

Once the Alert destinations are created, one or more alert destinations can be configured in the alert create or edit UI. Each configured destination is notified whenever that alert triggers.

![](<../../../.gitbook/assets/Screenshot from 2022-07-04 17-08-34.png>)
