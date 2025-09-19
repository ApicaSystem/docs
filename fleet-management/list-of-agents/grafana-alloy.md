---
description: Manage a fleet of Grafana Alloy instances at scale with Apica Fleet.
---

# Grafana Alloy

The following points will tell you how to install an Alloy agent on a Linux machine:

1. Click on the 'Install Agent Manager' button at the top right corner of the Fleet page.

<figure><img src="../../.gitbook/assets/Screenshot from 2024-10-10 17-32-40.png" alt=""><figcaption></figcaption></figure>

2. Once the Modal Opens, choose Linux as a platform and Grafana Alloy as the agent type. On completion, click Proceed.

<figure><img src="../../.gitbook/assets/Screenshot from 2024-10-10 17-42-42.png" alt=""><figcaption></figcaption></figure>

3. A modal opens with a README file and an installation file. Execute the install script to install the agent manager and the Grafana Alloy instance on the Linux Machine.

<figure><img src="../../.gitbook/assets/Screenshot from 2024-10-10 17-46-00.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Make sure the install.sh script file has execute access. \
To do so, execute the following command in the directory where the install.sh file is placed:\
$ chmod +x ./install.sh
{% endhint %}

#### Check agent-manager status:

To check the status of agent-manager, and the running agents on a Linux host:

```
$ sudo systemctl status agent-manager-grafana-alloy
```

To get agent-manager logs on a Linux host:

```
$ sudo journalctl -n 100 -f -u agent-manager-grafana-alloy
```
