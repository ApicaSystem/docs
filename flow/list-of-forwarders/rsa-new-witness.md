# RSA New Witness

RSA New Witness is a powerful security tool developed by RSA Security that helps organizations detect and respond to threats from within their network. It provides advanced analytics, such as machine learning, to quickly identify malicious activity and alert users of potential issues.

Apica helps you to forward logs to the RSA New Witness using the forwarder plugin.

### Supported Forwarding Formats <a href="#supported-forwarding-formats" id="supported-forwarding-formats"></a>

Apica enables users to quickly and easily forward logs in various formats to security tools, simplifying processing and analysis. The supported formats are,

* Syslog
* Syslog CEF

<figure><img src="../../.gitbook/assets/image (521).png" alt=""><figcaption></figcaption></figure>

### Steps to Create Arc Sight Forwarding <a href="#steps-to-create-arc-sight-forwarding" id="steps-to-create-arc-sight-forwarding"></a>

* Expand the `Create` menu from the navigation bar and click `Forwarder`
* Select the `RSA New Witness` based on the type of format you want to use
* Click `New Forwarder` button in the top right corner
* Provide the host of the New Witness and the name of the forwarder
* Click `Create`

Once the forwarder is associated with a specific namespace/application or with various log attributes, the logs that match these criteria will be sent to RSA New Witness for further analysis.

<figure><img src="../../.gitbook/assets/image (522).png" alt=""><figcaption></figcaption></figure>
