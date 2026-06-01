---
description: >-
  This page describes the deployment sizing parameters of a typical on-premises
  production deployment of Apica Flow.
---

# On-Premises Sizing Guide

## 1. Purpose and Scope

This document establishes a formal ingest rate benchmark and environment sizing guide for Apica Flow, derived from controlled benchmark testing on Intel x86 hardware. The benchmark provides procurement teams, solutions architects, and platform engineers with a reproducible, defensible sizing framework expressed in GB/day per vCPU — the industry-standard unit for telemetry pipeline capacity planning.

Two distinct benchmark baselines are defined, reflecting the two primary deployment modes of Apica Flow:

* **Benchmark 1 — Apica Flow Only (Non-Indexing):** Telemetry pipeline processing without data flowing into Apica Lake. Applicable to pass-through, filter, enrich, and route deployments where Apica Lake is not the primary destination.
* **Benchmark 2 — Apica Flow with Apica Lake (Indexing):** Full-stack deployment with all inbound telemetry indexed and stored in Apica Lake (powered by InstaStore™). Applicable to deployments requiring infinite retention, long-term forensic replay, and compliance data archival.

All benchmark measurements were conducted on Intel x86 (hyperthreaded vCPU) hardware. ARM processor results are not included in this release.

## 2. Benchmark Test Conditions

### 2.1 Test Environment Specifications

Both benchmarks were executed under identical, controlled test environment conditions to ensure comparability. The specifications below represent the minimum validated hardware configuration.

| **Parameter**                            | **Value**                                                    |
| ---------------------------------------- | ------------------------------------------------------------ |
| Processor architecture                   | Intel x86 (hyperthreaded vCPU)                               |
| vCPU count (test environment for ingest) | 1 vCPU                                                       |
| RAM (test environment for ingest)        | 2 GB                                                         |
| Benchmark measurement unit               | GB per day (GB/day) per vCPU                                 |
| Data types tested                        | Mixed log telemetry (syslog, JSON, structured events)        |
| Pipeline mode — Benchmark 1              | Apica Flow only, non-indexing (no Apica Lake write)          |
| Pipeline mode — Benchmark 2              | Apica Flow with Apica Lake indexing (full InstaStore™ write) |

### &#x20;2.2 Measured Benchmark Results

<table data-header-hidden><thead><tr><th width="191.93359375"></th><th width="172.99609375"></th><th></th><th></th></tr></thead><tbody><tr><td><strong>Benchmark</strong></td><td><strong>Measured throughput (GB/day per vCPU)</strong></td><td><strong>Measured throughput (GB/hour per vCPU)</strong></td><td><strong>Test environment for Ingest Components (vCPU / RAM)</strong></td></tr><tr><td><mark style="color:purple;"><strong>APICA FLOW ONLY (Non-Indexing, no Apica Lake)</strong></mark></td><td><mark style="color:purple;"><strong>170 GB/day</strong></mark></td><td><mark style="color:purple;"><strong>~7.1 GB/hr</strong></mark></td><td><mark style="color:purple;"><strong>1 vCPU / 2 GB RAM</strong></mark></td></tr><tr><td><mark style="color:purple;"><strong>APICA FLOW + LAKE (Indexing with InstaStore™ write)</strong></mark></td><td><mark style="color:purple;"><strong>45 GB/day</strong></mark></td><td><mark style="color:purple;"><strong>~1.9 GB/hr</strong></mark></td><td><mark style="color:purple;"><strong>1 vCPU / 2 GB RAM</strong></mark></td></tr></tbody></table>



<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top"><strong>Important</strong>: These measurements reflect a 1 vCPU / 2 GB RAM test environment for data ingest components. Production deployments benefit from linear throughput scaling with additional vCPUs. Apply the workload adjustment factors in Section 4 and the sizing formula in Section 7 to derive production environment requirements from these baselines.</td></tr></tbody></table>

### 2.3 Data Ingest Sizing Assumptions

The following assumptions apply to both benchmark measurements and all sizing calculations in this document. Deviations from these assumptions — particularly significantly larger average log sizes — will affect effective throughput and should be accounted for in production sizing.

| **Assumption**                            | **Value / Description**                                                                                                                      |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Average log event size                    | 4 KB per log event (average across benchmark test runs)                                                                                      |
| Log size range observed                   | 2 KB (minimum) to 6 KB (maximum) per log event during benchmark testing                                                                      |
| Log format                                | Mixed telemetry: syslog (RFC5424), structured JSON, and raw event formats                                                                    |
| Throughput measurement basis              | Compressed inbound data volume (GB/day), consistent with industry-standard telemetry pipeline capacity units                                 |
| Pipeline fan-out                          | Single destination for Tier 1 baseline; Tier 2 (recommended) assumes 2 output destinations with −15% adjustment applied                      |
| Processing complexity                     | Benchmark 1 Tier 1 (pass-through): filter rules only, no enrichment. Tier 2 includes PII redaction and attribute tagging.                    |
| InstaStore™ write mode (Benchmark 2 only) | Full indexing: 100% of inbound data written to object storage before forwarding. Indexing overhead is included in the 45 GB/day base figure. |
| Processor architecture                    | Intel x86 with hyperthreading (1 physical core = 2 vCPUs). Test environment: 1 vCPU / 2 GB RAM.                                              |

