# Configuring Generative AI Access

The ADF admin can get into the configuration screen by clicking on the upper-right setting menu,

<figure><img src="../../.gitbook/assets/image (640).png" alt=""><figcaption></figcaption></figure>

Selecting the top tab _ingest Configuration_ to get into the general ADF settings. Scrolling down the settings page further will display Generative AI settings in two separate locations:  Azure AI deployment and OpenAI deployment.  &#x20;

<figure><img src="../../.gitbook/assets/image (638).png" alt=""><figcaption><p>Azure AI Related Configuration</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot from 2025-01-21 17-40-36 (1).png" alt=""><figcaption><p>OpenAI Related Confiugration</p></figcaption></figure>



The ADF platform supports major GenAI vendors, specifically Azure AI or OpenAI backends. The admin user first needs to specify and fill the _OPENAI\_VENDOR_ blank with the vendor name: azure or openai. Depending on the vendor configuration, the admin then needs to complete the detailed access information. &#x20;

For Azure deployment, the configuration blanks that need to be filled are:

* _AZURE\_OPENAI\_DEPLOYMENT\_NAME_
* _AZURE\_OPENAI\_ENDPOINT_
* _AZURE\_OPENAI\_KEY_
* _OPEN\_AI\_MODEL_

For OpenAI deployment, the configuration blanks that need to be filled are:

* _OPENAI\_KEY_
* _ASURE\_OPENAI\_ENDPOINT_
* _OPEN\_AI\_MODEL_

Notice that as of August 2024, the ADF Azure deployment supports models:

* gpt-4
* gpt-4o
* gpt-4o-mini
* gpt-3.5-turbo

