---
description: Agent management with Fleet
---

# Agents

With Fleet, you can effectively track and manage large collections of telemetry collection agents across your observability systems. See up-to-date status information about all agents. Apply updates to agent configurations, or install new agents, or upgrade existing ones.

**Agents List:**

This shows agents registered with Fleet. Filter the agents by name, host name, version and agent type. The Actions menu allows actions to be performed on selected agents. Actions include starting, stopping, restarting, or deleting agents.

<figure><img src="../.gitbook/assets/image (505).png" alt=""><figcaption><p>Agents List</p></figcaption></figure>

**Agent Details:**&#x20;

Select any configured agents, then agent detail's view will show. Which has details and configuration files. The detail's view contains the description, tags, versions, agent created date and updated date.  This view also displays the current health and status information about the agent, and a short tail of the agent log output.

<figure><img src="../.gitbook/assets/Screenshot 2025-01-15 at 14-10-33 Fleet.png" alt=""><figcaption><p>Agent Details</p></figcaption></figure>

**Configuration Files:**

Select the configuration flies tab to view current active configuration that is assigned for the agent. This view displays any active configurations assignments, and can review past, inactive assignments.

<figure><img src="../.gitbook/assets/Screenshot 2025-01-15 at 14-12-56 Fleet.png" alt=""><figcaption><p>Configuration Files</p></figcaption></figure>

**Assign Configuration:**

Click on the **Assign Configuration** button to manually assign a configuration configuration to the agent. Choose the configuration, from the drop-down list of available configurations for the agent type and platform, and assign it to the agent, then the Fleet agent-manager will apply this configuration and restart the agent.&#x20;

Click the **Refresh** button to update the status of the view.&#x20;

<figure><img src="../.gitbook/assets/Screenshot 2025-01-15 at 14-21-55 Fleet.png" alt=""><figcaption><p>Assign Configuration</p></figcaption></figure>

#### Package Assignment:

Select the package assignment tab to review any packages assigned and installed for the agent.

<figure><img src="../.gitbook/assets/Screenshot 2025-01-15 at 14-25-01 Fleet.png" alt=""><figcaption><p>Package Assignment</p></figcaption></figure>
