# Coralogix Forwarding

#### Pre-Requisites <a href="#pre-requisites" id="pre-requisites"></a>

* User should have an account in Coralogix platform
* Private key to ingest data into coralogix. To create a private key in coralogix, please refer to this link [https://coralogix.com/docs/send-your-data-api-key/](https://coralogix.com/docs/send-your-data-api-key/)

#### Steps to Forward logs to Coralogix <a href="#steps-to-forward-logs-to-coralogix" id="steps-to-forward-logs-to-coralogix"></a>

* Navigate to `create forwarder` page
* Select Coralogix
* Click on `Create Forwarder`
* Provide forwarder name
* Provide `Private Key` for ingesting logs
* Click `Create` button

<figure><img src="https://logflow-docs.logiq.ai/~gitbook/image?url=https%3A%2F%2F3717450363-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252F8WGNQCWSTnL2NgouIRTq%252Fuploads%252FHTwDtgSXfCWQozguTwcs%252Fimage.png%3Falt%3Dmedia%26token%3D611490f2-9ddb-4ece-bcbc-7cc7d091053f&#x26;width=300&#x26;dpr=4&#x26;quality=100&#x26;sign=3d763319&#x26;sv=1" alt=""><figcaption></figcaption></figure>

After the creation of forwarder, it can be mapped to any namespace and application which sends logs to coralogix platform.