<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top"><strong>Log size sensitivity:</strong> The 4 KB average log size is the baseline for all sizing calculations in this document. If your environment’s average log size differs significantly — for example, verbose application logs averaging 12 KB, or compact network flow records averaging 512 bytes — effective throughput per vCPU will scale inversely with log size. A 2× increase in average log size (4 KB → 8 KB) reduces effective event throughput per vCPU by approximately 50%, though GB/day capacity remains constant. Contact Apica for log-size-adjusted sizing guidance.</td></tr></tbody></table>

## 3. Throughput Tiers by Workload Complexity

The benchmark baselines in Section 2 represent controlled, single-worker measurements. Real-world pipelines include transformation rules, enrichment functions, multiple output destinations, and stateful processing that reduce effective throughput. The following tiers apply to both benchmarks.

### 3.1 Benchmark 1 Tiers — Apica Flow Only (Base: 170 GB/day per vCPU)

<table data-header-hidden><thead><tr><th width="157.203125"></th><th></th><th></th><th width="159.671875"></th><th></th></tr></thead><tbody><tr><td><strong>Workload tier</strong></td><td><strong>Pipeline characteristics</strong></td><td><strong>GB/day per vCPU</strong></td><td><strong>GB/hr per vCPU</strong></td><td><strong>RAM per vCPU</strong></td></tr><tr><td>Tier 1 Pass-through</td><td>Simple routing and filter rules only. 1 input → 1 output. No transformation.</td><td>170</td><td>~7.1</td><td>2 GB</td></tr><tr><td>Tier 2 Standard (Recommended)</td><td>Typical production pipeline. Filter + tag + rewrite + PII redaction. 1 input → 2 outputs (e.g. SIEM + S3). Recommended planning baseline.</td><td>140</td><td>~5.8</td><td>2–4 GB</td></tr><tr><td>Tier 3 Enriched</td><td>Enrichment-heavy: lookup tables, attribute-based tagging, multi-destination SIEM routing with load balancing.</td><td>100</td><td>~4.2</td><td>4–6 GB</td></tr><tr><td>Tier 4 Complex</td><td>Heavy transformation: cryptographic hashing (SHA-256/AES), stateful aggregations, cross-event persistence, 3+ destinations, custom forwarders.</td><td>70</td><td>~2.9</td><td>6–8 GB</td></tr><tr><td>Tier 5 AI / LLM</td><td>LLM/AI observability: token tracking, prompt/response telemetry, real-time secret redaction, multi-tenant routing, high-cardinality metadata.</td><td>50</td><td>~2.1</td><td>8–12 GB</td></tr></tbody></table>

### 3.2 Benchmark 2 Tiers — Apica Flow + Apica Lake (Base: 45 GB/day per vCPU)

When Apica Lake (InstaStore™) indexing is active, all inbound data is written to object storage before forwarding. This I/O cost is reflected in the lower base throughput. The same workload multipliers apply.

<table data-header-hidden><thead><tr><th></th><th width="251.0546875"></th><th width="130.3125"></th><th width="111.453125"></th><th></th></tr></thead><tbody><tr><td><strong>Workload tier</strong></td><td><strong>Pipeline characteristics</strong></td><td><strong>GB/day per vCPU</strong></td><td><strong>GB/hr per vCPU</strong></td><td><strong>RAM per vCPU</strong></td></tr><tr><td>Tier 1 Pass-through + Lake</td><td>Simple routing and filter only, with full InstaStore™ indexing. 1 input → Lake + 1 output.</td><td>45</td><td>~1.9</td><td>2–4 GB</td></tr><tr><td>Tier 2 Standard + Lake (Recommended)</td><td>Typical production: filter + tag + rewrite + PII redaction. InstaStore™ write + 1 downstream output. Recommended baseline for Lake deployments.</td><td>38</td><td>~1.6</td><td>4 GB</td></tr><tr><td>Tier 3 Enriched + Lake</td><td>Enrichment pipeline with Lake indexing: lookup tables, tagging, multi-destination routing plus InstaStore™.</td><td>28</td><td>~1.2</td><td>4–6 GB</td></tr><tr><td>Tier 4 Complex + Lake</td><td>Heavy transformation, crypto hashing, stateful aggregations, 3+ destinations, InstaStore™ indexing.</td><td>20</td><td>~0.8</td><td>6–8 GB</td></tr><tr><td>Tier 5 AI / LLM + Lake</td><td>Full AI/LLM observability stack with InstaStore™ indexing, prompt retention, and high-cardinality metadata.</td><td>14</td><td>~0.6</td><td>10–16 GB</td></tr></tbody></table>

