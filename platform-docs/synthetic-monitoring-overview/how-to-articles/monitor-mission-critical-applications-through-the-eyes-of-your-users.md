# Monitor Mission-Critical Applications through the Eyes of Your Users

* Executive Summary
* Are You Seeing the Full Picture for Your Mission-Critical Workflows?
* Conventional Monitoring Solutions Can’t Help
* What Would Real Visibility Look Like?
* Welcome to the Apica Ascent Platform
* How can you use Apica?
* A 360-Degree View
* Consistent Testing Across the Application Lifecycle
* Monitor Holistically, Visualize Individually
* The Apica Advantage

**Through the use of the Apica Ascend Platform**

## Executive Summary <a href="#monitormission-criticalapplicationsthroughtheeyesofyourusers-executivesummary" id="monitormission-criticalapplicationsthroughtheeyesofyourusers-executivesummary"></a>

When you’re supporting mission-critical business applications, visibility is like insurance: the less you have, the more you can expect it’ll cost you when something goes wrong. And yet, for modern IT organizations, getting that insurance—being able to track and assure the performance of end-to-end workflows for complex transactions and user journeys—has never been harder. In today’s dynamic digital landscape, pieces of those workflows may need to come from multiple cloud providers, navigate third-party security boundaries and multi-factor authentication (MFA), pull data from legacy systems, travel behind the firewall and back out again multiple times during a transaction. Just being able to monitor that mission-critical workflow, much less guarantee a baseline level of service, becomes enormously difficult.

If you’re relying on monitoring designed for an earlier, simpler time, you’re missing key pieces of that puzzle. And those blind spots can be costly. Every minute that your core business functions are disrupted, or that you’re scrambling to figure out which link in a complex chain is causing a problem, your business is at risk. Now you can check, validate, and continually assure service levels for every step in your mission-critical workflows—even for the most complex transactions and user journeys, at scale. It’s the Apica Ascent platform, and it’s transforming IT operations for organizations in every industry.

## Are You Seeing the Full Picture for Your Mission-Critical Workflows? <a href="#monitormission-criticalapplicationsthroughtheeyesofyourusers-areyouseeingthefullpictureforyourmissio" id="monitormission-criticalapplicationsthroughtheeyesofyourusers-areyouseeingthefullpictureforyourmissio"></a>

In our increasingly digital, interconnected world, businesses run on their mission-critical applications. Business grinds to a halt if customers or employees can’t get to the services they need, if core transactions can’t be processed, or if the user experience becomes sluggish or unreliable. Customers get frustrated. Deadlines get missed. Sales targets fall short. Stock prices can plunge. And in some cases, companies never recover.

With so much at stake, you’d expect organizations to invest significant resources into monitoring their mission-critical applications—and they do. Global Industry Analysts projects the global market for application performance management (APM) will reach US$12 billion by 2026. Yet despite these efforts, unforeseen issues and blind spots continue to cause major outages, even for the biggest names in their industries.

The problem is, even the most conscientious IT leaders are dealing with a basic disconnect: the way conventional monitoring tools understand a workflow or application experience can be very different from the real-world user experience. A huge number of factors contribute to how users experience an application or transaction journey, including:

* **Environmental variables:** Users may be working with different hardware and device types, different OS versions or different security solutions, with their personal user journey taking a unique path with unique network characteristics. If your monitoring doesn’t account for all those variables, it can’t give you a realistic picture of performance over time.
* **Diverse user skillsets and behaviors:** Accounting for variations in human behavior can be enormously challenging. Some people are just bad at entering data and make frequent errors. Others get distracted or step away at key points in a workflow, hanging up transactions. Some use dynamic login variables for multifactor authentication (MFA), or different OAuth tokens, in ways that can be extremely difficult for workflows to account for.
* **Geographic and security variables:** Navigating diverse physical (and logical) locations, often with different compliance requirements (HIPAA, GDPR, lawful intercept and data sovereignty), gets incredibly complicated. Dealing with security boundary issues, even more so. Geofencing, for instance, can slow the data path or incorrectly block or permit traffic due to bad access control lists (ACLs). Overloaded proxies can slow a route path. Third-party MFA/OAuth vendors can have issues, and domain name system (DNS) services can break or get hijacked. All these factors can slow or disrupt the user experience, but standard monitoring tools typically don’t address them.
* **Application variables:** In large enterprise applications, there’s a good chance at least some aspects of a mission-critical workflow will interface with legacy systems of record—applications that are not HTTP, and therefore beyond the reach of most monitoring and APM tools. You also need to contend with API dependencies on all sorts of internal and external services, as well as insertions (pixels, ads, tracking cookies, etc.) from a wide range of third-party providers.

