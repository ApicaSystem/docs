# IT Monitoring Guide

* Overview
* Rethinking IT Monitoring
* Conventional IT Monitoring Falls Short
* The High Costs of Application Blind Spots
* Gain 360-Degree Visibility with Apica
* Application Monitoring Checklist
  * Infrastructure
  * Front-End
  * Middle-Tier
* Full User Journey Test for Internal Resources
* Full User Journey Tests Including Third-Party Applications
* Presenting Testing Data
* Protect Your Business with Holistic Visibility

**Protect Your Users and Your Business with 360-Degree Visibility**

## Overview <a href="#itmonitoringguide-overview" id="itmonitoringguide-overview"></a>

In a fiercely competitive marketplace, when every minute of downtime has a cost, you’d think organizations would do everything in their power to keep digital services online and performing well. And most try—at least for customer-facing applications. When it comes to the application services on which internal users depend, however, many businesses seem to take poor performance and outages in stride. That can be an expensive mistake.

It's not that organizations don’t monitor internal systems at all, but many continue to operate with major blind spots. They perform spot checks of specific services and software components and get basic alerts when a service or component goes down (if they’re not simply relying on helpdesk calls to function as “alerts”). What most still don’t do, however, is monitor the end-to-end performance of the actual user journeys and workflows. As a result, they can’t see when critical application workflows have degraded for their internal customers. They can’t capture a baseline of what healthy workflow performance looks like, or recognize when partners and vendors, integrated into their internal applications, aren’t living up to their service-level agreements (SLAs). And when they have a problem, they have no good way to isolate it—and can spend days, weeks, even months trying to diagnose the issue.

Now, there’s a way to proactively test and continuously monitor the real-world performance of end-to-end internal user journeys. Apica combines synthetic monitoring with load-testing to show exactly how applications are experienced by real users. By continually testing the entire user’s journey, you can capture the health of critical employee workflows—including the full range of application sets, authentication frameworks, and third-party services on which modern applications depend. And if there’s a problem, you can use that 360-degree visibility to zero in on the source in minutes.

## Rethinking IT Monitoring <a href="#itmonitoringguide-rethinkingitmonitoring" id="itmonitoringguide-rethinkingitmonitoring"></a>

Most businesses maintain a separation between external-facing digital services used by customers and partners, and the internal IT systems on which employees rely. You can understand why businesses prioritize performance of public-facing websites, portals, and APIs. After all, that’s the face a company shows to the world and, in many cases, its primary source of revenue. But there are two sides to the revenue equation. While businesses risk major losses if customer-facing applications go down, internal degradations carry high costs too. Even putting aside knock-on effects like frustrated users and reduced quality, employees represent most organizations’ biggest expense. When users can’t access critical internal applications, they typically just sit idle (lost productivity) until service is restored. Which means the business is losing money—and will keep losing it every minute those services are down.

Why then don’t more organizations monitor internal applications more closely? Because historically, it’s been very hard to do. The application sets involved in internal user journeys can be very different from public website interactions or business-to-business APIs, and far more complex. A typical employee interacts with many different internal applications and services, in specific combinations and sequences, to perform basic aspects of their job. To maintain visibility into the health of those journeys, application owners would want to monitor:

* Videoconference/teleconference call flows
* Internal applications that don't communicate using HTTP and therefore can’t be tested with HTTP-based scripting engines, like Selenium
* Software-as-a-Service (SaaS) applications like Salesforce, Microsoft365, and Zoom which, while hosted by third parties, can be degraded by problems in the internal environment
* Terminals, mainframes, thick clients, and other components that may be considered “legacy,” but that continue to play a significant role in many IT environments
* Complex user journeys where applications have browsers make API calls to query disparate data sets, and then act on the results

As powerful as monitoring tools may be for public-facing applications, most can’t address key components of internal user journeys. To understand the health of those diverse and challenging elements, you’ll need a different set of tools.

## Conventional IT Monitoring Falls Short <a href="#itmonitoringguide-conventionalitmonitoringfallsshort" id="itmonitoringguide-conventionalitmonitoringfallsshort"></a>

Why doesn’t traditional IT monitoring capture the full picture of internal user journeys? Typical approaches suffer from:

