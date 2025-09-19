# PagerDuty Integration

**Caveat**: each of the following integration directions was based on the UI when it was written. The UIs may change by the time you read this, so _UI updates are beyond the scope of these articles_. Please go to the integration target sites for their latest information on integration directions.

## PagerDuty + Apica Integration Benefits <a href="#pagerdutyintegration-pagerdutyapicaintegrationbenefits" id="pagerdutyintegration-pagerdutyapicaintegrationbenefits"></a>

* Notify on-call responders based on alerts sent from Apica ASM.
* Send enriched event data from Apica, including links to visualizations and metrics that triggered the event.
* Create high and low urgency incidents based on the severity of the event from the Apica-triggered event.
* Incidents will automatically resolve in PagerDuty when the metric in Apica ASM returns to normal.

## How it Works <a href="#pagerdutyintegration-howitworks" id="pagerdutyintegration-howitworks"></a>

Any service availability check in Apica ASM be configured to trigger events of varying severity based on the thresholds set. When a service or collection of services violates the configured thresholds, Events can be escalated and routed directly to PagerDuty for alerting.

When the services return to normal, PagerDuty is automatically updated.&#x20;

## Requirements <a href="#pagerdutyintegration-requirements" id="pagerdutyintegration-requirements"></a>

Only active Apica and PagerDuty accounts are needed to use this integration..

## Support <a href="#pagerdutyintegration-support" id="pagerdutyintegration-support"></a>

If you need help with this integration, please contact: [support@apica.io](mailto:support@apica.io)

## Integration Walkthrough <a href="#pagerdutyintegration-integrationwalkthrough" id="pagerdutyintegration-integrationwalkthrough"></a>

### In PagerDuty <a href="#pagerdutyintegration-inpagerduty" id="pagerdutyintegration-inpagerduty"></a>

#### Integrating With a PagerDuty Service <a href="#pagerdutyintegration-integratingwithapagerdutyservice" id="pagerdutyintegration-integratingwithapagerdutyservice"></a>

![](https://pdpartner.s3.amazonaws.com/ig-template-copy-integration-key.png)

1. From the **Configuration** menu, select **Services**.
2. There are two ways to add an integration to a service:
   * **If you are adding your integration to an existing service, click the name of the service to which you want to add the integration**, and click the name of the service to which you want to add the integration. Then, select the **Integrations** tab and click the **New Integration button**.
   * **If you are creating a new service for your integration, please read our documentation in the Configuring Services and Integrations section**, please read our documentation in the Configuring Services and Integrations section and follow the steps outlined in the [Create a New Service](https://support.pagerduty.com/docs/services-and-integrations#section-create-a-new-service) section, selecting _**Apica**_ as the **Integration Type** in step 4. Continue with the In _**Apica**_ section (below) once you have finished these steps.
3. Enter an **Integration Name** in the format `monitoring-tool-service-name` (e.g.  _**Apica**_-Shopping-Cart) and select  _**Apica**_ from the Integration Type menu.
4. Click the **Add Integration** button to save your new integration. You will be redirected to the Integrations tab for your service.
5. An Integration Key will be generated on this screen. Keep this key saved in a safe place, as it will be used when you configure the integration with  Apica in the next section.

## Configure PagerDuty Within ASM <a href="#pagerdutyintegration-configurepagerdutywithinasm" id="pagerdutyintegration-configurepagerdutywithinasm"></a>

To Setup Synthetic Monitoring with PagerDuty, you need to authorize Apica in PagerDuty, and configure at least one service. It is possible to set up Apica to work with multiple PagerDuty services, by simply repeating the setup for each service.

### Authorize <a href="#pagerdutyintegration-authorize" id="pagerdutyintegration-authorize"></a>

The first step of the PagerDuty integration is authorizing Apica in PagerDuty.

To authorize Apica:



* Click **Add PagerDuty Account**

The PagerDuty integration dialog is shown:



* Enter the **Email** address for your PagerDuty account



* Enter a **Password** for your PagerDuty account
* Click **Authorize Integration**

### PagerDuty (Existing Service) <a href="#pagerdutyintegration-pagerduty-existingservice" id="pagerdutyintegration-pagerduty-existingservice"></a>

If you already have a service set up, you can select it directly.

**Add Existing Service**

To add an existing service:



* Check the **Use existing service** option
* Select a service from the dropdown list

### PagerDuty (New Service) <a href="#pagerdutyintegration-pagerduty-newservice" id="pagerdutyintegration-pagerduty-newservice"></a>

If you don't have any existing services, or if you want to create a new service. To add a new service:



* Check the **Crete a new service** option
* Enter a **Service Name**

The escalation polices configured in PagerDuty is shown in the dropdown list.



* Select an **Escalation Policy** from the dropdown list

### Finish PagerDuty Integration <a href="#pagerdutyintegration-finishpagerdutyintegration" id="pagerdutyintegration-finishpagerdutyintegration"></a>

After authorization, and selecting a service or creating one, you can finish the integration.



* Click **Finish Integration**

The account is added to the list:



Once the PagerDuty account has been added, you can [set up a PagerDuty alert within ASM](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2150563916/Configuring+Alerts#PagerDuty-Alerts). When that is done, any alert which triggers within Apica will trigger a PagerDuty alert, and any alert which resolves within Apica will resolve the corresponding PagerDuty alert.

## How to Uninstall <a href="#pagerdutyintegration-howtouninstall" id="pagerdutyintegration-howtouninstall"></a>

### In Apica ASM <a href="#pagerdutyintegration-inapicaasm" id="pagerdutyintegration-inapicaasm"></a>

1. Go to _**Integrations -> Pagerduty**_
2. Click the trashcan icon next to the PagerDuty integration you want to remove.