For any given user, the application experience or transaction journey encompasses all these factors and more. If your monitoring doesn’t capture them—if you’re checking from the inside-out, focusing mostly on the health of your own systems—you’re never going to experience the workflow the way users do.

## Conventional Monitoring Solutions Can’t Help <a href="#monitormission-criticalapplicationsthroughtheeyesofyourusers-conventionalmonitoringsolutionscanthelp" id="monitormission-criticalapplicationsthroughtheeyesofyourusers-conventionalmonitoringsolutionscanthelp"></a>

Most existing monitoring and APM tools can’t solve these problems, even when they’re doing exactly what they’re supposed to do. The issue is that they only address the narrow scope of the problems they were designed to solve. They can’t give you a holistic picture of real-world user experience, which means they can’t meaningfully support service-level agreements (SLAs).

* Element management system (EMS) solutions just check failure points in your infrastructure. They’re not full-stack aware, and they can’t provide much insight into the health or performance of services—the best they can offer is an up/down notification when something goes offline.
* Network performance management (NPM) tools focus on layers 1-4. As such, they don’t address higher-order protocol variables at the application layers, and they can’t account for dependencies in different layers of the stack.
* Load testers can tell you part of the story, but they typically provide only spot checks. They also tend to have limited functionality—they can’t simulate many of the chaotic events that can happen out on the wire to impede traffic—and limited geographic distribution.

In their efforts to close these gaps, most enterprises now use APM, passive real user monitoring (RUM), and synthetic monitoring solutions. However, while these tools can be great at what they do, they have baked-in limitations that prevent them from providing a truly holistic view of many workflows. For example, most can’t account for:

* Non-HTTP(S) and on-premises elements: Most of these tools were built for web applications, using Selenium-based testing that focuses on browser-based services. They can’t address all the non-web elements of a workflow, such as legacy on-premises applications, mainframes that require thick-client access, or workflows that must traverse a firewall.
* MFA: Most solutions aren’t multifactor authentication-aware, so can’t check MFA functions. Since those functions are becoming increasingly essential for customer-facing workflows, as well as to connect distributed home-based employees in a post-COVID world, that’s a big problem.
* Variability: For most existing tools, checks must be hardcoded—preventing you from employing much real-time intelligence. Given the complex web of dynamic factors that can affect a transaction or user journey, you need to be able to stack logic into a check: “If you see this, try that. If this happens, do this.” But that’s typically not supported.
* Load times: APM and real user monitoring (RUM) tools typically have very limited visibility into full-page load times. With no good way to generate synthetic traffic and load over and over again, it becomes very difficult to peg baseline performance.
* End-to-end SLA status: With so many missing pieces in the picture of a mission-critical workflow, there’s no viable way to set meaningful service-level objectives (SLOs) for the end-to-end user experience or transaction, or test against them in a consistent way. Nor can you validate whether the different components of yours and your partners’ systems are following SLAs.

It’s not hard to understand why so many organizations struggle to assure their most critical applications and workflows—and why so many IT leaders find their hair turning prematurely gray. They’re just not measuring the user experience from the user’s point of view.

## What Would Real Visibility Look Like? <a href="#monitormission-criticalapplicationsthroughtheeyesofyourusers-whatwouldrealvisibilitylooklike" id="monitormission-criticalapplicationsthroughtheeyesofyourusers-whatwouldrealvisibilitylooklike"></a>