* Endpoint-centric view: In many organizations, IT observability is limited to monitoring endpoints. This approach captures only a partial view of the application ecosystem and often has little or no awareness of user journeys. More importantly, it can only recognize a problem after its already affecting users.
* Monitoring in isolation: Traditional monitoring focuses on specific components of the IT stack, not end-to-end journeys. For example, most companies now rely on videoconferencing for almost every meeting—and if those services are down, business grinds to a halt. Traditional approaches might monitor individual parts of a session—video performance, audio, messaging. But that’s like trying to guess the plot of a movie by looking at a handful of still images. To truly understand the user experience, you need to measure performance of these services in combination—opening the application, scheduling a call, placing a call, sharing a screen. If you can’t, you’re only seeing part of the picture.
* Lack of visibility into SaaS applications: Even partial monitoring of videoconferencing is more than many businesses do. Increasingly, those services—along with a growing number of other core business applications—are provided by third-party SaaS applications. Yet despite the central role SaaS now plays in basic business functions, many organizations don’t monitor those applications at all—effectively handing over the job to their SaaS providers. Microsoft or Salesforce might alert you if they’re having their own issues, but they can’t see if a problem in your environment is degrading performance—and if you’re not monitoring user journeys, neither can you. Additionally, if you’re not measuring third-party SaaS and cloud services, you have no way to know if your vendors are actually living up to their SLAs.
* Slow, ineffective root cause analysis: For IT operations teams, the biggest challenge with IT issues is often just figuring out what, exactly, is causing a problem. Polling individual pieces of the IT stack and trying to correlate them with observed anomalies is an enormously difficult, time-consuming process.

## The High Costs of Application Blind Spots <a href="#itmonitoringguide-thehighcostsofapplicationblindspots" id="itmonitoringguide-thehighcostsofapplicationblindspots"></a>

The only way to answer these questions is to monitor application journeys from the user’s point of view. With synthetic monitoring, you can deploy test agents throughout your environment that simulate interactions with the applications employees rely on. Emulating user behavior, in both ongoing monitoring and periodic proactive testing, is the only way to ensure that all parts of critical user journeys—every software component, application, and API—are performing within required guidelines. And businesses that don’t do that are taking a big risk.

* If you’re not testing full user journeys in your preproduction (blue) environment, you can’t reliably predict whether your production (green) environment will perform as required.
* If you have no way to grab user diagnostic data (tracert, tcpdump, browser dump, and more), you can’t quickly triangulate problems.
* If you’re not observing performance across end-to-end user journeys, you can’t see if your SaaS providers are violating SLAs.
* If you can’t insert full user-journeys into a test harness, you can’t ensure that your team isn’t reintroducing problems back into your applications/services.

These are significant blind spots today, but they’ll grow even more dangerous as your business relies more on SaaS, cloud, and Web 3.0 services. In the past, application developers could build and own almost the entire application stack. Increasingly though, external services—from Microsoft 365 to AWS to third-party OAuth services—play key roles in internal business operations. If you’re relying on traditional performance monitoring tools—likely delivered as SaaS applications themselves—you have no way to understand how users experience those critical services.

## Gain 360-Degree Visibility with Apica <a href="#itmonitoringguide-gain360-degreevisibilitywithapica" id="itmonitoringguide-gain360-degreevisibilitywithapica"></a>

As your environment gets more complex, and the number of internal and external stacks to monitor grows, it becomes nearly impossible to maintain meaningful visibility into the application journeys that matter most. Unless, that is, you’re following every step of those journeys from the user’s point of view. Enter the Apica Ascent platform.

Where most approaches instrument only for spot checks of individual components at specific points in a user journey, Apica tests from the perspective of everything users interact with. By capturing and scripting your business logic, we can simulate the end-to-end journey of every employee transaction that matters to your business, with the full range of query/response scenarios your environment needs to support. We can show you how it’s performing from an internal perspective, as well as the client-side coming in, including under load, to give you a holistic picture of real-world performance.

These aren’t radically new approaches to digital monitoring. In fact, many of the world’s biggest digital businesses use them every day to protect their customer-facing websites and APIs. But with Apica, you can now apply better, state-of-the-art synthetic testing techniques to your most complex and important internal application journeys as well. As a result, you can:

* Proactively monitor: Apica isn’t limited to passively collecting real user data, or even actively spot-checking components. By combining synthetics with advanced scripting and load-testing, you can emulate full real-world business scenarios and measure every part of the journey—piece by piece and in aggregate.
* Test against baseline: With proactive testing, you’re no longer limited to checking if IT components are up or down. You can establish what healthy performance looks like for critical application journeys, identify when important services are beginning to degrade, and fix them before they disrupt users and business operations.
* Monitor full user journeys: When you’re measuring from a user journey perspective, it doesn’t matter if parts of that journey rely on external SaaS components or APIs, legacy terminals, thick clients, or anything else. You see real performance as experienced by users for every part of that journey.
* Accelerate troubleshooting: The most difficult, time-consuming job in most organizations is correlating the flood of alerts with specific anomalies experienced by users and applications. With Apica, not only can you see if a given application component is down or degrading, but you can also natively provide context for that component within the entire user journey. You can quickly triangulate the source of the issue and prioritize your response.

