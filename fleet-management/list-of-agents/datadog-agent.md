---
description: Instructions for installing Datadog agent using Fleet.
---

# Datadog Agent

* Click on Install Agent Manager Button.
* Select Platform and Datadog for Agent.
* Click on Add Secret to add API KEY and your Datadog SIte.
  * type key name as "api\_key" for API Key.
  * type key name as "dd\_site" for Datadog Site.

<figure><img src="../../.gitbook/assets/image (492).png" alt=""><figcaption></figcaption></figure>

* click on proceed, and then follow the instructions provided in the Readme File.

#### Check agent-manager status:

To check the status of agent-manager, and the running agents on a Linux host:

```
$ sudo systemctl status agent-manager-datadog
```

To get agent-manager logs on a Linux host:

```
$ sudo journalctl -n 100 -f -u agent-manager-datadog
```

To check the status of agent-manager, and the running agents on a Windows host, use the **Windows Services** app, and locate the service named **agent-manager-datadog**.

To get agent-manager logs on a Windows host, use the **Windows Event Viewer** app. The logs from agent-manager will be located in the **Windows Logs > Application** logs.
