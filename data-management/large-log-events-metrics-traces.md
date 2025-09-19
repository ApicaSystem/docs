---
description: Large log/events are single events/logs that exceed 16KB in size.
---

# Large log/events/metrics/traces

Apica Ascent automatically handles large log/events/metrics/traces by directly uploading them to the object store as a separate object. These objects are fully indexed but do not show up with inline content in searches but instead provide a link to download the object from the search results.

{% hint style="info" %}
One can push data as large a 1MB to be indexed and be fully searchable via the Apica Ascent APIs. Ingesting large objects may have limitations when using protocols such as syslog as they may enforce smaller payload limits
{% endhint %}

<figure><img src="../.gitbook/assets/Screen Shot 2023-01-02 at 1.28.28 PM.png" alt=""><figcaption></figcaption></figure>
