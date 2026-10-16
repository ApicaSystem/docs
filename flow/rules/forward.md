# FORWARD

Forward rules are applied when the logs are routed to downstream destinations. In a nutshell, these are similar to Filter rules, but filter rules are applied when Apica Ascent receives the data. Forward rules are useful in case organizations want to retain all the generated logs in InstaStore but want to selectively forward the data to other destinations by ensuring total compliance.

Multiple forward rules can be configured for a log stream. The data gets forwarded only if all the rules are satisfied. Forward rules can be configured to forward selective fields, which also helps in reducing the data volumes to the downstream system.

### To Add A Forward Rule:

Open **Configure Pipeline**, click **Add Rule** under **Rules**, then select **FORWARD**. Complete the shared fields and condition in [.](./ "mention").

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-18 15-00-05.png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
Forward rules cannot be mixed with other rule types.
{% endhint %}

Select preview data before choosing labels. Fields come from **Pipeline Preview**. You can also type a label manually.

Enter the name and select a group for the Forward rule.

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-21 16-12-08.png" alt=""><figcaption></figcaption></figure>

Navigate to the `Forward Labels` tab, click on the `Forward Labels` toggle and select the fields that need to be forwarded. In this case, only the selected fields get forwarded.

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-21 16-12-33.png" alt=""><figcaption></figcaption></figure>

### Rename Attributes:

This feature allows the user to rename the log attributes before forwarding it to any destination.&#x20;

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-21 16-13-15.png" alt=""><figcaption></figcaption></figure>

> Attribute is a piece of information which determines the properties of a field or tag.

{% hint style="info" %}
Renaming log attributes will only work when logs are being forwarded to any destination.
{% endhint %}

\
You should use this feature if:

* You want to **increase cost savings**
* You want to **decrease the payload size** being forwarded
* You want to rename the labels to **maintain a set standard across teams**
* You want to rename the attributes to **enhance the readability**

**To Rename Attributes:**

* Click on the `Rename Labels` tab enable the `Rename Labels` option.

There are 2 ways to choose fields to rename:

1. Using regex. Mention a regex to match with the field and the replacing text to the regex match phrase

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-21 16-23-48.png" alt=""><figcaption></figcaption></figure>

2. Explicitly mention the field name and the replacement text.

<figure><img src="../../.gitbook/assets/Screenshot from 2026-09-21 16-21-54.png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
**NOTE:**\
You should make sure that multiple rules are not active on a similar namespace;, otherwise, both rules will be applied, which will result in duplicate data being forwarded.
{% endhint %}
