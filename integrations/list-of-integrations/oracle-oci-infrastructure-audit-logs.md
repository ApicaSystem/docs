---
description: Captures Oracle OCI infrastructure logs and audit
---

# Oracle OCI Infrastructure Audit/Logs

Oracle OCI infrastructure event logs can be captured and ingested into the Ascent platform.  Here are the steps outlined&#x20;

* Configure the capture logs by creating a log group and including the desired logs at OCI
* Create the OCI capture function using the example Python code and the OCI function interface.
* Create OCI connector service connecting the log group to function.&#x20;
* Activate the process by invoking the function.

## Creating the Log group and Configure Log inclusion

* In the OCI portal, go to _**Logging -> Log Groups**_.
* Create a log group.  &#x20;
* Configure the logs into the log group from Resources.
* Activate the logs by enabling the log with the enable-log button.

## Create OCI Function

* Create the custom OCI function starting from the OCI portal function UI.
* Follow the _**Getting Started**_ menu on the right-hand side
  * Select Python and create OCI boilerplate code
  * Replace the files in the function directory with the files (func.py, func.yaml, requiements.txt) from the GitHub directory:  \
    [https://github.com/logiqai/Oracle-OCI-Infrastructure-Log-Capture/tree/main](https://github.com/logiqai/Oracle-OCI-Infrastructure-Log-Capture/tree/main)
  * Update the fields inside the file func.yaml
    * End-point address with an example such as below,\
      &#x20;[https://loadtest.apica.io:443/v1/json\_batch](https://loadtest.apica.io/v1/json_batch)
    * Ingestion token: \
      [https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token#obtaining-an-ingest-token-using-ui](https://docs.apica.io/integrations/overview/generating-a-secure-ingest-token#obtaining-an-ingest-token-using-ui)
    * _**Namespace**_ and _**Appname**_ are needed for labeling the logs.  This will be used for retrieving the log in the Ascent platform.

## Create OCI Connector Service

* Go to _**Logging -> Service Connector**_ inside the OCI portal.
* Go to the Service Connector page, and configure the _**Compartment**_ name, _**Log Group**_, and _**Logs**_ from previously created earlier.
* For sending Audit Logs, click _**+Another Log**_ while using the same Compartment, and replace the Log Group with text _**\_Audit**_.
* Select _**Compartment**_, _**Function application**_, and _**Function**_ for the configure target.
* It is necessary to create the policy at the bottom of the Connector service page; everything can be set to default.
* At the end, create Create at the bottom of the page to finish creating the connector service.



## References

* OCI Infrastructure Service Connector Hub - [https://blogs.oracle.com/cloud-infrastructure/post/oracle-cloud-infrastructure-service-connector-hub-now-generally-available](https://blogs.oracle.com/cloud-infrastructure/post/oracle-cloud-infrastructure-service-connector-hub-now-generally-available)
* Available OCI infrastructure logs - [https://docs.oracle.com/en-us/iaas/Content/Logging/Reference/service\_log\_reference.htm#service\_log\_reference](https://docs.oracle.com/en-us/iaas/Content/Logging/Reference/service_log_reference.htm#service_log_reference)
* OCI logging in general - [https://docs.oracle.com/en-us/iaas/Content/Logging/home.htm](https://docs.oracle.com/en-us/iaas/Content/Logging/home.htm)







