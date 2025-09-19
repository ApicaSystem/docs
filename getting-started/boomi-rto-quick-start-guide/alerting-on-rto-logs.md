# Alerting on RTO Logs

Some crucial indicators in the Boomi logs that should be used to stay ahead of potential issues within your infrastructure. Two key ones already baked into the RTO solution are "Multiple Head Nodes" and "Container Version Mismatch". We'll use "Multiple Head Nodes" as an example to create a similar alert on Boomi logs.\


To query and alert on a log first navigate to **Queries -> New Report (Top Right)**

<figure><img src="../../.gitbook/assets/image (146).png" alt=""><figcaption></figcaption></figure>

Then click the pencil icon:\


<figure><img src="../../.gitbook/assets/image (147).png" alt=""><figcaption></figcaption></figure>

In this next view you can copy the below configuration. This will be the same for most Boomi logging alerts.

<figure><img src="../../.gitbook/assets/image (148).png" alt=""><figcaption></figcaption></figure>

The main field you'll want to change is the **message** value at the bottom. Change this to the value you want the query to look for in the Boomi logs. For example, if you had a process called "Salesforce API" and wanted to be alerted on anything except INFO, the configuration would look like this:\


<figure><img src="../../.gitbook/assets/image (150).png" alt=""><figcaption></figcaption></figure>

This is saying if the log message contains "Salesforce API" and the loglevel **is not** "INFO", meaning the value is failure, warning, error, etc., then return the timestamp and hostname (configured under "group by" above) for the machine it failed on.&#x20;
