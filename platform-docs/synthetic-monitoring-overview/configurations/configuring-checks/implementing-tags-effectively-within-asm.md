# Implementing Tags Effectively Within ASM

Tags are labels which can be created and assigned to specific checks. They allow users to associate Checks with geographical areas, organizations, systems, applications, customers, and more. Adding tags in the Manage Tags view will make them available for use in all checks.



Tags are mainly used for filtering checks. Advanced tagging can be used for root-cause analysis, service mapping/modeling, and Service Level Assurance management. The following table provides good examples of tag names:

| **Business Service**    | **Application** | **Model Layer**   | **Service-Impact** | **Technology** |
| ----------------------- | --------------- | ----------------- | ------------------ | -------------- |
| ERP                     | SAP Payroll     | Business-Layer    | 8 - Critical       | SAP            |
| E-Commerce              | TicketMonster   | Application-Layer | 4 - Major          | Oracle         |
| Application Development | JIRA            | Software-Layer    | 2 - Minor          | Java           |
|                         |                 | Infra-Layer       | 0 - None           | .NET           |

## Use Cases <a href="#implementingtagseffectivelywithinasm-usecases" id="implementingtagseffectivelywithinasm-usecases"></a>

Some primary use cases for Tags include:

* Implementing advanced and dynamic views in the user interface which are tailored to different user roles
* SLA Management on a "Service" layer
* Virtual Service Checks - Aggregated checks based on a tag filter
* Incident Management on an aggregated level of checks

| **Tag**                    | **Examples** | **Comment**                                                                                                                                                                              |
| -------------------------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Application                |              | Application tags are used for many checks. This customer has defined several hundred applications with the API in an automated way. These tags are used to map checks to monitor groups. |
| <p>Business<br>Service</p> |              | Business services per business unit and region. These tags are also used to map checks to monitor groups.                                                                                |
| <p>Business<br>Unit</p>    |              |                                                                                                                                                                                          |
| Geography                  |              |                                                                                                                                                                                          |

For example, the following check has Business Unit, Application, and Type tags assigned to it:



## Viewing Assigned Tags Per Check <a href="#implementingtagseffectivelywithinasm-viewingassignedtagspercheck" id="implementingtagseffectivelywithinasm-viewingassignedtagspercheck"></a>

On the main Dashboard, tags are indicated by the **Tag** icon next to the check name. Click or hover over the icon to see which tags are configured for the check:



On the Check Details and Check Results pages, tags are shown below the check name:

