# ServiceNow Integration

1\. Go to [https://wpm.apicasystem.com/](https://wpm.apicasystem.com/)

2\. Impersonate source account login under Tools→ Impersonate

![](https://apicasystems.atlassian.net/wiki/download/attachments/329089047/image2018-8-3_9-45-53.png?version=1\&modificationDate=1533303958632\&cacheVersion=1\&api=v2)

3\. Find the Auth\_Token for the API that will pull the checks from the account under Tools→ API

![](https://apicasystems.atlassian.net/wiki/download/attachments/329089047/image2018-8-3_9-49-9.png?version=1\&modificationDate=1533304152094\&cacheVersion=1\&api=v2)

4\. Under API Settings, Copy the value found in the auth\_ticket row and also note the base URL

![](https://apicasystems.atlassian.net/wiki/download/attachments/329089047/image2018-8-3_9-52-4.png?version=1\&modificationDate=1533304326706\&cacheVersion=1\&api=v2)

5\. Login to your ServiceNow Service Management Portal.

6\. Filter for Apica by typing 'Apica' in the Navigator field:



7\. Select Apica Integrator Application→ ASM Instances.

An ASM Instance is integrated instance of an ASM customer. Includes all checks and scenarios that the ASM user (API\_Auth Ticket) we have used for integration can access.

![](https://apicasystems.atlassian.net/wiki/download/attachments/329089047/image2018-8-1_17-14-12.png?version=1\&modificationDate=1533303304933\&cacheVersion=1\&api=v2)

8\. We are going to add a new Instance:



9\. Enter the Name, API Endpoint, and the Auth\_Ticket and Submit:



10\. You can "star"/favorite your favorite menus. The Instances can be sorted by name, status, API Endpoint or ASM Endpoint. Clicking into any one Instance will open up that group of checks:



11\. Clicking into one of them ASM Instance names, will bring up an ASM Instance form + a matching set of checks (scenarios in another tab–see tab circled in green) that are in that ASM set and that have been selected to be pulled into the ServiceNow portal. In the example below, you can see the name of one of the checks from our CL Demo ASM Instance and the ASM check that matched the ServiceNow tag.



12\. Note the small cog that select/modify the displayed columns:

![](https://apicasystems.atlassian.net/wiki/download/attachments/329089047/image2018-8-6_15-54-26.png?version=1\&modificationDate=1533585268995\&cacheVersion=1\&api=v2)

13\. **TAGGING:**  "Include Tag" field above shows how to select certain checks based on tags (which can be optionally added in ASM). In this example, only one of the checks was specifically tagged for this integration.

Note: The ASM Option add a Tag to a check is shown here in the ASM portal.

The check below was tagged with a ServiceNow tag and specific subcategory tags of 'Demo' and 'Integration':

![](https://apicasystems.atlassian.net/wiki/download/attachments/329089047/image2018-8-6_17-33-47.png?version=1\&modificationDate=1533591230822\&cacheVersion=1\&api=v2)![](https://apicasystems.atlassian.net/wiki/download/attachments/329089047/image2018-8-6_17-38-7.png?version=1\&modificationDate=1533591491377\&cacheVersion=1\&api=v2)
