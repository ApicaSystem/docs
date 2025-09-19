# Configuring Webhook Alerts

ASM supports the configuration of webhooks in order to deliver customized, automated messages to predefined endpoints. The information which is delivered to these webhook endpoints can be static or dynamic.

## What are Webhooks? <a href="#configuringwebhookalerts-whatarewebhooks" id="configuringwebhookalerts-whatarewebhooks"></a>

The concept of a Webhook is simple. A Webhook is an HTTP callback: an HTTP POST that occurs when something happens; i.e. a simple event-notification via HTTP POST. This means that Webhooks can deliver **alerts** using an HTTP POST, sent to _any service_ with a configured URL that supports WebHooks. With no limit on what can be done with the posted information, applications can use WebHooks to perform any desired action.

The flexibility of a webhook allows ASM users to send much more data in an alert than they would be able to do using a non-webhook alert.

ASM Webhook alerts carry information to your Webhook-enabled service/application target(s) via data placeholders.

## What Are Some ASM Webhook Features? <a href="#configuringwebhookalerts-whataresomeasmwebhookfeatures" id="configuringwebhookalerts-whataresomeasmwebhookfeatures"></a>

Apica integrates with 3rd-Party Alerting services, allowing companies using ASM to have alerts sent to the receiving management system of their choice.

&#x20;The incident alerts are **PUSHED** by ASM to the selected system endpoint.

* The pushed data from ASM is either a **Trigger** or a **Resolution** of the alert.

The message can include dynamic **Alerts Message Placeholders** such as

* Check Location
* Check Description
* Check Name
* Date & Time of alert
* Etc.
