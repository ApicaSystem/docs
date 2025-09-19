# Configuring Alerts



Alerts can be used to notify recipients about status changes to your checks. They can be sent by email address, SMS messages, or integrated 3rd party service.

Complex alerting setups can be tricky. If you have any questions about alert configuration, please send a support ticket to [support@apica.io](mailto:support@apica.io), and we will help you with the setup and testing process.

| Here’s an example of some configured recipients, some of which are disabled: |   |
| ---------------------------------------------------------------------------- | - |
| Alerts configured for a browser check, all enabled:                          |   |

**Note:** The alerts are all enabled, but since most of the targets are disabled, alerts will be triggered but not sent for these.

Apica’s alerting requires that the monitoring checks be defined, the thresholds and conditions for an alert set, and a destination where this information will ultimately end.

This section introduces the concept of alerting using a push concept, with Webhooks defining where the alerts' POST body gets sent. The contents of the alert messages are populated with placeholders that convey the actual values needed by either the Webhook-enabled service, the SMS text, or the email.

* **Alerts**
  * Are fired/triggered when a threshold has been passed, or a condition has been met.
  * Have Targets (places to send the alert to)
* **Targets**
  * Can be directly sent to a person/group
    * Email
    * SMS
  * It can be a Webhook-enabled service like OpsGenie or Splunk
    * Push style to the service ingestion endpoint
    * Not a REST-API Pull model
* **Placeholders**
  * Messages: The messages these alerts create can contain information/metric Message Placeholders filled in during message generation.
  * For **Webhooks**: WebHook Placeholders are what the service needs to route the incoming alert message correctly. These placeholders can be customized for the service to be integrated.

## The Alert Setup Process <a href="#configuringalerts-thealertsetupprocess" id="configuringalerts-thealertsetupprocess"></a>

From the **Manage Alerts** view, you can assign individual or group alerts for each check, which will notify them of any status change according to the preferred severity.

#### Screenshots <a href="#configuringalerts-screenshots" id="configuringalerts-screenshots"></a>



In Manage Alerts, checks are displayed by Top Level Group and Subgroup, much as they appear in Manage checks, but with an icon along the right side with which Alerts can be assigned.

In the upper right, you can toggle between Alerts and Recipients.

**Workflow**

The general workflow for creating alerts is:

* Create or Add a User to receive the alerts (Who gets the alert?).
* Create Targets for the recipients' delivery method (How are the alerts delivered? e.g., PagerDuty, SMS Text, Email, etc.).
* (Optional) Create a Group containing multiple recipients for the alert.
* Create the Alerts themselves by selecting checks and assigning recipients.