<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top"><strong>Tier 2 (Standard)</strong> is the recommended default planning baseline for both benchmarks. Use Tier 1 only for pure pass-through deployments with no transformation rules. Use Tier 3–5 for enrichment-heavy, compliance, or AI-observability workloads.</td></tr></tbody></table>

## 4. Workload Adjustment Factors

The following factors reduce effective throughput from the Tier 2 baseline for each benchmark. Apply deductions multiplicatively for deployments that combine multiple factors.

<table data-header-hidden><thead><tr><th width="177.9765625"></th><th width="189.67578125"></th><th></th></tr></thead><tbody><tr><td><strong>Factor</strong></td><td><strong>Throughput impact</strong></td><td><strong>Notes</strong></td></tr><tr><td>Each additional output destination beyond the first</td><td>−15% per additional destination</td><td>Each Apica Flow forwarder adds outbound I/O load. Two destinations: ×0.85. Three destinations: ×0.70. Four or more: ×0.55.</td></tr><tr><td>Lookup table enrichment (tables > 1M rows)</td><td>−10% to −20%</td><td>Large lookup tables are loaded into heap memory per worker process. Provision +1–2 GB RAM per worker per large lookup table loaded.</td></tr><tr><td>JavaScript CODE rule execution (ascent.* functions)</td><td>−10% to −30%</td><td>Simple field manipulation: −10%. Cryptographic functions (SHA-256, AES): −20%. Complex stateful logic with ascent.persist: −30%.</td></tr><tr><td>Stateful aggregations (cross-event state)</td><td>−20% to −35%</td><td>Deduplication counters, rate aggregations, and time-windowed metrics consume heap memory proportional to event cardinality.</td></tr><tr><td>PII / secret redaction (regex-based masking)</td><td>−5% to −15%</td><td>Simple field masking: −5%. Multi-field regex extraction and masking across large events: −15%.</td></tr><tr><td>Apica Lake InstaStore™ write (Benchmark 2 only)</td><td>Already included in Benchmark 2 baselines</td><td>The I/O cost of full InstaStore™ indexing is reflected in the Benchmark 2 baselines (Section 3.2). Do not apply an additional deduction for Lake writes when using Benchmark 2 figures.</td></tr><tr><td>Traffic spike buffer (recommended planning practice)</td><td>Plan for 2× average peak</td><td>Initial environment sizing should include a 2× buffer for incident-driven log volume spikes. Apica Flow’s Kubernetes HPA provides auto-scaling headroom, but initial node pool provisioning should not rely solely on autoscaling.</td></tr><tr><td>Node redundancy (rolling restart / maintenance)</td><td>+20% capacity above target (or +1 node minimum)</td><td>Standard HA model: maintain sufficient capacity to handle target throughput with 20% of nodes offline simultaneously. Apply as a ×1.2 multiplier to provisioned vCPU count.</td></tr></tbody></table>

## 5. Sizing Examples

The following examples illustrate the full sizing calculation process for typical enterprise deployment scenarios. Both examples use a standard downstream observability tool environment — a common pattern in which Apica Flow routes telemetry to a SIEM or analytics platform and an object storage archive.

### 5.1 Example A: 5 TB/day Standard Observability Pipeline (Benchmark 1 — Flow Only)

<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top"><strong>Scenario:</strong> An enterprise forwards 5 TB/day of logs, metrics, and traces to Apica Flow, with routing to a downstream SIEM platform and long-term retention in S3 object storage. Pipeline includes routing rules, PII masking, and attribute tagging. Two output destinations. Apica Lake indexing is not required.</td></tr></tbody></table>