To understand what’s happening in these workflows and to assure they’re meeting their contractual SLAs, you need to be able to simulate the end-to-end user journey from the outside-in. You need to follow every hop, pass through every security boundary and authentication check, interface with every legacy system and device and third-party API exactly the way users do. And you need to be able to do that over and repeatedly, at scale. That’s the only way to truly calculate an SLA—and the only way to assure that your most critical applications are delivering what they should.

What does it take to get to that kind of visibility? At the highest level, you need:

* **Full active application monitoring:** You should be able to measure and test against all aspects of the application, not just a subset. That includes third-party data, non-HTTP functionality, MFA/OAuth integration, and more. You should be able to test anywhere and everywhere—from any location to any cloud or remote data center or on-premises system. And you should be able to conduct multiple checks, continually, so you can view application health as a real percentage of baseline, not just an aggregate.
* **Full application lifecycle testing:** If you’re not using the same consistent testing methodology everywhere, you won’t have consistent metrics. So, you should be able to test applications and workflows across the full software development lifecycle—ideally, using the same tests in monitoring as you use in QA and load testing. Those tests should integrate into your continuous application/continuous delivery (CI/CD) pipeline across development, blue/green deployment environments, QA, and support. And you need to be able to deploy tests quickly, scaling to simulate millions of users in minutes, on an ad-hoc basis. If you must test a new critical security patch for a live exploit, for example, you don’t have hours to wait for results.
* **Full ecosystem integration:** Your monitoring systems aren’t very useful if they live on an island. They should fully integrate with the broader ecosystem of tools and partners you use for visibility (Grafana, Splunk, Tableau, AWS QuickSights), support (ServiceNow, PagerDuty, and others), and APM/NPM capabilities. For example, to support faster remediation times, you should be able to run a test, detect a problem in one part of a workflow, and open a ServiceNow ticket—including pulling detailed log data to support that ticket—as part of a single, automated process.
* **Visibility based on real business metrics:** Your monitoring should map to real business value, not abstract metrics that need to be translated and interpreted. That is, you should be able to dimension your data and add business logic on top of it, so you can understand how the performance of workflows (or lack of it) affects the overall business, not just technical functions. You should be able, for example, to calculate service loss/gain based on real dollar value. You should also be able to visualize key performance indicators (KPIs) as a percentage of overall health. And you should be able to apply geographic- and department-level awareness to your real-time monitoring and reporting.

## Welcome to the Apica Ascent Platform <a href="#monitormission-criticalapplicationsthroughtheeyesofyourusers-welcometotheapicaascentplatform" id="monitormission-criticalapplicationsthroughtheeyesofyourusers-welcometotheapicaascentplatform"></a>

The Apica Ascent Platform delivers everything IT needs to monitor, test, validate, and assure mission-critical applications. Unlike conventional monitoring solutions, which focus on individual components of a transaction or user journey, usually from the inside-out, Apica gives you full visibility into even the most complex workflows from the user’s point of view. We do this by combining multiple capabilities that typically live within standalone tools into a single platform. Specifically, we bring together load testing, synthetic monitoring, and highly versatile scripting functions within a single monitoring solution.

With Apica, you can monitor and test your critical workflows across the entire application lifecycle—from development to pre-production to live environments to ongoing CI/CD integration—using the same set of tools. You can use flexible scripting to execute sophisticated business logic, navigating non-HTTP applications, security boundaries, authentication, and other hard-to-measure parts of a workflow in ways conventional monitoring tools can’t approach. And you can generate visualizations and reports that tie technical metrics directly to business value, tailored for a wide range of business and IT stakeholder perspectives. All of which means that, for the first time, you can provide real visibility into every part of your most important business workflows.

## How can you use Apica? <a href="#monitormission-criticalapplicationsthroughtheeyesofyourusers-howcanyouuseapica" id="monitormission-criticalapplicationsthroughtheeyesofyourusers-howcanyouuseapica"></a>