| **Step**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | **Screenshot** |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| <h4 id="configuringalerts-addrecipients">Add Recipients</h4><p>The Users and Groups you set to receive Alerts are set up in the <strong>Recipients</strong> tab.  </p><p>There is a column to define Users and their contact information, as well as Groups.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |                |
| <h4 id="configuringalerts-firststep-addauser">First Step: Add a User</h4><p>Recipients are the users or groups of users you select to receive the alerts.</p><ul><li>Click the <strong>Add User</strong> button.</li><li><p>Enter the necessary user information:</p><ul><li>User <strong>Name</strong></li><li>User <strong>Description</strong></li><li>User <strong>Phone Number</strong> (doubles as Target)</li><li>User <strong>Email</strong> (doubles as a Target)</li><li>Click the <strong>Create User</strong> button.</li><li>The user is created, containing the two default targets.</li></ul></li></ul>                                                                                                                                                        |                |
| <h4 id="configuringalerts-secondstep-addgroup">Second Step: Add Group</h4><p>Recipient groups are collections of user targets you select to receive the alerts.</p><p><strong>Note:</strong> You need to create the users and targets before you can add them to a group.</p><p><strong>Create Group</strong></p><p>To add a recipient group:</p><ul><li>Click the <strong>Add Group</strong> button.</li><li>Enter a <strong>name</strong> for the group</li><li>Find the <strong>Users</strong> you want to include in the group.</li><li>Click the checkbox next to each <strong>Target.</strong></li><li><p>Click <strong>Create Group</strong></p><ul><li>The group is created, containing the selected user/targets.</li></ul></li></ul>                                |                |
| <h4 id="configuringalerts-targets">Targets</h4><p>When defining alert recipients, you can have the message delivered via various target services.</p><p>For each User or Group Recipient, you add delivery Targets that define the method of delivery.</p><p><strong>User</strong></p><p>You can select to add PagerDuty, Email, a WebHook integration, or SMS (text message) as targets.</p><p><strong>Groups</strong></p><p>When you have defined targets for individual users, you can add them to Groups:</p>                                                                                                                                                                                                                                                             |                |
| <h4 id="configuringalerts-alertstab">Alerts Tab</h4><p>The <strong>Alerts</strong> tab allows you to set Severity, Targets (individual users), and Groups (of users) to review alerts according to the parameters you prefer.</p><p>Alerts can be set for individual checks and be delivered to multiple Targets.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                         |                |
| <h4 id="configuringalerts-addalert">Add Alert</h4><p>You can add alerts for any checks and select one or several severities to include in the alert. Each alert can have multiple Recipients, and each recipient can have multiple Targets.</p><p><strong>Create Alert</strong></p><p>To add an alert:</p><ul><li>Find the checks you want to create alerts for</li><li>Search for checks with the <strong>Filter</strong> search by</li></ul><p>OR:</p><ul><li>Expand the Monitor Groups as needed</li><li>Mark the Checks you want to include in the alert:</li><li>Mark the levels of <strong>Severity</strong> you want to send alerts for</li><li>Mark the users or groups your want to send alerts to</li><li>Click the <strong>Create Alert</strong> button.</li></ul> | <p></p><p></p> |

***

## Configuring Different Alerting Types <a href="#configuringalerts-configuringdifferentalertingtypes" id="configuringalerts-configuringdifferentalertingtypes"></a>

### E-mail Alerts <a href="#configuringalerts-e-mailalerts" id="configuringalerts-e-mailalerts"></a>

A standard way of delivering notifications is sending an email. You can send the alert to multiple email addresses, and optionally have a customized message containing [Message Placeholders](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=Message%20Placeholders\&linkCreation=true\&fromPageId=2133759848).



An email target is created automatically when you set up a [Add User](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=Add%20User\&linkCreation=true\&fromPageId=2133759848).

#### Add an E-mail Target <a href="#configuringalerts-addane-mailtarget" id="configuringalerts-addane-mailtarget"></a>

To add an Email target:



* Click the **Email** button



* Enter a **Target Name** for identification in Synthetic Monitoring



* Enter a list of **Email** addresses to sent the alert to



* If you want to use a custom message:
* Uncheck **Use Default Message**
* Enter an alert **Message** (you can use Message Placeholders)
* Click the **Add Email Target** button

The Target is created, containing the selected user/targets.



### SMS Alerts <a href="#configuringalerts-smsalerts" id="configuringalerts-smsalerts"></a>

Alerts can be delivered as SMS to mobile phones. You can send the alert to multiple numbers, and optionally have a customized message containing [Message Placeholders](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=Message%20Placeholders\&linkCreation=true\&fromPageId=2133760251).



The phone target is created automatically when you set up user alerts via [Add User](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=Add%20User\&linkCreation=true\&fromPageId=2133760251).