<table data-header-hidden><thead><tr><th width="96.48828125"></th><th></th><th></th></tr></thead><tbody><tr><td><strong>Step</strong></td><td><strong>Calculation</strong></td><td><strong>Result</strong></td></tr><tr><td>1</td><td>Select workload tier</td><td>Tier 2 Standard: 140 GB/day per vCPU (PII masking, 2 destinations; adjusted from 170 GB/day Benchmark 1 base)</td></tr><tr><td>2</td><td>Apply multi-destination adjustment: 2 outputs → ×0.85</td><td>140 × 0.85 = 119 GB/day per vCPU (effective)</td></tr><tr><td>3</td><td>Calculate raw vCPUs: 5,000 GB/day ÷ 119 GB/day per vCPU</td><td>42.0 → round up to 43 vCPUs</td></tr><tr><td>4</td><td>Apply 2× peak spike buffer: 43 vCPUs × 2</td><td>86 vCPUs for peak handling</td></tr><tr><td>5</td><td>Apply +20% node redundancy: 86 vCPUs × 1.2</td><td>104 vCPUs total provisioned capacity</td></tr><tr><td>6</td><td>Node sizing: Intel c7i.4xlarge (16 vCPUs, 32 GB RAM). Reserve 1 vCPU per node for OS → 15 usable per node. 104 ÷ 15 = 6.9</td><td>7× c7i.4xlarge worker nodes (105 usable vCPUs, 224 GB RAM)</td></tr><tr><td>7</td><td>RAM check: Tier 2 = 2–4 GB/vCPU. At 2 GB/vCPU: 15 vCPUs × 2 GB = 30 GB per node. c7i.4xlarge provides 32 GB.</td><td>RAM check passed. c7i.4xlarge sufficient for Tier 2 standard workload.</td></tr></tbody></table>

### 5.2 Example B: 5 TB/day with Apica Lake Indexing (Benchmark 2 — Flow + Lake)

<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top"><strong>Scenario:</strong> The same enterprise requires full InstaStore™ indexing into Apica Lake for forensic replay, long-term retention, and compliance archival, in addition to routing to a downstream SIEM platform. Same 5 TB/day volume, same two output destinations and PII masking. This example demonstrates the additional vCPU requirement when Lake indexing is active.</td></tr></tbody></table>

<table data-header-hidden><thead><tr><th width="92.66796875"></th><th></th><th></th></tr></thead><tbody><tr><td><strong>Step</strong></td><td><strong>Calculation</strong></td><td><strong>Result</strong></td></tr><tr><td>1</td><td>Select workload tier</td><td>Tier 2 Standard + Lake: 38 GB/day per vCPU (PII masking, 1 downstream output; adjusted from 45 GB/day Benchmark 2 base)</td></tr><tr><td>2</td><td>Apply multi-destination adjustment: 1 downstream output beyond Lake → ×0.85</td><td>38 × 0.85 = 32.3 GB/day per vCPU (effective)</td></tr><tr><td>3</td><td>Calculate raw vCPUs: 5,000 GB/day ÷ 32.3 GB/day per vCPU</td><td>154.8 → round up to 155 vCPUs</td></tr><tr><td>4</td><td>Apply 2× peak spike buffer: 155 vCPUs × 2</td><td>310 vCPUs for peak handling</td></tr><tr><td>5</td><td>Apply +20% node redundancy: 310 vCPUs × 1.2</td><td>372 vCPUs total provisioned capacity</td></tr><tr><td>6</td><td>Node sizing: Intel c7i.4xlarge (16 vCPUs, 32 GB RAM). 1 vCPU OS reserve → 15 usable. 372 ÷ 15 = 24.8</td><td>25× c7i.4xlarge worker nodes (375 usable vCPUs, 800 GB RAM)</td></tr><tr><td>7</td><td>RAM check: Tier 2 + Lake = 4 GB/vCPU. 15 vCPUs × 4 GB = 60 GB per node. c7i.4xlarge provides 32 GB.</td><td>Upgrade to c7i.8xlarge (32 vCPUs, 64 GB RAM) for RAM headroom. 372 ÷ 31 = 12 nodes.</td></tr><tr><td>8</td><td>Revised node count with c7i.8xlarge (31 usable vCPUs): 372 ÷ 31 = 12.0</td><td>12× c7i.8xlarge worker nodes (372 usable vCPUs, 768 GB RAM) — RAM verified.</td></tr></tbody></table>

<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top"><strong>Benchmark 1 vs. Benchmark 2 comparison:</strong> For the same 5 TB/day workload, Benchmark 1 (Flow only) requires 7× c7i.4xlarge nodes, while Benchmark 2 (Flow + Lake) requires 12× c7i.8xlarge nodes. The InstaStore™ write overhead reduces effective throughput by approximately 73% (170 vs. 45 GB/day base), which is expected given the full-indexing, infinite-retention architecture.</td></tr></tbody></table>

### 5.3 Example C: 20 TB/day Enriched Observability Pipeline (Benchmark 1 — Flow Only)

<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top"><strong>Scenario:</strong> A large enterprise or government organisation forwards 20 TB/day of mixed telemetry (syslog, Windows events, cloud audit trails) to Apica Flow for enrichment, PII redaction, SHA-256 field hashing, and routing to a SIEM platform, an observability analytics tool, and S3 cold archive. Three output destinations.</td></tr></tbody></table>

