---
description: Configuring SNMP ingest plugin to pull data from snmp agents
---

# SNMP

The devices that are connecting to the internet are increasing drastically. The data produced by switches, routers, and other IoT devices is huge and it can provide valuable information that will be used for monitoring all the devices connected. Those data can be fetched or managed by SNMP protocol which will be running as a service in your device.

Apica Ascent platform provides a source extension plugin for SNMP that will help you collect data from all your SNMP agents.



### Steps to Create SNMP Extension

* Navigate to the Integrations page and click on the new Plugin button

![](<../../.gitbook/assets/image (417).png>)

* Provide the Plugin Name and click next

![](<../../.gitbook/assets/image (418).png>)

* Configure your resource requirements and click next
* Provide the interval duration in seconds to pull data at every interval
* Add the agents by providing the Hostname/IP and port
* Provide the credentials for accessing the SNMP agents
* Provide a custom MIB filename and load the MIB file, if you want to use a custom OID
* Add OID and the corresponding name for the OID which will be used as the attribute name of the data when we ingest it to the Apica ascent platform.\
  \
  ![](<../../.gitbook/assets/image (419).png>)

After creation, you will see the SNMP data which will have all the OIDs as attributes with the corresponding name in the incoming data.
