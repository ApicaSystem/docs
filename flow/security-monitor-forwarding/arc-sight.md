# Arc Sight

ArcSight is a security management tool designed to track and analyze data insights and it ensures compliance with policy guidelines. It provides organizations with the real-time security information that can be used to detect and respond to threats quickly and effectively.

Apica helps you to forward logs to the arc sight using the forwarder plugin.

### Supported Forwarding Formats <a href="#supported-forwarding-formats" id="supported-forwarding-formats"></a>

Apica enables users to quickly and easily forward logs in various formats to security tools, simplifying processing and analysis. The supported formats are,

* Syslog CEF
* ArcSight CEF

![](https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252F7iQqFMY2O5Atqs2XfmYZ%252FScreenshot%2520from%25202023-01-03%252014-36-35.png%3Falt%3Dmedia%26token%3Db2bd77ca-6b7a-4611-94c5-208eb23f3f43\&width=768\&dpr=4\&quality=100\&sign=3493f703\&sv=1)

### Steps to Create Arc Sight Forwarding <a href="#steps-to-create-arc-sight-forwarding" id="steps-to-create-arc-sight-forwarding"></a>

* Expand the `Create` menu from the navigation bar and click `Forwarder`
* Select the `Arc Sight` based on the type of format you want to use
* Click `New Forwarder` button at the top right corner
* Provide the host of the Arc Sight and the name of the forwarder
* Click `Create`

Once the forwarder is associated with a specific namespace/application or with various log attributes, the logs that match these criteria will be sent to ArcSight for further analysis.

<figure><img src="../../.gitbook/assets/image (520).png" alt=""><figcaption><p>creating arc sight forwarder</p></figcaption></figure>