<table data-header-hidden><thead><tr><th width="88.45703125"></th><th></th><th></th></tr></thead><tbody><tr><td><strong>Step</strong></td><td><strong>Calculation</strong></td><td><strong>Result</strong></td></tr><tr><td>1</td><td>Select workload tier: enrichment + crypto hashing + 3 destinations</td><td>Tier 3 Enriched: 100 GB/day per vCPU (Benchmark 1 base)</td></tr><tr><td>2</td><td>Multi-destination: 3 outputs → ×0.70 (2 × 15% deduction)</td><td>100 × 0.70 = 70 GB/day per vCPU effective</td></tr><tr><td>3</td><td>Raw vCPUs: 20,000 GB/day ÷ 70 GB/day per vCPU</td><td>286 → round up to 288 vCPUs</td></tr><tr><td>4</td><td>2× peak buffer: 288 × 2</td><td>576 vCPUs peak</td></tr><tr><td>5</td><td>+20% redundancy: 576 × 1.2</td><td>692 vCPUs total provisioned</td></tr><tr><td>6</td><td>Node sizing: Intel c7i.4xlarge (16 vCPUs, 32 GB RAM). 1 vCPU OS reserve → 15 usable. 692 ÷ 15 = 46.1</td><td>47× c7i.4xlarge nodes (705 usable vCPUs, 1.5 TB RAM pool)</td></tr><tr><td>7</td><td>RAM check: Tier 3 = 4–6 GB/vCPU. At 4 GB/vCPU: 15 × 4 = 60 GB per node. c7i.4xlarge provides 32 GB.</td><td>Upgrade to c7i.8xlarge (32 vCPUs, 64 GB RAM). 692 ÷ 31 = 22.3 → 23 nodes.</td></tr><tr><td>8</td><td>Final: 23× c7i.8xlarge (31 usable per node × 23 = 713 vCPUs, 64 GB RAM per node)</td><td>23× c7i.8xlarge worker nodes. RAM check: 31 × 4 GB = 124 GB needed vs. 64 GB available — use c7i.16xlarge (64 vCPUs, 128 GB). 692 ÷ 63 = 11 nodes.</td></tr><tr><td>9</td><td>Final verified: 11× c7i.16xlarge (64 vCPUs, 128 GB RAM). 63 usable × 11 = 693 vCPUs.</td><td>11× c7i.16xlarge worker nodes (693 usable vCPUs, 1.4 TB RAM). Throughput verified: 693 × 70 = 48,510 GB/day — covers 20 TB/day with peak + HA headroom.</td></tr></tbody></table>

## 6. Quick Reference Sizing Cards

Use the cards below for initial sizing conversations, capacity planning, and RFP responses. All figures assume Intel x86 vCPUs with hyperthreading, Tier 2 Standard workload (recommended default), 2× peak spike buffer, and +20% node redundancy (+1.2× HA factor).

Node sizing uses AWS c7i family (Intel Ice Lake) as the reference instance type. Equivalent instance types from other providers may be substituted using the same vCPU and RAM ratios.

Each card shows two distinct resource pools that must be provisioned together for a complete deployment:

* Ingest tier (variable): vCPUs, RAM, and disk that scale with daily ingest volume. Values vary per row.
* Core components (static): A fixed overhead of 10 vCPU + 28 GB RAM + 150 GB disk for the Apica Flow UI and data processing services. This is identical across all ingest volumes and both benchmarks. Provision as a dedicated node or reserved capacity within the cluster.

<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top">* Ingest vCPUs include 2× peak spike buffer and ×1.2 HA redundancy (Tier 2 Standard baseline). † RAM: 2 GB/vCPU for Benchmark 1 (Flow only); 4 GB/vCPU for Benchmark 2 (Flow + Lake). ‡ Disk (Benchmark 2 only): 5 GB/ingest pod minimum; 50 GB/ingest pod recommended starting point (1 pod per 4 ingest vCPUs). For deployments exceeding 10 TB/day, contact Apica engineering for a formal architecture review.</td></tr></tbody></table>

#### **QUICK REFERENCE — Benchmark 1: Apica Flow Only (Non-Indexing)**

