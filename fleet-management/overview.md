---
description: Fleet management overview
---

# Overview

Fleet is the ultimate solution for making the collection of observability data responsive to changes in your environment using your pre-existing observability agents.

With Fleet, you can collect more data when you need it and less when you don’t. And the best part? Almost all observability agents can be managed through configuration files describing how to collect, enrich and send data.&#x20;

Fleet aims to simplify this process through an agent manager. The Fleet Agent Manager functions as a sidecar utility that checks for new configuration files and triggers the appropriate restart/reload functionality of the supported agent. The Agent Manager is kept intentionally simple, with the goal that it only needs to be installed once and updated infrequently.&#x20;

Navigate **Explore > Fleet** will show the agent list that are configured and managed by the fleet.

<figure><img src="../.gitbook/assets/image (493).png" alt=""><figcaption><p>Apica Fleet</p></figcaption></figure>

**Supported Agent Types:**

The fleet platform comes with many agent types already set up, the ability to add custom agent types, and assign configurations to them all from the intuitive fleet UI.&#x20;

<figure><img src="../.gitbook/assets/Screenshot 2025-01-15 at 14-07-00 Fleet.png" alt=""><figcaption></figcaption></figure>

**Fleet Agent Status Metric:**

There is a new status metric, available in Apica Ascent, to track the status of Fleet agents which can be accessed by the name "logiq\_agent\_liveness" from the query page.&#x20;

Following is the meaning of each status:&#x20;

<table data-full-width="false"><thead><tr><th width="119" align="center">Sl. No.</th><th width="344" align="center">Agent Status</th><th align="center">Metric Value</th></tr></thead><tbody><tr><td align="center">1.</td><td align="center">Active, Running, Maintenance</td><td align="center">0</td></tr><tr><td align="center">2.</td><td align="center">Disconnected</td><td align="center">1</td></tr><tr><td align="center">3.</td><td align="center">Inactive, Stopped, Stopping</td><td align="center">-1</td></tr><tr><td align="center">4.</td><td align="center">Error</td><td align="center">2</td></tr></tbody></table>
