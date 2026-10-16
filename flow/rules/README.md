# Rules

Rules transform, filter, enrich, and route telemetry in a pipeline. Open **Configure Pipeline**, then click **Add Rule** under **Rules**. Select the required rule type from the menu.

The menu lists **AGGREGATE**, **CODE**, **EXTRACT**, **FILTER**, **FORWARD**, **REWRITE**, **SIEM**, **STREAM**, **TAG**, and **EXISTING RULES**. Select **EXISTING RULES** to attach saved rules. This opens the **Configure Rules for - \<pipeline>** dialog.

Every rule form includes **Rule Description** and **Docs for \<TYPE> Rule**. The documentation button opens the matching rule guide in a drawer.

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FfuWDC0lopgQeB1NVxIjg%2FScreen%20Shot%202024-06-27%20at%206.11.51%20PM.png?alt=media&#x26;token=31f6a1d9-cbe9-4ebc-bba5-fa42b815c9ec" alt=""><figcaption></figcaption></figure>

### Rule types

* [aggregate.md](aggregate.md "mention")
* [code.md](code.md "mention")
* [extract.md](extract.md "mention")
* [filter.md](filter.md "mention")
* [forward.md](forward.md "mention")
* [rewrite.md](rewrite.md "mention")
* [siem-and-tag.md](siem-and-tag.md "mention")
* [stream.md](stream.md "mention")

{% hint style="warning" %}
Forward rules cannot be mixed with other rule types.
{% endhint %}

<figure><img src="https://2948796384-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LmzGprckLqwd5v6bs6m%2Fuploads%2FoNsNW6eF8ky2hFpdRsXw%2Fimage.png?alt=media&#x26;token=4d11ec58-282b-4ec6-9b43-5208f00c3013" alt=""><figcaption></figcaption></figure>

### Common fields

All rule forms start on the **Details** tab. Enter **Name** first. Names can contain up to 180 characters. The system replaces non-word characters with `_` and lowercases the result. It checks uniqueness when the field loses focus.

Select **Group** next. Search for an existing group, or select **Create new group: \<name>**. Add an optional **Description** of up to 250 characters. SIEM and TAG rules also require **Level**: Low, Medium, High, or Critical.

The **Name** and **Group** fields are locked after you save the rule.

Add a condition with **+ Add more parameters**. Each condition has a field, operator, and value. Supported operators are `=~`, `==`, `!=`, `!~`, `>`, `>=`, `<`, and `<=`. The default is `=~`. Use **OR** to add an alternative condition. The resulting expression appears below the rule as `Condition: <expr>`.

### Labels and preview data

Label pickers use fields from logs in **Pipeline Preview**. Select a source first: **Sample Logs**, **Data Flows**, **GenAI**, **Captured Data**, or **Live Tail**. Without preview data, pickers are empty, but you can type a label manually.

Condition fields also include **Timestamp**, **ProcID**, **SeverityString**, **Hostname**, and **Message**. Labels beginning with `_` stay hidden. This applies to condition fields, label pickers, mask fields, **Group By**, and SIEM labels.