<table data-header-hidden><thead><tr><th valign="top"></th><th></th><th></th><th></th><th></th></tr></thead><tbody><tr><td valign="top"><strong>Daily ingest volume</strong></td><td><strong>Ingest vCPUs*</strong></td><td><strong>AWS Intel nodes (ingest tier)</strong></td><td><strong>Ingest RAM (2 GB/vCPU)</strong></td><td><strong>Includes Core components (static, all volumes)†</strong></td></tr><tr><td valign="top">50 GB/day</td><td>1 vCPU</td><td>2× c7i.2xlarge</td><td>~2 GB</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">100 GB/day</td><td>2 vCPUs</td><td>2× c7i.2xlarge</td><td>~4 GB</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">250 GB/day</td><td>5 vCPUs</td><td>2× c7i.2xlarge</td><td>~10 GB</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">500 GB/day</td><td>9 vCPUs</td><td>3× c7i.2xlarge</td><td>~18 GB</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">1 TB/day</td><td>17 vCPUs</td><td>4× c7i.2xlarge</td><td>~34 GB</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">2 TB/day</td><td>34 vCPUs</td><td>4× c7i.4xlarge</td><td>~68 GB</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">5 TB/day</td><td>84 vCPUs</td><td>8× c7i.4xlarge</td><td>~168 GB</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">10 TB/day</td><td>167 vCPUs</td><td>14× c7i.4xlarge</td><td>~334 GB</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr></tbody></table>

**Benchmark 1 Notes:** \* Ingest vCPUs include 2× peak spike buffer + ×1.2 HA redundancy (Tier 2 Standard baseline).  † Core components (UI + data processing) are static and must be added to the ingest tier totals: +10 vCPU, +28 GB RAM, +150 GB disk. Provision as a dedicated node or reserved capacity within the cluster.

#### QUICK REFERENCE — Benchmark 2: Apica Flow + Apica Lake (Indexing)

<table data-header-hidden><thead><tr><th valign="top"></th><th></th><th></th><th></th><th></th><th></th></tr></thead><tbody><tr><td valign="top"><strong>Daily ingest volume</strong></td><td><strong>Ingest vCPUs*</strong></td><td><strong>AWS Intel nodes (ingest tier)</strong></td><td><strong>Ingest RAM (4 GB/vCPU†)</strong></td><td><strong>Disk — ingest pods (B2 only)‡</strong></td><td><strong>Includes Core components (static, all volumes)§</strong></td></tr><tr><td valign="top">50 GB/day</td><td>4 vCPUs</td><td>2× c7i.2xlarge</td><td>~16 GB</td><td>5 GB min 50 GB rec</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">100 GB/day</td><td>7 vCPUs</td><td>2× c7i.2xlarge</td><td>~28 GB</td><td>10 GB min 100 GB rec</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">250 GB/day</td><td>16 vCPUs</td><td>4× c7i.2xlarge</td><td>~64 GB</td><td>20 GB min 200 GB rec</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">500 GB/day</td><td>32 vCPUs</td><td>4× c7i.4xlarge</td><td>~128 GB</td><td>40 GB min 400 GB rec</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">1 TB/day</td><td>63 vCPUs</td><td>7× c7i.4xlarge</td><td>~252 GB</td><td>80 GB min 800 GB rec</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">2 TB/day</td><td>126 vCPUs</td><td>11× c7i.4xlarge</td><td>~504 GB</td><td>160 GB min ~1.6 TB rec</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">5 TB/day</td><td>314 vCPUs</td><td>24× c7i.4xlarge</td><td>~1.3 TB</td><td>395 GB min ~4.0 TB rec</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr><tr><td valign="top">10 TB/day</td><td>628 vCPUs</td><td>46× c7i.4xlarge</td><td>~2.5 TB</td><td>785 GB min ~7.8 TB rec</td><td>10 vCPU + 28 GB RAM + 150 GB disk</td></tr></tbody></table>

**Benchmark 2 Notes:**&#x20;

* \*Ingest vCPUs include 2× peak spike buffer + ×1.2 HA redundancy (Tier 2 Standard baseline).  † 4 GB/vCPU RAM for Lake indexing write buffer and enrichment overhead.
* ‡ Disk per ingest pod: 5 GB minimum, 50 GB recommended starting point. Calculated at 1 pod per 4 ingest vCPUs. Provision SSD-backed storage.  § Core components (UI + data processing) are static and must be added to ingest tier totals: +10 vCPU, +28 GB RAM, +150 GB disk. Provision as dedicated node or reserved cluster capacity.

## 7. Memory (RAM) and Disk Sizing Guidelines

Apica Flow deployments consist of two distinct resource pools: the variable ingest tier (which scales with throughput) and the static core component tier (UI and data processing services). Both must be provisioned independently. RAM and disk guidelines below apply to both Benchmark 1 and Benchmark 2 unless otherwise noted.

### 7.1 RAM Sizing Guidelines

