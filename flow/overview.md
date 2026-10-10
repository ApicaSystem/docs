# Flow Overview

The Apica Flow telemetry data pipeline is the foundation for sustainable, cost-effective observability in the AI era. Instead of sending everything downstream, we transform data first: reducing, cleansing, and enriching it before it ever hits an expensive platform.

We route and re-route logs, metrics, traces, and events from any source to any destination. And we optimize how that data is stored — for compliance, for LLM use cases, whatever your requirements are. It's a fundamentally different approach than 'ingest everything and pay for it later.'

<figure><img src="../.gitbook/assets/image (416).png" alt=""><figcaption></figcaption></figure>

Here's what that looks like architecturally. On the left, we pull in IT and security data — logs, metrics, events, traces — from any source using open-source collectors. That flows through our pipeline, where we apply filter rules — you can aggregate, extract, filter, forward, rewrite, tag, whatever your policies require.

<figure><img src="../.gitbook/assets/image (417).png" alt=""><figcaption></figcaption></figure>

From there it goes wherever you need it: SIEM, cloud storage, or your existing tools. A key differentiator is InstaStore, our advanced data management layer — it gives you an S3-compatible data lake that decouples storage from compute, so you can index for fast retrieval or just filter and forward. All of this runs the same way whether you're SaaS, on-prem, or hybrid.

#### Transform raw data into normalized, compliant, & cost-efficient observability

Here is a clear example. Starting with a raw event before it enters the pipeline — it's got PII, payment card details, internal IPs, high-cardinality fields like session and transaction IDs. It's large, hard to search consistently, and expensive to store and index. After it passes through Flow, we strip out the non-operationally-relevant fields, remove the PII and PCI data automatically, and typically reduce log volume by 60 to 80%. The result: lower costs, better compliance with things like GDPR and PCI-DSS, and faster queries and dashboards because you're not searching through noise.

<figure><img src="../.gitbook/assets/Screenshot 2026-10-09 at 6.08.49 PM.png" alt=""><figcaption></figcaption></figure>

#### Drop Entire Logs Before They Are Ingested

Another example — Kubernetes environments generate a massive amount of noise: health checks, probes, successful 200 responses, internal plumbing. None of that is actionable. With Flow's filter rules, we drop those entire log lines before they're ever ingested — they're never even written to your platform. What's left is the stuff that actually matters — memory pressure alerts, database timeouts, crash loops, 5xx errors. Same signal, dramatically less volume, faster time to insight.

<figure><img src="../.gitbook/assets/image (421).png" alt=""><figcaption></figcaption></figure>

## **Apica Flow's Design Guidelines**

**Never Block**

An observability pipeline needs to be elastic to support such scenarios. Causing the source of the data to block because the pipeline does not have adequate storage or cannot scale up elastically will lead to data loss. Most sources of data do not have infinite storage either and will eventually rotate their pending logs to prevent running out of disk space. This can mean loss of critical data that could be holding information about an application failure, a security attack, a performance issue, etc. **Block the sender is not an acceptable feature or architecture for data pipeline platforms** except in the most extreme of circumstances like a major disaster event such as the data center going offline.

**Never Drop**

When forwarding data to target systems, it is not uncommon to have network partitions, services go offline at the target causing the data pipeline to now have data coming in but no place to send the data out. The unfortunate reality of DIY pipelines and software solutions that are emerging is to drop the data! For an enterprise that is running critical data through these pipelines that contain valuable data on their production systems, security, and compliance insights, this has to be unacceptable. yet Drop data seems to have become an acceptable feature documented by some vendors who implement data pipelines.

**Infinite Data Reservoir**

The only way to address the pipeline source and destination mismatch is to have an attached infinite data reservoir. This has traditionally not been possible due to the limitations of disk-based designs.

Apica solves this with InstaStore. Our storage layer is built on an object-store as a primary storage layer, but unlike most approaches to using object storage, which use it as a secondary tier, we use it as a primary tier and index 100% of the data. All our data as well as metadata is stored in object storage.

Our approach provides instant elasticity in terms of storage requirements with ZeroStorageTax. No need to expand storage, throttle senders, scramble to handle more throughput needs. It is infinite and always attached to the LogFlow system.

**Elastic architecture**

An elastic design is needed to ensure that data sources sending more data can be handled by the data pipeline without any manual intervention. Not doing so will lead to data backlogs on the source and cause data loss in the event the backlog build-up for long durations.

