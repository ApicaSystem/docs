# Getting Started with ALT

## Logging into Apica Loadtest (ALT): <a href="#title-text" id="title-text"></a>

* Login at [https://loadtest.apicasystem.com/](https://loadtest.apicasystem.com/)

<div align="left"><figure><img src="../../.gitbook/assets/image (592).png" alt="" width="563"><figcaption></figcaption></figure></div>

* The ALT Portal Menu
  * **Projects**: A **project** is a named organization of load testing efforts that a Project Manager would want to assemble: Files, Test Instances (Tags, Number of Users, Start Date), People involved (technically and administratively) and who will get the results, Start-Completed Dates, Status, Business Unit, Test Category, Target Group, Environment (e.g. Production, Test, Development, Internal/External, Host Provider, etc), Application, Infrastructure, and Apica-related information will be recorded here.
  * **Loadtest**
    * New Test: As the name implies, here’s where you’d create a **New Loadtest.** You’d (1) select a subscription, (2) choose which script to use (or create a new script), (3) select Default or a saved test configuration, (4) Adjust any LT options (e.g. Duration, Location(s), and any other desired selections of the choices, (5) decide when to run the test (including immediately).
    * Create & Run **Scenario**: Create (Name it, attach it to a Project, Tag it, add job Comments) A Performance Scenario contains everything that relates to a performance test
      * One or more performance Scripts.
      * Parameter files
      * Load parameters that control how the load is applied
      * Infrastructure monitor agent configuration
      * Application Performance Management integration configuration
      * Test instance name (The name of the test results from a scenario test and must be unique to each project.)
    *   **Jobs**: Find all your jobs here (Running, scheduled, and finished), with status for every job. Filter on projects, instances, or just do a search. Live results of Jobs can be reached by clicking on the link for a running job.

        ![](https://loadtest.apicasystem.com/Images/tooltips/jobs.png)

        &#x20;
  *   **Reports**: Create custom reports. Add the metric(s) you want to use in your report. If you want to compare that metric with other metrics, select several metrics, and add them to the same chart. To add several metrics to separate charts uncheck the checkbox labeled "Add to the Same Chart".

      ![](https://loadtest.apicasystem.com/Images/tooltips/reports.png)

      &#x20;

      * **New Report**: Use a template (which has a Project attached to it as well test instances pre-selected) or add a Chart/Table from a selection of Test Results, or add Subject and Body Text to the report.
      * **Predefined Report**: These are reports that have been created saved as templates that need to be filled in.
        * Create a Report from a Template, attach it to a Project, select the Test Instance, and Test Result to populate the template with.
      * **Customize Reports**:
        * Export a report with a new name, orientation, and format.
        * Name a Custom Design
        * Add/Remove a Logo
        * Add Header and Footer Text
      * **Setup**
        *   **Monitoring Agents**: By using Monitoring Agents that are installed on your servers and collect metrics while you are running the loadtest you gain more insight from your environment. The agents are active only when your loadtest is actively running.

            ![](https://loadtest.apicasystem.com/Images/tooltips/monitor_agents.png)

            &#x20;

            * Under this menu, you can
              * Add a new group of agents
              * Create a new Agent (and add it to a group). _NOTE: A new Authorization Ticket will be created for each monitoring agent._

### Integration Settings

* **AppDynamics Settings**: Add/Edit/Delete an AppD server for integration with Apica
  * URL
  * Account
  * User Name
  * Is Active?
  * Default App
* **New Relic Settings**: Add/Edit/Delete a New Relic Account for integration with Apica
  * Account
  * API Key
  * Is Active?
* **Dynatrace Settings**: Add/Edit/Delete a Dynatrace server for integration with Apica
  * URL
  * User Name
  * Is Active?
*   **Continuous Integration** With load testing in the Continuous Integration (CI) or Continuous Deployment (CD) process, you can be aware of your releases' performance earlier, before reaching production. And you can follow trends here by dividing every scenario's result into its own Test-Instance.



    * **Result per script**: Select the CI/CD metrics to display
      * Select the Project
      * Select the Loadtest Script
      * Select the Test Instance
    *   **Avg. Session Time** compares the Average Session time for selected CI/CD metrics

        Open image-20200708-193131.png![](blob:https://apica-kb.atlassian.net/de27213f-1ddd-473e-9305-ccba0029f20f#media-blob-url=true\&id=84d5effc-ed3a-4e99-ae46-8f35dd1d293b\&collection=contentId-2192670730\&contextId=2192670730\&width=1081\&height=856\&alt=)
*   **Scenario Manager**:

    ![](https://loadtest.apicasystem.com/Images/tooltips/manage_scenarios.png)

    * A place to organize all your scenarios.
    * Group your scenarios for easier location.
    * Filter and tag them to make it easier to find the scenario.
    * Transfer scenarios easily to and from the LTP using the [ZebraTester](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ALTDOCS\&title=ZebraTester%20and%20Zebra%20CLI\&linkCreation=true\&fromPageId=5673248) tool.
    *   Scenario Manager Actions available:


* **Admin**
  * **Abuse Filter Rules**: Set/enable pattern-matching rules (and exceptions to those rules) so you prevent load testing against unintended URL targets
  * **Select User**: Equivalent to the ASM Impersonate user. One way impersonation; you must log out and log back in to return if you have lesser rights.
  * **Customers and Users**: Search for and Manage Customers and Users
    * User Name
    * Full Name
    * Phone
    * Email
    * Region
    * Timezone
    * Available Actions
      * Edit Customer
      * Manage Subscriptions
      * Delete Customer
      * Sign in As User
      * Edit as User
      * Delete User
  * **Messages**: LTP system messages and announcements for users and customers with message active time period, with the importance (Critical, High, Low)
    * Available Admin Actions include Editing and deleting the Message
  * **Upload Result**: This is for uploading Prx Test Results (PRXRES data files) for inclusion in a project.
  * **Monitoring Agents**: Set up a new Linux agent in the database
  * **Property Configuration**: This panel allows you to set values for various categories within the Project. These Categories are listed in a drop-down box when accessing the project. The category values will change based on the selection beneath the dropdown. If the property values are not appropriate/listed, new, and multiple, values can be added to each category.
  * **Exec Agent Manager**: A place to manage all the agents you have access to.
    * Tab 1: **Executing Agents**. Search/filter for Executing Agents by
      * Filter: Executing Agent Name
      * Filter: Host IP or Hostname
      * Filter: Owning Customer Enabled?
      * Filter: Region
      * Filter: Show Disabled Agents
    * Delete an Agent
    * Add a New Agent.
    * Edit an existing Agent
      * Name (required)
      * Datacenter (required)
      * Host (IP or hostname) (required)
      * Max Users (required)
      * Visible to only one customer (select that customer)
    * Tab 2: **Regions** where you can filter for and edit agents by Region (as a country name, like ‘US’) or Country(Locale) (as a Language)
      *   Example: Region= US returns

          Whereas Locale = English (United States) returns
    * Tab 3: **Datacenters** where you can filter for and edit datacenters by Name, Geolocation, Coordinates, if Mobile, Locale (i.e. Language). Optionally you can Add a New Datacenter or edit an existing
      * Example: I want to edit the Amsterdam DC. _All Orange asterisks are mandatory fields._
* **API**: provides you access to your Load Testing Portal (LTP) API information
  * **Your Authorization Token**
    * Non-working Auth Token Example: 12A34B5C-DE67-1111-1G06-1014HIJK1L91
  * **Your API URL Endpoint**
    * [https://api-foo.domain.com/v1](https://api-foo.domain.com/v1)
  * [**Technical documentation**](https://api-ltp.apicasystem.com/v1/help) leads you to the documentation for the Loadtest Portal API.
  * **API Examples** with CURL requests to the LTP API are provided for you here as well
* The **Tutorials** menu connects to the Apica Knowledgebase Apica LoadTest Tutorials page.
* The **Scripting Tool** menu leads to the Apica Knowledgebase Apica Scripting Tools Documentation page.
