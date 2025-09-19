---
description: >-
  This feature allows the user to rename the log attributes before forwarding it
  to any destination.
---

# Rename Attributes

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

To rename the log attributes you can head to the `Create Rule` page.

* Go to the "Forward" section.
* Fill the details that are asked such as "_Name", "Group", "Description", "Namespace", "Application Match"_, and if you want you can add more parameters.
* Toggle the "Forward Labels" button, and select the Labels that are to be Forwarded to the destination.
* Toggle the "Rename Labels" button, and Select the labels that have to be renamed before they are forwarded.
* You will be able to see all the selected labels and Input fields corresponding to every labels, Rename the labels according to your needs.
* Click "Create rule" button.
* Now, this Rule is created and it can be previewed in "Active Rules" page.

{% hint style="warning" %}
**NOTE:**\
You should make sure that multiple rules are not active on a similar namespace, otherwise, both rules will be applied which will result in duplicate data being forwarded.
{% endhint %}

<figure><img src="../../../.gitbook/assets/create-rule-forward-template.png" alt=""><figcaption><p>Create Rule Page</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/forward-rename-labels.png" alt=""><figcaption><p>Forward Labels and Rename Labels</p></figcaption></figure>

## Editing Renamed Labels

To edit the renamed labels you should go to "Active Rules" page.

* You will be able to see the renamed labels in the red tags.
* You will get the "Edit Rule" option from the three dots at the end of the row.
* Clicking on the Edit Rule will open a modal which has a table with all the old label names and the corresponding new label names.
* You can edit any of the fields, you can add new labels which have to be renamed, you can even delete a mapping.
* After clicking "Update" button, this forward rule will be updated and the changes will be reflected across the Apica Ascent system.

<figure><img src="../../../.gitbook/assets/rule-list-labels.png" alt=""><figcaption><p>Forward Rule in Active Rules</p></figcaption></figure>

> You will be able to see the `Renamed Labels` in red tags. Each tag shows the old label name and the new labels name in the format <mark style="background-color:red;">LABEL➤RENAMED\_LABEL</mark>.

<figure><img src="../../../.gitbook/assets/forward-edit-rule.png" alt=""><figcaption><p>Edit Rule page</p></figcaption></figure>

> You will be able to:
>
> * edit a existing label name and renamed label
> * delete a renamed label mapping
> * add new labels to rename

After [mapping forwarder to namespace](https://logflow-docs.logiq.ai/flow-management/mapping-applications), this rule will start working and all the logs which are being forwarded will have the renamed attributes instead of the default attributes.