## <mark style="color:green;">"Never Block"</mark> and <mark style="color:green;">"Never Drop"</mark> with <mark style="color:green;">InstaStore</mark>

We built our InstaStore to handle the challenges faced by enterprises in high-volume environments. 100% of all data coming in LogFlow is written to InstaStore before being forwarded. InstaStore provides an infinite storage layer by abstracting storage as an API and building on top of any object-store.

Build your data pipelines from day 0 with infinite storage that can act as an endless store for throughput mismatches on either the source or the target. Any data in the InstaStore can be instantly replayed to a target on demand. <mark style="color:green;">**Never block or never drop data with InstaStore**</mark>**.**

<figure><img src="../.gitbook/assets/image (155).png" alt=""><figcaption></figcaption></figure>

## Elastic Architecture with Kubernetes

Apica's LogFlow is built on Kubernetes and works with Cluster Autoscaling and Horizontal Pod Autoscaling providing instant throughput on-demand in high volume data environments.

<figure><img src="../.gitbook/assets/image (156).png" alt=""><figcaption><p>Native Kubernetes design makes platform elastically scale on-demand</p></figcaption></figure>

## Resilience

For Apica cloud-based RPO and RTO targets, the table below covers the failure scenarios and target RPO/RTO system behavior:

* Flow forwards data; it isn't the system of record. End-to-end RPO depends on the sources holding their own data: agent-side buffers, Kafka retention, and syslog senders that retry. Using protocols that require acknowledgement plus "Block" mode (HTTP 429 so senders retry) is what brings RPO close to zero.
* Lake makes downstream recovery better. If data is landing in InstaStore, any tool that missed data during an outage can be replayed. That effectively gives a zero RPO for the destination even after the forwarder's buffer runs out.

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top"><strong>Failure scenario</strong></td><td valign="top"><strong>Expected RPO</strong></td><td valign="top"><strong>Expected RTO</strong></td><td valign="top"><strong>What makes it possible</strong></td></tr><tr><td valign="top">A destination goes down (Splunk, SIEM, etc.)</td><td valign="top">0, as long as the outage is shorter than the buffer (about 1–2 hrs with 50–100 GB SSD per node)</td><td valign="top">Minutes after the destination comes back, while the queue empties</td><td valign="top">Each forwarder has its own persistent queue</td></tr><tr><td valign="top">A node or pod fails</td><td valign="top">0 to seconds (only data in memory on that node is at risk)</td><td valign="top">Under 5 min, with no loss of throughput</td><td valign="top">Sizing for 20% of nodes offline (1.5× capacity); Kubernetes restarts the pod; "Block" mode makes senders retry</td></tr><tr><td valign="top">A whole cluster or zone is lost (one cluster)</td><td valign="top">Minutes up to the depth of the local queues</td><td valign="top">2–4 hrs to rebuild or redeploy</td><td valign="top">Infrastructure-as-code / Helm redeploy; sources keep their own buffers</td></tr><tr><td valign="top">A region is lost (a second, standby cluster)</td><td valign="top">About 15 min</td><td valign="top">1–4 hrs</td><td valign="top">Requires the multi-cluster disaster-recovery design that Apica only scopes in an architecture review (needed above 10 TB/day)</td></tr><tr><td valign="top">Lake / InstaStore data</td><td valign="top">Follows the object store's replication (e.g., S3 cross-region, usually under 15 min)</td><td valign="top">Matches the cluster RTO; data can then be replayed to any tool</td><td valign="top">InstaStore sits on object storage; Replay backfills destinations</td></tr></tbody></table>

**For Apica's SaaS cloud-hosted Flow, our target RPO ≈ 0 for destination outages within the buffer window. Our target RTO is under 5 minutes for node failures.**&#x20;

For on-premises deployments, the customer's own infrastructure and the Apica architecture review set the targets. Also, regional DR targets are typically set during the architecture review.

## Deployment

**Apica's FLOW** is built as a native Kubernetes platform and is available as a HELM chart for deployment on any Kubernetes environment.

#### DIY or Managed <a href="#diy-or-managed" id="diy-or-managed"></a>

LogFlow can be deployed and optimized for your enterprise and allows flexible deployment models

<figure><img src="../.gitbook/assets/image (157).png" alt=""><figcaption><p>Flexible deployment options</p></figcaption></figure>
