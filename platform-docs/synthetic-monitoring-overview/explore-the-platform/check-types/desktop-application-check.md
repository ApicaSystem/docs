# Desktop Application Check

The Desktop Application Check (otherwise known as a DAC check) is a Microsoft Windows Desktop Application monitoring solution that consists of these components:

1. A **Desktop Application Recorder**: A desktop application which records the actions and expectations of the targeted Windows desktop application and turns this into a scenario which can be uploaded into ASM as a DAC check.
2. A **Desktop Application Check (DAC)**, which schedules the scenario in ASM for regular monitoring and reports back the results to the ASM portal for analysis.
3. A **Desktop Application Agent**, which is the private agent that executes the scenario and records the observed metrics for the targeted application.

Detailed information for DAC is located in this [dedicated space](https://apica-kb.atlassian.net/wiki/spaces/DAM/overview#!spacehome).

Desktop Application Monitoring expands Apica Synthetic Monitoring beyond monitoring HTTP/HTTPS website applications and APIs. The DAC solution was specifically built for Windows desktop applications which cannot be monitored from the web. The product creates value by satisfying a rare use case - performance observability on legacy desktop applications. Using DAC, end users can capture whatever data they need. They can ignore metrics altogether and simply verify a user journey works as expected; track execution time of login steps, order processing, and more; even capture metrics data from the application to its API endpoints via WireShark.

WHAT PROBLEM ARE WE ADDRESSING?

_The Monitoring Gap_: Monitoring only networked applications and services with network protocol level (HTTP/s) or the browser level (e.g., Selenium) scripts overlooks applications that do not fit that model (I.e. those which were developed before the Browser-centric view, or use proprietary protocols or are just too complicated at the protocol level.

**Examples**

* Desktop-Centric Applications, with very advanced and sophisticated user interfaces and local processing, with lots of forms
  * SAP R3
  * Oracle Forms
  * AutoCAD
  * Legacy banking/financial applications
  * HR applications
  * Thick Clients
* “Thin” desktop clients
  * Terminal Emulators
  * Citrix

**DAC MONITORING USE CASES**

Based on Monitoring Desktop Application performance over time

* Ensure your User Desktop Apps Are Always Available
* Assure your SLAs for the desktop services and performance are up to user expectations and application design
* Refine the user experience
* Tune the application servers for optimum load and efficiency
* Correlate performance to infrastructure load

**HOW THIS WORKS**

* Record and script the user journey directly on the desktop
* Start the application, click on positions, buttons, images
* Enter text and complex key-commands
* Wait for the response and assert that it is the expected one
* See results presented in Interactive dashboards with
  * Waterfall graphs
  * Trend reports
  * Summaries providing reliable insights on performance and availability

***



**Download a PDF**

* [Desktop Application Check Datasheet](https://apica-kb.atlassian.net/wiki/download/attachments/2133688966/apica_dac_datasheet.pdf?version=1\&modificationDate=1677701105630\&cacheVersion=1\&api=v2)
* [Desktop Application Monitoring Recorder & Scripting User Manual](https://apica-kb.atlassian.net/wiki/download/attachments/2133688966/desktop_application_recorder_user_manual_19-05-08.pdf?version=1\&modificationDate=1677701105842\&cacheVersion=1\&api=v2)

***

#### More information <a href="#desktopapplicationcheck-moreinformation" id="desktopapplicationcheck-moreinformation"></a>

* Please read the Apica Blog: [Desktop Application Monitoring – Are You Doing it Right?](https://www.apicasystems.com/blog/desktop-application-monitoring-right/)
* Interested in getting Desktop Application Monitoring started for your company? Please [contact Apica](https://www.apicasystems.com/contact-us/).

#### Apica Desktop Application Check & Recorder Demo <a href="#desktopapplicationcheck-apicadesktopapplicationcheck-and-recorderdemo" id="desktopapplicationcheck-apicadesktopapplicationcheck-and-recorderdemo"></a>

Click **play** to start the video, and **fullscreen** to view in fullscreen mode.

The above demonstrates a simple DAC use case in a graphical, easy-to-follow format.

Script MS Windows interactions with Apica's new Desktop Application Recorder, consisting of a Recorder, an Apica Synthetic Monitoring Check, and a Private Agent to run the application.

The demonstration covers:

* Selecting and starting a Windows Application
* Positioning the Windows Application for consistent execution
* Test execution of the recorded scenario
* Editing commands
* Asserting a graphical element/image
* Asserting a textual element
* Test Running from the Recorder Application
* Saving the scenario
* Executing the scenario in the Desktop Application Agent
* Examining the results
* Editing the script after Agent execution to re-select a better assertion image