The phone number needs to include the [International Country Prefix](https://en.wikipedia.org/wiki/List_of_international_call_prefixes). For example; `+1` for the US, and `+46`for Sweden, etc.

#### Create Target <a href="#configuringalerts-createtarget" id="configuringalerts-createtarget"></a>

To add an Text Message target:



* Click the **Text Message** button



* Enter a **Target Name** for identification in Synthetic Monitoring



* Enter a list of **Phone Numbers** to sent the alert to



* If you want to use a custom message:
* Uncheck **Use Default Message**
* Enter an alert **Message** (you can use Message Placeholders)
* Click the **Add SMS Target** button

The Target is created, containing the selected user/targets.



### PagerDuty Alerts <a href="#configuringalerts-pagerdutyalerts" id="configuringalerts-pagerdutyalerts"></a>

With the PagerDuty Integration, you can have alerts delivered through the PagerDuty platform, offering a rich set of notification delivery options. You need to set up the PagerDuty Integration before you can create a PagerDuty target.

You need to create the users and groups before you can add Targets to them.

To add a PagerDuty target, click the **PagerDuty** button



* Open the **Service** menu



* Choose the desired service



* Enter a **Target Name** for identification in Synthetic Monitoring



* Click the **Add PagerDuty Target** button

The Target is created, containing the selected user/targets.



### Other Alert Types <a href="#configuringalerts-otheralerttypes" id="configuringalerts-otheralerttypes"></a>

For instructions on how to configure other alert types, refer to the article [Configuring Webhook Alerts](broken-reference).

## Understanding and Configuring Placeholders <a href="#configuringalerts-understandingandconfiguringplaceholders" id="configuringalerts-understandingandconfiguringplaceholders"></a>

A **placeholder** is a character, word, or string of characters that temporarily takes the place of the final data.

For example, an operations manager may know that, for an alert, he needs a certain number of metrics with returned values or variables but doesn't yet know what to input because the value is dynamically returned from the monitoring results. He can use a placeholder as a temporary solution until a proper value or variable can be assigned by an alert (or message).

At Apica, we use placeholders in the following manners:

_**Alerts and Messages**_: when a customer wants to be made aware of/alerted about a state of a monitoring check. In other words, some threshold or a specified set of conditions has been met that needs to be sent (in some format to consume, like a popular alerting service like PagerDuty, or via a Webhook, SMS, or email). When this happens, a message gets generated and displayed in either an email or SMS text or generally POSTed to a Webhook-enabled service that ingests this information.

**Webhooks:** When there’s a business service that needs to ingest information about an Apica monitoring check (status, alert, message), the Webhook, as a push service, is a passive way to receive this information. So, [a set of alert integration placeholders ](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=AM\&title=New%3A%20Webhook%20Placeholders)has been defined and customized to your service needs.

Depending on what the purpose is, two placeholder characters denote an Apica placeholder.

* Message and Alert placeholders are each surrounded by the **%** character.
* Webhook placeholders are each surrounded by the **#** character.

### Message Placeholders <a href="#configuringalerts-messageplaceholders" id="configuringalerts-messageplaceholders"></a>

When Apica sends out an alert (with Apica’s “Alerter service”), it uses a set of “_placeholders”_ (needed by the various destination “targets” (alert destinations)) to refer to parts of information associated with events that have triggered (or resolved) the alert.

So placeholders provide a way to customize the layout and contents of SMTP (email), SMS messages and provide event-based information via a POST body to Webhook enabled Services like [OpsGenie](https://apica-kb.atlassian.net/wiki/spaces/K2/pages/587235420) [ServiceNow](https://apica-kb.atlassian.net/wiki/spaces/K2/pages/584515860).

A placeholder has the following format:

%placeholder-name%

There is a set of predefined placeholders configured in ASM:

| **Placeholder**                                                                      | **Meaning**                                                                                                                                                                                                                                                    | **Example**                                                                                                     |
| ------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| **Event-based Placeholders**                                                         |                                                                                                                                                                                                                                                                |                                                                                                                 |
| %E%                                                                                  | Event symbol. For check-based events, this is the CheckConfig.check\_symbol value.                                                                                                                                                                             | N84\_M377\_C1000\_URL\_20090227\_013715\_307                                                                    |
| %M%                                                                                  | Event message text.                                                                                                                                                                                                                                            | Message                                                                                                         |
| %N%                                                                                  | The NETBIOS name of the host is the source of the event.                                                                                                                                                                                                       | Node                                                                                                            |
| %QM%                                                                                 | Event message text with any double-quotes (") replaced by single-quotes (').                                                                                                                                                                                   | Message                                                                                                         |
| %S%                                                                                  | Event severity as one upper-case character, I, W, E, or F.                                                                                                                                                                                                     | Severity                                                                                                        |
| %SEV%                                                                                | Event severity as one word, Info, Warning, Error, or Fatal.                                                                                                                                                                                                    | Severity                                                                                                        |
| %T%                                                                                  | Agent-local timestamp. Format YYYY-MM-DD HH:MM:SS.                                                                                                                                                                                                             | Timestamp                                                                                                       |
| %UTC-T%                                                                              | UTC timestamp with a 'T' between the date and time portions. Format YYYY-MM-DDTHH:MM:SS.                                                                                                                                                                       | Timestamp (UTC)                                                                                                 |
| %UTC%                                                                                | The timestamp of the event is expressed in UTC. Format YYYY-MM-DD HH:MM:SS.                                                                                                                                                                                    | Timestamp (UTC)                                                                                                 |
| **For Check-based Events, Use the Following Placeholders**                           |                                                                                                                                                                                                                                                                |                                                                                                                 |
| %CHECK\_ID%                                                                          | Check id (32-bit positive integer from [CheckConfig.id](http://checkconfig.id))                                                                                                                                                                                |                                                                                                                 |
| %CHECK\_GUID%                                                                        | Check GUID.                                                                                                                                                                                                                                                    | A UUID from CheckConfig.check\_guid, in the format XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX                         |
| %CHECK\_NAME%                                                                        | Check descriptor (from CheckConfig.check\_descriptor)                                                                                                                                                                                                          |                                                                                                                 |
| %CHECK\_TYPE%                                                                        | Check descriptor (based on CheckConfig.check\_type)                                                                                                                                                                                                            | URL, Command, Ping, Port, Scenario, Fullpage (IE), or Fullpage                                                  |
| %MODULE\_NAME%                                                                       | Check module descriptor (from NodeModule.amm\_descriptor)                                                                                                                                                                                                      |                                                                                                                 |
| %OLD\_SEV\_CHAR%                                                                     | Previous check severity as an uppercase letter                                                                                                                                                                                                                 | (I, W, E, or F)                                                                                                 |
| %NEW\_SEV\_CHAR%                                                                     | Current check severity as an uppercase letter                                                                                                                                                                                                                  | (I, W, E, or F)                                                                                                 |
| %OLD\_SEV\_WORD%                                                                     | Previous check severity as a word                                                                                                                                                                                                                              | (Info, Warning, Error or Fatal)                                                                                 |
| %NEW\_SEV\_WORD%                                                                     | Current check severity as a word                                                                                                                                                                                                                               | (Info, Warning, Error or Fatal)                                                                                 |
| %RESULT\_GUID%                                                                       | Check Result UUID without dashes. Replaced by an empty string if no result identifier is part of the event.                                                                                                                                                    | a8e59d718fa949cb86c9ccfc93ff1876                                                                                |
| %RESULT\_G-U-I-D%                                                                    | Check Result UUID with dashes. Replaced by an empty string if no result identifier is part of the event.                                                                                                                                                       | a8e59d71-8fa9-49cb-86c9-ccfc93ff1876. Replaced by an empty string if no result identifier is part of the event. |
| %TT%                                                                                 | Timestamp adjusted to the timezone of the current dispatch target (maybe based on user/customer). Falls back to UTC.                                                                                                                                           | Format YYYY-MM-DD HH:MM:SS (TZ-offset) or YYYY-MM-DD HH:MM:SS if UTC.                                           |
| %CHECK\_TAGS%                                                                        | A set of Key, Value pairs assigned to the check.                                                                                                                                                                                                               | "Key 1: Value 1, Value 2, Value 3; Key 2: Value 1, Value 2, Value 3"                                            |
| **Placeholders that may be available if the Alerter uses a check information cache** |                                                                                                                                                                                                                                                                |                                                                                                                 |
| %CHECK\_DESCRIPTION%                                                                 | Check description (from CheckConfig.check\_description). For CLI-targets, any embedded carriage return/newline (CR/LF) character combinations (\r\n) s are replaced by a space, then the remaining CR and LF are replaced by empty strings.                    |                                                                                                                 |
| %xmlsafe:CHECK\_DESCRIPTION%                                                         | Check description (from CheckConfig.check\_description) with any XML-unsafe characters replaced by character entities.                                                                                                                                         | e.g. **& -> \&amp;**. Same rules apply for embedded CR and LF as for %CHECK\_DESCRIPTION%.                      |
| %GROUPS%                                                                             | List of monitor groups to which the check belongs. A comma-separated list of "top group/subgroup" entries. Since a check can be associated with more than one monitor group (possibly belonging to different users), the list can contain more than one entry. |                                                                                                                 |

#### Event-Related Placeholders <a href="#configuringalerts-event-relatedplaceholders" id="configuringalerts-event-relatedplaceholders"></a>

| **Placeholder** | **Description**                                                                    | **Example**                  |
| --------------- | ---------------------------------------------------------------------------------- | ---------------------------- |
| %E%             | Event symbol. For check-based events, this is the CheckConfig.check\_symbol value. |                              |
| %M%             | Event message text.                                                                |                              |
| %QM%            | Event message text with any double-quotes (") replaced by single-quotes (').       |                              |
| %S%             | Event severity as one upper-case character, I, W, E, or F.                         |                              |
| %SEV%           | Event severity as one word, Info, Warning, Error, or Fatal.                        |                              |
| %UTC%           | The timestamp of the event is expressed in UTC.                                    |  Format YYYY-MM-DD HH:MM:SS. |
| %UTC-T%         | UTC timestamp with a 'T' between the date and time portions.                       | Format YYYY-MM-DDTHH:MM:SS.  |

#### Check-related Placeholders <a href="#configuringalerts-check-relatedplaceholders" id="configuringalerts-check-relatedplaceholders"></a>

| **Placeholder**              | **Description**                                                                                                                                                                                     | **Example**                                                                                                                                                                                                      |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| %CHECK\_DESCRIPTION%         | Check description. For CLI-targets, any embedded carriage return/newline (CR/LF) character combinations (\r\n) are replaced by a space, then the remaining CR and LF are replaced by empty strings. |                                                                                                                                                                                                                  |
| %CHECK\_GUID%                | Check GUID.                                                                                                                                                                                         | A UUID in the format XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX.                                                                                                                                                       |
| %CHECK\_ID%                  | Check ID.                                                                                                                                                                                           |                                                                                                                                                                                                                  |
| %CHECK\_NAME%                | Check name.                                                                                                                                                                                         |                                                                                                                                                                                                                  |
| %CHECK\_TAGS%                | A set of Key: Value pair(s) assigned to the check, with the format: "Key 1: Value 1, Value 2, Value 3; Key 2: Value 1, Value 2, Value 3"                                                            |                                                                                                                                                                                                                  |
| %CHECK\_TYPE%                | Check descriptor.                                                                                                                                                                                   | URL, Command, Ping, Port, Scenario, Fullpage (IE), or Fullpage                                                                                                                                                   |
| %GROUPS%                     | List of monitor groups to which the check belongs.                                                                                                                                                  | A comma-separated list of "top group/subgroup" entries. Since a check can be associated with more than one monitor group (possibly belonging to different users), the list can contain more than one entry.      |
| %LOCATION%                   | The location from which the check is executed.                                                                                                                                                      |                                                                                                                                                                                                                  |
| %NEW\_SEV\_CHAR%             | Current check severity as an uppercase letter.                                                                                                                                                      | (I, W, E or F)                                                                                                                                                                                                   |
| %NEW\_SEV\_WORD%             | Current check severity as a word.                                                                                                                                                                   | (Info, Warning, Error or Fatal)                                                                                                                                                                                  |
| %OLD\_SEV\_CHAR%             | Previous check severity as an uppercase letter.                                                                                                                                                     | (I, W, E or F)                                                                                                                                                                                                   |
| %OLD\_SEV\_WORD%             | Previous check severity as a word.                                                                                                                                                                  | (Info, Warning, Error or Fatal)                                                                                                                                                                                  |
| %RESULT\_G-U-I-D%            | Check Result UUID with dashes. Replaced by an empty string if no result identifier is part of the event.                                                                                            | a8e59d71-8fa9-49cb-86c9-ccfc93ff1876. Replaced by an empty string if no result identifier is part of the event.                                                                                                  |
| %RESULT\_GUID%               | Check Result UUID without dashes. Replaced by an empty string if no result identifier is part of the event.                                                                                         | a8e59d718fa949cb86c9ccfc93ff1876.                                                                                                                                                                                |
| %TT%                         | Timestamp adjusted to the timezone of the current dispatch target (maybe based on user/customer). Falls back to UTC.                                                                                | Format YYYY-MM-DD HH:MM:SS (TZ-offset) or YYYY-MM-DD HH:MM:SS if UTC.                                                                                                                                            |
| %xmlsafe:CHECK\_DESCRIPTION% | Check description with any XML-unsafe characters replaced by character entities.                                                                                                                    | Check description (from CheckConfig.check\_description) with any XML-unsafe characters replaced by character entities, e.g. **& -> \&amp**; Same rules apply for embedded CR and LF as for %CHECK\_DESCRIPTION%. |

### Webhook Placeholders <a href="#configuringalerts-webhookplaceholders" id="configuringalerts-webhookplaceholders"></a>

Default placeholders are surrounded by a pound/hashtag # character.

A default set of placeholders has been provided. These can be configured with the Webhook alert integration, or you may customize your Webhook placeholders as necessary.

| **Placeholder**  | **Used For/Definition/Comment** |
| ---------------- | ------------------------------- |
| `#ALERT_TITLE#`  |                                 |
| `#API_ID#`       | Slack, ServiceNow               |
| `#API_KEY#`      | VictorOps, OpsGenie, Datadog    |
| `#BASE64#`       |                                 |
| `#HOST_ADDRESS#` |                                 |
| `#INCIDENT_ID#`  |                                 |
| `#MESSAGE#`      |                                 |
| `#MESSAGE_TYPE#` |                                 |
| `#TARGET_USER#`  | HipChat, VictorOps              |
| `#TITLE#`        | Splunk                          |
| `#TOKEN#`        |                                 |

#### Defining Your Own Webhook Placeholders in Custom Webhooks <a href="#configuringalerts-definingyourownwebhookplaceholdersincustomwebhooks" id="configuringalerts-definingyourownwebhookplaceholdersincustomwebhooks"></a>

The default placeholders above should only be considered suggestions. It is also possible to define your own webhook placeholders, which will pull their value from some response content which comes back from an API call. These custom-defined placeholders are also surrounded by a pound/hashtag # character.

Consider the following example:



Here, after the main alert text is sent to Slack (via [hooks.slack.com](http://hooks.slack.com)), a second URL call is made to [https://api-asm-eu1.apica.io/](https://api-asm-eu1.apica.io/). It is a GET request which returns response data in JSON format:



One of the key/value pairs in the response is “url”. _**Although ASM asks for an XPath, you must provide the JSON path instead**_ and ASM will find the value at the given path of the response and assign it to the custom placeholder you define. In other words, there is some manual translation which must be done in this instance - the URL property from the Postman screenshot above becomes /url in the webhook definition screenshot.

Essentially, in the above example, when the GET request is resolved, the value of #url# becomes whatever is found in the “url” property of the response body. In the above example, the recipient of the check will instantly know that the check goes to [https://www.msn.com](https://www.msn.com).
