# Arc Sight

ArcSight is a security management tool designed to track and analyze data insights and it ensures compliance with policy guidelines. It provides organizations with the real-time security information that can be used to detect and respond to threats quickly and effectively.

Apica helps you to forward logs to the arc sight using the forwarder plugin.

### Supported Forwarding Formats <a href="#supported-forwarding-formats" id="supported-forwarding-formats"></a>

Apica enables users to quickly and easily forward logs in various formats to security tools, simplifying processing and analysis. The supported formats are,

* Syslog CEF
* ArcSight CEF

### Steps to Create Arc Sight Forwarding <a href="#steps-to-create-arc-sight-forwarding" id="steps-to-create-arc-sight-forwarding"></a>

* Expand the `Create` menu from the navigation bar and click `Forwarder`
* Select the `Arc Sight` based on the type of format you want to use
* Click `New Forwarder` button at the top right corner
* Provide the host of the Arc Sight and the name of the forwarder
* Click `Create`

Once the forwarder is associated with a specific namespace/application or with various log attributes, the logs that match these criteria will be sent to ArcSight for further analysis.

<figure><img src="../../.gitbook/assets/image (520).png" alt=""><figcaption><p>creating arc sight forwarder</p></figcaption></figure>