* **For any application or service with a network connection:** Simulate browsers, API calls, terminals, Windows keyboard or mouse clicks, mobile apps, and more.
* **Via cloud-based, on-premises, or hybrid implementations:** Run ongoing outside-in simulations from more than 180 software-as-a-service (SaaS) points of presence around the globe. And augment that external visibility by running Apica check nodes within any network, across any security boundary.
* **For application tuning:** Enable performance assessments, cost assessments, ROI assessments, and more, all based on objective, independently measured data.
* **For security boundary testing:** Protect your mission-critical resources by continually performing ongoing geofencing testing, application penetration testing, and more.
* **For true visibility:** Combine accurate “outside-in” measurements of transaction performance (using external synthetic monitoring) with “inside-out” transaction capacity measurements (based on internal checks) to capture a 360-degree view. And use that holistic view to provide real visibility, so you can feel confident meeting your SLAs.

With Apica, you can now answer the questions that matter most in assuring your mission-critical applications:

* How many real user transactions can my infrastructure support?
* What is normal user performance for my application?
* Are my third-party services affecting my user experience?
* Where are my infrastructure bottlenecks?

And when you detect poor performance or outages, you can perform compound checks across the end-to-end workflow to triangulate the problem in minutes.

## A 360-Degree View <a href="#monitormission-criticalapplicationsthroughtheeyesofyourusers-a360-degreeview" id="monitormission-criticalapplicationsthroughtheeyesofyourusers-a360-degreeview"></a>

Unlike conventional monitoring tools, Apica gives you visibility into any transaction or user journey from the outside-in. We traverse every hop and security boundary, navigate every authentication step and legacy application, experience every API dependency and page insertion exactly the way users do, because we mimic and measure every step in their journey via synthetic testing.

We do this via Apica’s internationally distributed load-testing and monitoring nodes. These nodes regularly, programmatically check every element in your application workflow—targeted websites, web applications, API services, authentication services, certificates, DNS services, and more—for performance and service-level compliance. Using the platform’s advanced scripting capabilities, they can perform the same functions for legacy systems of record, internal on-premises applications, and any other part of the workflow that users experience, but that other monitoring solutions can’t reach.

Working from the outside-in, Apica:

* Simulates the user journey
* Validates transaction success
* Execute advanced workflows (e.g., remove items from the shopping cart or cancel orders created by the synthetic monitoring)
* Reports response times

At the same time, Apica can also see from the inside-out, with the ability to perform infrastructure-as-code checks and pull local environmental data (CPU, memory, disk and network capacity, etc.). In this way, you can perform baseline testing of synthetic traffic coming in from many different Apica nodes, traversing many different paths, and provide an accurate picture of the health and performance of every component of your applications. And you can even continually compare that performance against competitors’ services as part of the process.

By combining inside-out with outside-in perspectives, Apica shows you the full picture of the performance of your critical workflows. And we simulate that journey millions of times, from multiple locations, to establish a baseline of your capacity—using validated, objective performance data. When problems do arise, you can zero in on their source much more quickly. And, by gathering analytics over time using the same tools consistently, you can better understand typical network performance and application lag times and create more realistic thresholds and levels.

## Consistent Testing Across the Application Lifecycle <a href="#monitormission-criticalapplicationsthroughtheeyesofyourusers-consistenttestingacrosstheapplicationli" id="monitormission-criticalapplicationsthroughtheeyesofyourusers-consistenttestingacrosstheapplicationli"></a>

In most cases, the code used to test and validate an application in development gets used in pre-production—and then rarely revisited again. Once an application is thoroughly tested and validated, QA teams hand it off to IT operations and wish them luck. These operations teams don’t have any in-depth knowledge of how the application works; they focus on the infrastructure and server environment.

Wouldn’t it make more sense if the people who built and tested that application played a role in its ongoing health? With Apica, that’s exactly what happens. Now, the same code used for pre-production load-testing moves directly to the monitoring harness, where it can perform ongoing application checks. Instead of watching custom scripts created for that application gather dust in a repository, you can re-run them every 10 minutes to verify the application’s ongoing health. And instead of tossing aside all the work that went into creating that code, you can continually reuse and benefit from that investment over the life of the application. Developers and QA teams can maintain and update the testing code as the application evolves. So, the ultimate responsibility for monitoring your mission-critical applications stays in the hands of the people who understand them best.