<table data-header-hidden><thead><tr><th width="174.0859375"></th><th width="191.87890625"></th><th></th></tr></thead><tbody><tr><td><strong>Component</strong></td><td><strong>RAM allocation</strong></td><td><strong>Notes</strong></td></tr><tr><td>Core components (UI + data processing) — static overhead</td><td>28 GB RAM (fixed, all volumes)</td><td>Fixed allocation for Apica Flow UI services and data processing components. This is independent of ingest volume and identical across both Benchmark 1 and Benchmark 2. Provision as a dedicated node or reserved capacity. Not scaled with additional ingest vCPUs.</td></tr><tr><td>Base heap per ingest vCPU (worker process)</td><td>2 GB per vCPU (minimum)</td><td>Benchmark 1 (Flow only). Starting point for Tier 1 and Tier 2 ingest workloads. Sufficient for standard filtering, routing, and PII redaction pipelines.</td></tr><tr><td>Ingest heap per vCPU (Benchmark 2 — Flow + Lake)</td><td>4 GB per vCPU</td><td>Benchmark 2 (Flow + Lake). Higher RAM per vCPU accounts for InstaStore™ write buffer, Lake indexing overhead, and enrichment pipeline memory requirements.</td></tr><tr><td>Lookup table enrichment (large tables > 100K rows)</td><td>+1 GB per vCPU per large lookup table</td><td>GeoIP, CMDB lookups, user/asset databases. Large lookup tables are loaded entirely into heap per worker process.</td></tr><tr><td>Stateful aggregations (cross-event state)</td><td>+2–4 GB per vCPU</td><td>Deduplication windows, rolling counters, time-windowed metrics. Higher event cardinality requires proportionally more RAM.</td></tr><tr><td>InstaStore™ object storage buffer (Benchmark 2 only)</td><td>External memory — governed by OS</td><td>In-memory buffers for object storage writes are allocated outside the configurable heap limit. This is automatically managed by the Apica Flow process and the underlying OS.</td></tr><tr><td>AI / LLM telemetry workloads (Tier 5)</td><td>8–12 GB per vCPU</td><td>High-cardinality metadata (model IDs, tenant IDs, session contexts), prompt/response body buffering, and real-time cost correlation tables.</td></tr><tr><td>Recommended minimum node RAM (any tier)</td><td>16 GB per node (32–64 GB recommended)</td><td>Below 16 GB, OS overhead and heap fragmentation reduce effective throughput. Production nodes should have a minimum of 32 GB RAM.</td></tr></tbody></table>

### 7.2 Disk Sizing Guidelines

<table data-header-hidden><thead><tr><th width="165.28515625"></th><th width="186.51953125"></th><th></th></tr></thead><tbody><tr><td><strong>Component</strong></td><td><strong>Disk allocation</strong></td><td><strong>Notes</strong></td></tr><tr><td>Core components (UI + data processing) — static overhead</td><td>150 GB disk (fixed, all volumes)</td><td>Fixed disk allocation for Apica Flow UI services, configuration storage, and data processing components. Applies to both Benchmark 1 and Benchmark 2. This does not scale with ingest volume.</td></tr><tr><td>Ingest pod disk (Benchmark 2 only — Flow + Lake)</td><td>5 GB min per pod 50 GB recommended per pod</td><td>Disk per ingest pod for the persistence queue and write buffer used during InstaStore™ indexing. Minimum: 5 GB per ingest pod. Recommended starting point: 50 GB per ingest pod. Provision SSD-backed storage. Disk scales with the number of ingest pods (1 pod per ∼4 ingest vCPUs). Not applicable to Benchmark 1 (Flow only) deployments.</td></tr><tr><td>Persistent queue buffer (both benchmarks — disaster recovery)</td><td>50–100 GB SSD per node</td><td>Apica Flow’s persistence queue for forwarder buffers during destination outages. SSD-backed storage required for low-latency queue drain on destination recovery. This is in addition to the ingest pod disk allocation for Benchmark 2.</td></tr><tr><td>InstaStore™ object storage (Benchmark 2 only)</td><td>External object storage (S3-compatible)</td><td>Long-term telemetry retention in Apica Lake is written to external object storage (S3-compatible). Provision object storage capacity separately based on daily ingest volume, retention period, and compression ratio. This is not local disk on the Apica Flow nodes.</td></tr></tbody></table>

## 8. Sizing Formula Summary

Use the following formula for all Apica Flow environment sizing calculations. Apply it independently for Benchmark 1 (Flow only) and Benchmark 2 (Flow + Lake) using the appropriate tier baseline from Section 3. The formula produces the ingest tier vCPU requirement. Always add the static core component overhead separately.

<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top"><p>Ingest tier vCPUs =</p><p>( Daily_GB_IN ÷ Tier_Baseline_GB_per_vCPU )</p><p>× Destination_Adjustment_Factor</p><p>× Peak_Spike_Multiplier (default: 2.0×)</p><p>× HA_Redundancy_Factor (default: 1.2×)</p><p>Total deployment = Ingest tier vCPUs  +  10 vCPU (core components, static)</p></td></tr></tbody></table>

### 8.1 Formula Variables

