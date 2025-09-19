# API Monitoring Guide

* Overview
* ABCs of API Monitoring
* Conventional API Monitoring Falls Short
* Gain 360-Degree Visibility with Apica Service-Level Assurance
* API Monitoring Checklist
* Infrastructure
  * Front-End
  * Middle-Tier and Database
* Full User Journey Test
* Presenting API Testing Data
* Protect Your Business with Holistic API Visibility

**Capture a 360-Degree View of API Health and Performance with Apica**

## Overview <a href="#apimonitoringguide-overview" id="apimonitoringguide-overview"></a>

In our tightly interconnected digital world, no company is an island—and no application is either. Critical business processes often function more like ecosystems than discrete pieces of software, drawing on a complex web of interdependencies across internal and third-party systems, making up the strands of that web: application programming interfaces or APIs.

APIs make modern digital services run, allowing companies to automate the process of querying data sets from disparate sources and transforming the results into practical information or action. Whether programmatically pulling data into your workflows, exposing your data to others, or both, APIs are thoroughly baked into modern applications. So much so that when problems with APIs crop up, they can have devastating consequences—disrupting user experiences, supply chains, even the basic functioning of the business itself.

For these reasons, APIs have become an essential component of digital monitoring. But there’s a problem: most approaches show you only part of the picture. They might check the network’s health an API uses or its performance accessing frequently used objects for common cases. They can’t show you how your APIs affect actual users and transactions—until now.

Apica offers a way to monitor APIs precisely as experienced by real-world applications and workflows. We combine synthetic monitoring—generating synthetic transactions to simulate real users—with load-testing and scripting to provide a 360-degree view of API performance. We can simulate even the most complex user journeys by capturing your API calls and performing a series of if/then operations based on what those queries return. And if there’s a problem, we can help you zero in on exactly what’s happening in minutes.

Keep reading to learn why holistic API visibility is crucial for modern businesses and what you should monitor to get the full picture.

## ABCs of API Monitoring <a href="#apimonitoringguide-abcsofapimonitoring" id="apimonitoringguide-abcsofapimonitoring"></a>

APIs form the critical connections needed to send and retrieve data between servers, developers, integrators, and the applications your users depend on. If an API becomes unavailable or slow to respond, your business can quickly land in serious trouble. User experiences suffer, leading to abandoned transactions and lost customers. Business-to-business transactions can’t execute, causing missed deadlines and damaged relationships. Inventories drift, supply chains get disrupted, and worse.\
You can think of APIs' query/response structure as similar to a website—a valuable approximation for monitoring them. Some APIs use XML, some use other schemas like REST and GraphQL, but they share the same constraints as web environments.

So, your monitoring should answer the same kinds of questions:

* How many queries per second can my APIs accommodate?
* How many logins can they handle?
* Can I verify that my APIs are communicating securely—that Secure Sockets Layer (SSL) and Transport Layer Security (TLS) certificates are working?
* Are my API domains resolving in Domain Name System (DNS) as they should?
* Is my Global Server Load-Balancing (GSLB) distribution to back-end endpoints working as expected?
* What percentage uptime am I achieving for a given day/week/month?
* How are my APIs performing in my most important markets?
* Am I meeting my service-level agreements (SLAs) with customers and partners?

As with web monitoring, the best way to get answers is to deploy agents at locations where customers rely on your APIs—ideally, agents capable of generating synthetic transactions. The wider you cast your net, the more scenarios you simulate, the more visibility you’ll have.

## Conventional API Monitoring Falls Short <a href="#apimonitoringguide-conventionalapimonitoringfallsshort" id="apimonitoringguide-conventionalapimonitoringfallsshort"></a>

It sounds straightforward enough, so shouldn’t any API monitoring toolset do? Unfortunately, no. Typical approaches test specific API attributes or commonly used queries, but they don’t show how API traffic is being delivered to users. This means you usually have no idea about:

* **Long-pull objects that are not cached:** Many APIs front-ends cache query responses. That’s a good thing—whenever your API has a common query that returns an oft-requested object, it will get a swift response. But what about less-common queries that need to return long-pull objects buried in back-end systems that rarely get hit—but are still extremely important for specific customers, use cases, and SLAs? If you’re not verifying that your API can access what it needs for those rare but important cases, can you say your system is highly available?
* **How your APIs handle dynamic data:** Testing only the most commonly accessed objects can help you understand those specific queries. But it can’t show you API performance accessing dynamic data and acting on it—for example, pulling an inventory list to find a specific product at a specific location and complete a purchase. To measure that performance, you have to mirror the entire user journey—and most API monitoring tools can’t.
* **Interactions among APIs:** APIs commonly interact with other APIs in certain parts of an application set. To understand the real user experience, you need to monitor all APIs and capture the aggregate data set. If you can’t access all those elements and get a unified view, you can’t verify the health of your system.
* **How APIs perform under load:** If monitoring APIs gets complicated, stress-testing—hitting your API from multiple locations, with multiple query types, across multiple iterations—gets even trickier. APIs can suffer unique problems under load, such as quickly burning through infrastructure resources during socket buildup and teardown. If your monitoring doesn’t load-test with synthetic traffic to identify those kinds of issues, you won’t find them until users do.