## Monitor Holistically, Visualize Individually <a href="#monitormission-criticalapplicationsthroughtheeyesofyourusers-monitorholistically-visualizeindividual" id="monitormission-criticalapplicationsthroughtheeyesofyourusers-monitorholistically-visualizeindividual"></a>

Traditional monitoring tools tend to be designed around the traditional boundaries of an IT organization. They focus on answering one functional area’s questions (infrastructure teams, app developers, QA teams, support, DevOps) as if they existed on an island, with little connectivity to or context from any other area. Apica captures the holistic view of your critical applications while maintaining perspective awareness. The platform can provide each functional area with the information they need, using a variety of dashboards, visualizations, and alert thresholds tailored to each perspective’s specific requirements—all using the same monitoring points. And it enables you to dimension data views based on location, service type, functionality, and more, using tags.

With a single platform, you can provide diverse stakeholders with:

* **Visibility:** Application owners can track the end-to-end health of applications and their individual service components, while, for example, infrastructure teams view applications through the lens of their effects on specific infrastructure components.
* **Alerting:** You can have the platform alert different owners based on thresholds and service team ownership, including using PagerDuty and ServiceNow integrations.
* **Mitigation:** Since Apica ties holistic monitoring to sophisticated scripting capabilities, you can configure it to take a wide range of actions autonomously, in response to events. That could include things like increasing or decreasing compute in shared environments, changing DNS for global server load balancing, expanding infrastructure components like load balancers and firewalls—all in a closed-loop fashion.
* **Reporting:** You can generate ongoing reports for a variety of stakeholders, tied to technical functions or business objectives, all based on the same consistent, validated data.

## The Apica Advantage <a href="#monitormission-criticalapplicationsthroughtheeyesofyourusers-theapicaadvantage" id="monitormission-criticalapplicationsthroughtheeyesofyourusers-theapicaadvantage"></a>

What happens when you finally have full, holistic visibility into your critical business applications?

* **You get much faster.** Now you can track the end-to-end application experience from your users’ point of view—including all the legacy applications, security boundaries, and authentication steps that conventional monitoring can’t address. Which means you can zero in on problems much more quickly and reduce mean time to repair (MTTR).
* **You enable self-healing.** Unlike monitoring tools with limited scripting capabilities, Apica can execute whatever code you choose. The platform can basically run anything—which means you can do anything. As part of any triggered mitigation, you can have your monitoring system alert key stakeholders, spin up new resources, send detailed tickets to ServiceNow, and much more.
* **You can provide true business visibility.** No longer do you need to rely on basic up/down SLAs, based on partial views of the workflow and metrics you can’t really trust. Now your monitoring follows the exact same path as your users. You can drill down into each component element of the workflow, from the user’s perspective, to collect objective metrics and fully understand what is required. And when someone asks if you are meeting your SLA, you can tell them with confidence—even when you’re using legacy applications, MFA, and other components that are incompatible with traditional monitoring.
* **You can use validated service level metrics.** Most modern application workflows depend on a variety of internal and third-party services all performing the way they should. And yet, too many organizations rely on reporting provided by the same third parties they’re depending on. When you use Apica, you’re acquiring business metrics from an independent source, based on objective, validated synthetic transactions. And you can use Apica metrics to hold every party accountable to their SLAs.
* **You can reuse your testing investment across the application lifecycle.** Instead of asking operations teams to come up with effective monitoring for an application they don’t understand, that task stays with the people best suited to perform it: the developers and QA testers. Your monitoring is now far more effective and attuned to the evolving requirements of your applications. and you realize significant economies of scale.
* **You empower your teams for DevOps.** Apica connects every stage in the lifecycle of your applications—using the same consistent tools and processes through development, QA, production, and ongoing maintenance via CI/CD. Which makes it the perfect platform to support faster, more collaborative DevOps ways of working.
* **You transform IT operations from cost center to business enabler.** Business leaders know that if their most important applications go down, business grinds to a halt. But too often, those on the outside have little context to understand how IT’s efforts prevent that from happening. Now, you can provide objective, granular data, on an ongoing basis, to show how you’re assuring the organization’s most important applications and safeguarding the profitability of the business.