<table data-header-hidden><thead><tr><th width="268.125"></th><th></th></tr></thead><tbody><tr><td><strong>Variable</strong></td><td><strong>Values</strong></td></tr><tr><td>Tier_Baseline_GB_per_vCPU</td><td>Benchmark 1 (Flow only): 170 (Tier 1), 140 (Tier 2—recommended), 100 (Tier 3), 70 (Tier 4), 50 (Tier 5) Benchmark 2 (Flow + Lake): 45 (Tier 1), 38 (Tier 2—recommended), 28 (Tier 3), 20 (Tier 4), 14 (Tier 5)</td></tr><tr><td>Destination_Adjustment_Factor</td><td>1.00 (1 destination)  |  0.85 (2 destinations)  |  0.70 (3 destinations)  |  0.55 (4+ destinations)</td></tr><tr><td>Peak_Spike_Multiplier</td><td>2.0× (standard)  |  3.0× for bursty sources (e.g. Monday morning Windows Event log spikes or periodic batch pulls)</td></tr><tr><td>HA_Redundancy_Factor</td><td>1.2× (standard: 1 node offline)  |  1.5× (high availability: 2 nodes offline simultaneously)</td></tr><tr><td>Static core components (additive, not multiplied)</td><td>Add +10 vCPU, +28 GB RAM, +150 GB disk to the ingest tier total for all deployments (both Benchmark 1 and Benchmark 2). Provision as a dedicated node or reserved cluster capacity. These values do not scale with ingest volume.</td></tr><tr><td>Disk — ingest pods (Benchmark 2 only)</td><td>Ingest pods = ceil(Ingest_vCPUs ÷ 4). Disk per pod: 5 GB minimum, 50 GB recommended. Total disk (recommended) = Ingest_pods × 50 GB. SSD-backed storage required. Not applicable to Benchmark 1.</td></tr></tbody></table>

## 9. Additional Sizing Guidance

### 9.1 Static Core Components

Every Apica Flow deployment — regardless of ingest volume or benchmark — requires the following fixed resource allocation for the UI and data processing tier. These are not ingest workers; they are the platform services that support pipeline management, observability, and control-plane operations.

•       vCPU: 10 vCPUs (fixed, all deployment sizes)

•       RAM: 28 GB (fixed, all deployment sizes)

•       Disk: 150 GB (fixed, all deployment sizes)

Provision these on a dedicated node or as reserved capacity within the Kubernetes cluster. They should not compete with ingest pod scheduling.

### 9.2 Minimum and Maximum Node Sizes

* Recommended minimum node size: 8 vCPUs. Below this threshold, OS overhead claims an excessive percentage of available capacity.
* Recommended maximum node size: 48 vCPUs. Above this threshold, persistent queue disk I/O becomes a constraint on Apica Flow’s forwarder buffer performance.
* Recommended minimum node RAM: 16 GB. Production nodes should have a minimum of 32–64 GB RAM.

### 9.3 Kubernetes Autoscaling

Apica Flow runs natively on Kubernetes and supports Horizontal Pod Autoscaler (HPA) configuration. HPA provides elasticity for sustained traffic increases, but initial node pool provisioning should not rely solely on autoscaling. Size the base node pool to handle target throughput at the 2× peak level before HPA scale-out triggers.

### 9.4 Persistent Queue and Ingest Pod Disk Sizing

* Persistent queue (both benchmarks): Provision 50–100 GB SSD-backed storage per node for Apica Flow’s forwarder persistence queue. The persistent queue is the recovery buffer used during destination outages. SSD-backed storage is required for low-latency queue drain when destinations recover.
* Ingest pod disk (Benchmark 2 only): Provision a minimum of 5 GB per ingest pod, with 50 GB per pod as the recommended starting point. Calculated at approximately 1 pod per 4 ingest vCPUs. Provision SSD-backed storage. Scale with the number of ingest pods, not the number of nodes.
* Core component disk (both benchmarks): 150 GB fixed. Not scaled with ingest volume.
* InstaStore™ object storage (Benchmark 2 only): Provision external S3-compatible object storage based on daily ingest volume × retention days × compression factor. This is not local disk on the Apica Flow nodes.

### 9.5 Scaling Beyond 10 TB/day

For any deployment exceeding 10 TB/day — whether using Benchmark 1 (Flow only) or Benchmark 2 (Flow + Lake) — Apica recommends a formal architecture review with Apica engineering to account for:

* Cluster topology and network bandwidth between worker nodes
* InstaStore™ object storage throughput and I/O parallelism requirements
* Regional distribution, multi-cluster federation, and disaster recovery architecture
* Downstream observability tool ingestion rate limits and back-pressure handling

**Contact Apica at support@apica.io or via your account team for architecture review support.**