When you can’t thoroughly test API behaviors like these, you can’t capture a meaningful baseline—and you’ll never have an accurate picture of real-world performance. Worse, you’re leaving your business with serious blind spots. That’s a big problem because API issues quickly cascade. A 20% lag in API response can translate to much longer delays in the interconnected systems depending on it.

Compounding the problem, most APIs are automated. Indeed, many optimization efforts depend on automated APIs to save time and resources (such as automatically moving data to less expensive cloud storage tiers when it meets specific criteria). If your API isn’t working as it should, those automations quickly fall apart. In the worst cases, automated APIs replicate problems thousands of times before they’re discovered. In cloud environments with consumption-based pricing, those issues can quickly get very expensive.

## Gain 360-Degree Visibility with Apica Service-Level Assurance <a href="#apimonitoringguide-gain360-degreevisibilitywithapicaservice-levelassurance" id="apimonitoringguide-gain360-degreevisibilitywithapicaservice-levelassurance"></a>

At Apica, we know it’s not enough only to measure how APIs perform against internal systems or caches. You need to know how real-world workflows experience API queries. The only way to find out is to simulate the entire user journey. Enter the Apica Service-Level Assurance platform.

Where most approaches test only from the API interface, Apica tests from the perspective of everything interacting with your APIs; by capturing and scripting your business logic, we can simulate every user journey that matters to your business, with the full range of query/response scenarios your API needs to support. We show you how it’s performing from an internal perspective and the client-side from the outside coming in, including under load, to give you a holistic picture of real-world performance.

## API Monitoring Checklist <a href="#apimonitoringguide-apimonitoringchecklist" id="apimonitoringguide-apimonitoringchecklist"></a>

To capture the complete picture of API performance, you’ll want to test each element individually, as well as end-to-end workflows in aggregate. By checking the health of long, complex query processes across the full transactional flow, you can see how real users and applications experience your APIs. And by pulling metrics from all the disparate components involved, you can quickly zero in on the source of problems when something goes wrong. To understand API performance thoroughly, make sure you cover the following core areas.

## Infrastructure <a href="#apimonitoringguide-infrastructure" id="apimonitoringguide-infrastructure"></a>

Ops teams already capture granular details about the performance of infrastructure elements. Apica correlates those metrics with synthetic monitoring and load testing, so you can query both external sources and infrastructure elements themselves to measure API health from every angle. By synthetically replicating API calls and measuring how they affect infrastructure, you can capture an accurate baseline of how different user journeys translate to actual costs per transaction.

* **Verify infrastructure health:** Check the health of every element in the data path, including servers, databases, firewalls, and load-balancers. Capture typical infrastructure metrics (CPU, memory, disk, network) to baseline performance and ensure you have the necessary capacity.
* **Verify the health of cloud and software-as-a-service (SaaS) elements:** Track metrics like input/ output operations per second (IOPS), transactions per second (TPS), and SaaS licenses.
* **Perform network route path tests for transitory networks:** Make sure you’re capturing metrics from the many transitory network elements that affect API performance that you don’t own. That can include transport provider infrastructure (routers, firewalls, load-balancers), caches, content delivery systems (CDNs), and edge distribution devices. Test things like link Internet Control Message Protocol (ICMP), traceroutes, and lookups of Border Gateway Protocol (BGP) statistics on the edge. If you don’t understand how all those pieces interrelate, you can’t get an accurate picture of your API infrastructure health.

### Front-End <a href="#apimonitoringguide-front-end" id="apimonitoringguide-front-end"></a>

To effectively monitor the health of your API front-end, include the following checks:

* **Validate DNS health:** DNS is the first step in any user journey. If it can’t resolve a hostname, the workflow and everything depending on it break down. Yet most API monitoring checks still don’t include DNS. Make sure to continually verify that DNS is returning the correct responses and hasn’t been hijacked. Monitoring should include DNS Security (DNSSec) and GSLB functions and the entire tree of DNS entries that may need to be publicly accessible.
* **Validate that SSL/TLS certificate and host information is correct/valid:** To protect your business, make sure your API or the API you’re connecting to isn’t being spoofed.
* **Validate API front-end accessibility with login-checks:** They sound simple, but login checks—especially involving multi-factor authentication (MFA) or credentials accessed via a shared secret directory—are extremely difficult for conventional monitoring tools. Additionally, make sure those credentials pass through if your front-end includes MFA checks that don’t go through the API. You can’t validate that with a simple front-end check; you need to examine the application set to verify that this handoff occurs.
* **Perform basic object queries for highly accessed objects:** Thoroughly monitor the performance of the front-end itself, which typically handles cached objects. Check for response time metrics such as time to last byte, which can baseline API health.

### Middle-Tier and Database <a href="#apimonitoringguide-middle-tieranddatabase" id="apimonitoringguide-middle-tieranddatabase"></a>