## Application Monitoring Checklist <a href="#itmonitoringguide-applicationmonitoringchecklist" id="itmonitoringguide-applicationmonitoringchecklist"></a>

To capture the full picture of application performance, you’ll want to test each element individually, as well as end-to-end workflows in aggregate. By checking the health of long, complex query processes across the full transactional flow, you can see how IT services and software components are experienced by real users and applications. And, by pulling metrics from all the disparate components involved, you can quickly zero in on the source of problems when something goes wrong. To thoroughly understand IT performance, make sure you’re covering the following core areas.

### Infrastructure <a href="#itmonitoringguide-infrastructure" id="itmonitoringguide-infrastructure"></a>

Ops teams already capture granular details about the performance of infrastructure elements. Apica correlates those metrics with synthetic monitoring and load testing, so you can query both external sources and infrastructure elements themselves to measure IT health from every angle. By synthetically replicating IT journeys and measuring how they affect infrastructure, you can capture an accurate baseline of how different journeys translate to actual costs per transaction.

* Verify infrastructure health: Check the health of every element in the data path, including servers, databases, firewalls, and load-balancers. Capture typical infrastructure metrics (CPU, memory, disk, network) to baseline performance and ensure you have the capacity you need.
* Verify health of cloud and software-as-a-service (SaaS) elements: Track metrics like input/ output operations per second (IOPS), transactions per second (TPS), and SaaS licenses.
* Perform network route path tests for transitory networks: Make sure you’re capturing metrics from the many transitory network elements that affect performance that you don’t own. That can include transport provider infrastructure (routers, firewalls, load-balancers), caches, content delivery systems (CDNs), and edge distribution devices. Test things like link Internet Control Message Protocol (ICMP), traceroutes, and lookups of Border Gateway Protocol (BGP) statistics on the edge. If you don’t understand how all those pieces interrelate, you can’t get an accurate picture of your IT infrastructure health.

### Front-End <a href="#itmonitoringguide-front-end" id="itmonitoringguide-front-end"></a>

To effectively monitor the health of your application front-end, include the following checks:

* Validate DNS health: DNS is the first step in any user journey. If it can’t resolve a hostname, the workflow and everything depending on it break down. Yet most application monitoring checks still don’t include DNS. Make sure to continually verify that DNS is returning the right responses and hasn’t been hijacked. Monitoring should include DNS Security (DNSSec) and GSLB functions, as well as the entire tree of DNS entries that may need to be publicly accessible.
* Validate that SSL/TLS certificate and host information is correct/valid: To protect your business, make sure your IT services or APIs, or the services/APIs you’re connecting to, aren’t being spoofed.
* Validate front-end accessibility with login-checks: They sound simple, but login checks—especially involving multi-factor authentication (MFA) or credentials accessed via a shared secret directory—are extremely difficult for conventional application monitoring tools.
* Perform basic object queries for highly accessed objects: Thoroughly monitor the performance of the front-end itself, which typically handles cached objects. Check for response time metrics such as time to last byte, which can be used to baseline health and performance.

### Middle-Tier <a href="#itmonitoringguide-middle-tier" id="itmonitoringguide-middle-tier"></a>

Most businesses still don’t do advanced testing of data services utilized by middle-tier application components, for example, tiered cloud storage, such as AWS’ S3 Glacier Flexible Retrieval and S3 Glacier Deep Archive. This means they don’t know whether data services are meeting their SLAs. These services use APIs for things like storage optimization—such as automatically moving colder data to Glacier Flexible Retrieval to reduce costs. If users can’t restore data sets within SLA parameters, your optimization project can end up costing more than if you’d never bothered at all. When using API-driven automation for optimization efforts like these, you need to continually validate their functionality to ensure they’re not breaking things.

* Craft API logic to access multiple back-end systems: Check for interactions between different API endpoints such as chained, multi-vendor API requests.
* Craft API logic to test data resiliency of tiered storage systems: Make sure you know how long it takes to access archived data versus cached data.
* Craft queries to test third-party data sources: Make sure you’re simulating queries to every external dataset your system relies on.

