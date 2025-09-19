# Splunk Integration

**Caveat**: each of the following integration directions was based on the UI when it was written. The UIs may change by the time you read this, so _UI updates are beyond the scope of these articles_. Please go to the integration target sites for their latest information on integration directions.

#### Integrating Apica with Splunk <a href="#splunkintegration-integratingapicawithsplunk" id="splunkintegration-integratingapicawithsplunk"></a>

Splunk is an IT infrastructure platform for data collection from multiple online sources to use for, among other things, performance management, monitoring, and data analysis.



**Note:** To use Splunk with Synthetic Monitoring, you must sign up for a Splunk account.

## Splunk Deployment Options <a href="#splunkintegration-splunkdeploymentoptions" id="splunkintegration-splunkdeploymentoptions"></a>

The Splunk integration should work out of the box, but you may want to look into some customizations of the messages at the Splunk end.

[Splunk Deployment Options](https://docs.splunk.com/Documentation/PCI/latest/Install/Deploymentoptions)

## Splunk Introduction <a href="#splunkintegration-splunkintroduction" id="splunkintegration-splunkintroduction"></a>

#### Introduction <a href="#splunkintegration-introduction" id="splunkintegration-introduction"></a>

In Splunk, Synthetic Monitoring can be used together to create a customized Dashboard view.

It is then possible to correlate monitoring metrics, such as **Response Time** and **Received Bytes** with Apica Synthetic Monitoring metrics from other services on the same dashboard.

In Synthetic Monitoring, Splunk can be used as a target in Synthetic Monitoring, Manage Alerts.

Sample views:

**Splunk Dashboard**



**Alert Target**



## Splunk Setup <a href="#splunkintegration-splunksetup" id="splunkintegration-splunksetup"></a>

#### Setup <a href="#splunkintegration-setup" id="splunkintegration-setup"></a>

The Synthetic Monitoring \[ASMDOCS:[The Apica ASM API](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=The%20Apica%20ASM%20API\&linkCreation=true\&fromPageId=4631711) can be accessed from Splunk using the Splunk [REST API Modular Input](https://splunkbase.splunk.com/app/1546/)] plugin.

## Splunk Cloud Deployment <a href="#splunkintegration-splunkclouddeployment" id="splunkintegration-splunkclouddeployment"></a>

The Splunk alert targets use the Splunk REST API.

For the alerts to work with Splunk Cloud, this requires you to enter the correct host and user credentials settings.

**Note:** For access to Splunk REST API and SDKs for Splunk Cloud deployment, you need to submit a [support case to Splunk](https://answers.splunk.com/answers/216856/how-do-i-file-a-splunk-support-case-contact-splunk.html) requesting access.

**Overview**

**More information**

Splunk documentation:

[Types of Splunk Cloud deployment](https://docs.splunk.com/Documentation/SplunkCloud/6.6.3/User/TypesofSplunkClouddeployment)

[Using the REST API with Splunk Cloud](https://docs.splunk.com/Documentation/SplunkCloud/6.6.3/RESTTUT/RESTandCloud)

### Managed Deployment <a href="#splunkintegration-manageddeployment" id="splunkintegration-manageddeployment"></a>

For managed deployments, Splunk Support opens port 8089 for REST access. You can specify a range of IP addresses to control who can access the REST API.

#### Host value <a href="#splunkintegration-hostvalue" id="splunkintegration-hostvalue"></a>

For Splunk managed deployments, the target Splunk Host is on the format

`<deployment-name>.cloud.splunk.com`

#### Credentials <a href="#splunkintegration-credentials" id="splunkintegration-credentials"></a>

You cannot use SAML authentication with the REST API.

The target Splunk Username to use for self-service deployments, the can be any valid Splunk User.

### Self-Service Deployment <a href="#splunkintegration-self-servicedeployment" id="splunkintegration-self-servicedeployment"></a>

For self-service deployments, Splunk Support defines a dedicated user and sends you credentials that enable that user to access the REST API.

#### Host Value <a href="#splunkintegration-hostvalue" id="splunkintegration-hostvalue"></a>

For self-service deployments, the target Splunk Host is on the format

`input-<deployment-name>.cloud.splunk.com`

Note the `input-` at the start of the URL.

#### Credentials <a href="#splunkintegration-credentials.1" id="splunkintegration-credentials.1"></a>

You cannot use SAML authentication with the REST API.

The target Splunk Host needs to be the dedicated non-SAML user credentials dedicated user provided to you by Splunk Support.

## Apica Data in Splunk <a href="#splunkintegration-apicadatainsplunk" id="splunkintegration-apicadatainsplunk"></a>

#### Apica Data In Splunk <a href="#splunkintegration-apicadatainsplunk" id="splunkintegration-apicadatainsplunk"></a>

The data collected from Synthetic Monitoring can be used in the usual ways in Splunk.

\##

Splunk will pull data from WPM every 5 minutes and index the response:



You can now

* Search for the data you want
* create reports/dashboards:



## Configure Endpoint <a href="#splunkintegration-configureendpoint" id="splunkintegration-configureendpoint"></a>

With the Splunk Add-On installed, you can create an endpoint.

\##

Then you add your headers, content, URL etc for the REST API that you want to pull data from – and you also specify how often you want to poll the data.



## Splunk Add-On <a href="#splunkintegration-splunkadd-on" id="splunkintegration-splunkadd-on"></a>

The Splunk **REST API Modular Input** plugin can be used to integrate Synthetic Monitoring with Splunk.

**Install Plugin**

With the **REST API Modular Input** you can pull data from a REST API (Synthetic Monitoring in this case) and index the response.

* Download the plugin [REST API Modular Input](https://splunkbase.splunk.com/app/1546/)
* Install the plugin

## Additional Scripts <a href="#splunkintegration-additionalscripts" id="splunkintegration-additionalscripts"></a>

More advanced data endpoints can be created by adding scripts in Splunk.

**View**