Most businesses still don’t do advanced testing of middle-tier and database components or synthetically test performance accessing different levels of archival information in storage. This means they don’t know whether any API-dependent data service meets its SLA. This becomes a bigger problem as businesses use APIs for storage optimization—such as automatically moving colder data to Glacier cloud storage to reduce costs. If users can’t restore data sets within SLA parameters, your optimization project can end up costing more than if you’d never bothered at all. When using API-driven automation for optimization efforts like these, you must continually validate their functionality to ensure they’re not breaking things.

* **Craft API logic to access multiple back-end systems:** Check for interactions between different API elements such as multiple databases or multiple API data feeds.
* **Craft API logic to test data resiliency of tiered storage systems:** Make sure you know how long it takes to access archived data versus cached data.
* **Craft queries to test third-party data sources:** Make sure you’re simulating queries to every external dataset your system relies on.

## Full User Journey Test <a href="#apimonitoringguide-fulluserjourneytest" id="apimonitoringguide-fulluserjourneytest"></a>

Understanding the end-to-end user journey is as essential as monitoring the component pieces of your API workflow—and often far more complex. Application teams need to participate in developing these tests, as they have a much clearer understanding of what the user journey entails. By ensuring cross-team collaboration in developing user journey tests, Ops teams will quickly connect the dots when something goes wrong.

* **Test the whole transaction:** Simulate the end-to-end transaction with all APIs and other application elements, including dynamic information such as inventory data.
* **Undo the whole transaction:** Testing systems must first do no harm. You should be able to undo an end-to-end synthetic transaction as easily as generating it not to disrupt the business.
* **Test your most important user journeys:** Replicate the known user journeys of critical customers to verify that their use cases function correctly.

## Presenting API Testing Data <a href="#apimonitoringguide-presentingapitestingdata" id="apimonitoringguide-presentingapitestingdata"></a>

These API checks provide a wealth of useful information. But within any business, different teams need to track different key performance indicators (KPIs). Apica offers customizable reports and dashboards to help stakeholders correlate API health to higher-level business metrics and dependencies. We provide customizable UI and Grafana plugins to pull data collected through the platform into your business intelligence systems.

Apica also includes extensive labeling and tagging capabilities to create custom abstraction layers. Just as public cloud UIs allow functional teams to monitor different KPIs for the business’ public cloud infrastructure, Apica offers similar abstraction layers—but for your entire infrastructure. Tag internal, external, and hybrid resources to map out how they interrelate. And use abstraction layers to dimension data sets differently for different teams and use cases.

## Protect Your Business with Holistic API Visibility <a href="#apimonitoringguide-protectyourbusinesswithholisticapivisibility" id="apimonitoringguide-protectyourbusinesswithholisticapivisibility"></a>

As more critical business processes—and customers and SLAs—depend on APIs, it’s becoming more important to verify that they’re continually working as they should. By baselining and testing API performance with synthetic monitoring and load-testing, you can:

* **Increase visibility:** With Apica, you can observe transactions across every OSI model layer, both individually and as end-to-end workflows. By correlating infrastructure monitoring with synthetic monitoring and load-testing, you gain an accurate 360-degree view.
* **Improve mean time to resolution:** Some API issues—ICMP drops, packet drops—are relatively simple to troubleshoot. Others, however, like transitory problems with TCP windows, can be enormously difficult. By measuring the health of every component in the workflow, you can quickly triangulate the source of any issue. You can skip the finger-pointing stage of API issues and move immediately to fix them.
* **Avoid major outages:** By thoroughly baselining and stress-testing all components of API flows, you gain insight to plan for potential problems before they affect users. If you know, for instance, that certain types of stories generate traffic that’s likely to stress your infrastructure, you can automatically provision the capacity you need ahead of time so the system doesn’t fail.
* **Optimize infrastructure resources:** By continually stress-testing your infrastructure, you can identify where you’re over-or under-provisioned at all times and ensure your infrastructure provides the optimal level of service at the lowest cost.
* **Maximize automation:** Businesses can use automation to implement all sorts of time- and cost-saving optimizations—provided the APIs those efforts depend on actually work. By maintaining a holistic picture of API health, you can validate that those optimization efforts deliver the value they’re supposed to, instead of creating more problems than they solve.
* **Transform IT Operations from cost center to business enabler:** Often, even sophisticated digital companies, view monitoring as a business necessity but not something to get especially excited about. But when you can fully visualize APIs and the workflows they support and simulate any user journey, monitoring becomes enormously influential. Now, it’s easier to experiment with new ideas, automation, and API-driven business optimizations—and continually measure and fine-tune them. This translates to more innovative operations, reduced operating costs, and a more competitive business.

A web of APIs is at the core of many of today’s applications. Activley monitoring them for speed, load capacity, and reliability is critical to get a complete view of your users business journeys through your applications. Apica’s platform provides real-time performance monitoring of user flows, transactions and APIs so you can get to the root cause of issues long before your users do.
