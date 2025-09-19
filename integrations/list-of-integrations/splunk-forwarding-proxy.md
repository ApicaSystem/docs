# Splunk Forwarding Proxy

When a Splunk Forwarding Proxy Source Extension of type Indexer Cluster is created, a corresponding HEC Forwarder gets created. The created Forwarder will not have edit and delete actions as it was automatically created by the Source Extension. Also when the Source Extension gets deleted, the corresponding Forwarder also gets deleted. The Source Extension and Forwarders Table also have navigational capabilities for their counterparts.

<figure><img src="../../.gitbook/assets/image (163).png" alt=""><figcaption><p>Source Extension View with the corresponding Forwarder</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (164).png" alt=""><figcaption><p>Forwarders View with the corresponding Source Extension</p></figcaption></figure>
