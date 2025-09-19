---
description: This page describers E-Mail server configuration
---

# E-Mail Configuration

Apica Ascent insights can be configured to send emails to notify alerts. It uses smtp mail and requires following information for configuration:

1. Mail Server DNS/IP
2. Mail service/relay port for SMTP e.g. 25 or 465/587 (TLS/SSL)
3. Username for the mail service/relay
4. Password for the user above in 3
5. Default Sender E-Mail: The send e-mails will show up as from this sender
6. Depending on what port you are using and support at the mail service/relay, select either SSL/TLS to be enabled

{% hint style="info" %}
The E-mail configuration is a global configuration and is available only to the admin user
{% endhint %}

{% hint style="danger" %}
The default sender e-mail in most cases will need to be a verified e-mail address from the Mail service/relay provider
{% endhint %}

The following attributes can be setup by Apica Ascent admin on UI.

![Apica Ascent Insights Email Setup](../.gitbook/assets/Screen-Shot-2020-08-09-Mail-Server.png)