## Full User Journey Test for Internal Resources <a href="#itmonitoringguide-fulluserjourneytestforinternalresources" id="itmonitoringguide-fulluserjourneytestforinternalresources"></a>

Understanding end-to-end user journeys is as important as monitoring the component pieces of IT services—and often far more complex. Application teams are responsible for developing these tests, as they understand what the user journey entails. By ensuring cross-team collaboration in developing user journey tests, Ops teams will connect the dots more quickly when something goes wrong.

* Test the full transaction: Simulate the end-to-end transaction with all APIs and other application elements, including dynamic information such as inventory data
* Undo the full transaction: Testing systems must first do no harm. If the application supports the ability to undo an end-to-end synthetic transaction, your test should be able to undo its test transaction to not disrupt the business.
* Test your most important user journeys: Replicate the known user journeys of critical employees to verify that their use cases function properly.

## Full User Journey Tests Including Third-Party Applications <a href="#itmonitoringguide-fulluserjourneytestsincludingthird-partyapplications" id="itmonitoringguide-fulluserjourneytestsincludingthird-partyapplications"></a>

The number of software components that play a critical role in business operations, but that the business doesn’t own, continues to grow. Even if you can’t instrument inside the Salesforce or Microsoft 365 cloud, you still need to make sure those applications are online and performing well for users. To do this effectively, you need to accurately emulate full user journeys—including all internal services and all third-party integrations and dependencies associated with them.

Here again, it’s not enough to rely on spot checks of whether an application is up or down. You need to emulate what real users are doing with those applications—such as opening an Excel spreadsheet, clicking a name in Outlook and launching a Teams video call, and more.

\
Presenting Testing Data <a href="#itmonitoringguide-presentingtestingdata" id="itmonitoringguide-presentingtestingdata"></a>
----------------------------------------------------------------------------------------------------------------------------

All these component checks can provide a wealth of useful information. But within any business, different teams need to track different key performance indicators (KPIs). Apica offers customizable reports and dashboards to help stakeholders correlate IT system health to higher-level business metrics and dependencies. We provide a customizable UI, as well as Grafana plugins, to pull data collected through the platform into your business intelligence systems.

Apica also includes extensive labeling and tagging capabilities to create your own custom abstraction layers. Just as public cloud UIs allow functional teams to monitor different KPIs for the business’ public cloud infrastructure, Apica offers similar abstraction layers—but for your own entire infrastructure. Tag internal, external, and hybrid resources to map out how they interrelate. And use abstraction layers to dimension data sets differently for different teams and use cases.

## Protect Your Business with Holistic Visibility <a href="#itmonitoringguide-protectyourbusinesswithholisticvisibility" id="itmonitoringguide-protectyourbusinesswithholisticvisibility"></a>

As critical business processes have gotten extremely complex, it is now impossible for traditional monitoring of IT systems to identify user experience problems, so it is critical to continually verify that user journeys are working as they should with a solution focused on application user journeys. By baselining and testing application performance with synthetic monitoring and load-testing, you can:

* Increase visibility: With Apica, you can observe transactions across every component of the application, both individually and as end-to-end workflows. By correlating infrastructure monitoring with synthetic monitoring and load-testing, you gain a true 360-degree view.
* Improve mean time to resolution: Some issues—web page unavailability, login timeouts—are relatively simple to identify. Others, however, like transitory problems API requests, can be enormously difficult. By measuring the health of every component in the workflow, you can quickly triangulate the source of any issue. You can skip the finger-pointing stage of application issues and move immediately to fixing them.
* Avoid major outages: By thoroughly baselining and stress-testing all components of application workflows, you gain insight to plan for potential problems before they affect users. If you know, for instance, that certain types of stories generate traffic that’s likely to stress your infrastructure, you can automatically provision the capacity you need ahead of time, so the system doesn’t fail.
* Optimize infrastructure resources: By continually stress-testing your infrastructure, you can identify where you’re over- or under-provisioned at all times, and ensure your infrastructure provides the optimal level of service at the lowest cost.
* Transform IT operations from cost center to business enabler: Too often, even sophisticated digital companies view monitoring as just a business necessity. But when you can simulate any user journey, monitoring becomes extremely powerful.

Now, it’s easier to experiment with new ideas, automations, and IT-driven business optimizations—and continually measure and fine-tune them. All of which translates to smarter operations, reduced operating costs, and a more competitive business.
