# Editing Browser Checks

The following sections only pertain to Browser Checks - you will not be able to specify Returned Value for ZebraTester checks, for example. For components which are editable for every check type, see [https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2148991311/Editing+Checks#Edit-Check-Components-Common-to-All-Check-Types](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2148991311/Editing+Checks#Edit-Check-Components-Common-to-All-Check-Types).

## Check Information <a href="#editingbrowserchecks-checkinformation" id="editingbrowserchecks-checkinformation"></a>



### Tags <a href="#editingbrowserchecks-tags" id="editingbrowserchecks-tags"></a>

See [https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2148991311/Editing+Checks#Tags](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2148991311/Editing+Checks#Tags).

### Enabled <a href="#editingbrowserchecks-enabled" id="editingbrowserchecks-enabled"></a>

See [https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2148991311/Editing+Checks#Enabling-and-Disabling-Checks](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2148991311/Editing+Checks#Enabling-and-Disabling-Checks) .

#### Returned Value <a href="#editingbrowserchecks-returnedvalue" id="editingbrowserchecks-returnedvalue"></a>



In the above image, (ms) denotes “milliseconds” and (b) denotes “bytes”.

* _Total Browser Render Time_ is the response time from the start of the navigation till the last request is completed.
* _Total Response Time_ is the sum of the response time of all objects which were loaded during the execution. “Total response time” measures _**serial**_ execution!
* _Total Page Size_ is the sum of the response size of all loaded objects in bytes.
* _DOM Content Loaded_ is the time from the start of the navigation until the “DOM Content Loaded” event.
* _DOM Complete_ is the time from the start of the navigation until the “DOM Complete” event.
* _DOM Interactive_ is the time from the start of the navigation until the “DOM Interactive” event.
* _DNS Lookup_ is the DNS lookup time.

### Web Browser <a href="#editingbrowserchecks-webbrowser" id="editingbrowserchecks-webbrowser"></a>

It is possible to change the browser name and version from within the Edit Check settings.



To add a scenario, click on the green “plus sign” icon to bring up the “Add Scenario” box:



Specify the desired name of the scenario and upload an .html or .side file and click “Save”:



To edit a scenario, click on the “pad and paper” icon to show the “Edit Scenario” dialog:



Individual files can be deleted from the scenario with the “delete file” button. The scenario can be replaced by a different scenario, or a newer version of the same scenario by uploading a locally stored scenario file. Refer to the article [Understanding the Debug Scenarios Page](broken-reference) for information on the Debug Scenarios functionality.

### Browser Behavior <a href="#editingbrowserchecks-browserbehavior" id="editingbrowserchecks-browserbehavior"></a>



#### Custom Headers <a href="#editingbrowserchecks-customheaders" id="editingbrowserchecks-customheaders"></a>

You can add custom Headers and Header Values in the “Custom Headers” field. For example, if you would like to add a custom User-Agent to the check, type “User-Agent” in the Header field and type a value of your choice in the Header Value field. Make sure to click the green “Plus” sign to apply the custom header!

Custom headers values support a set of “Message Placeholders” which can pass helpful check information to the server! Examples include %CHECK\_ID% and %CHECK\_NAME%. Refer to the article [https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=A2\&title=Copy%20of%20New%3A%20Webhook%20Placeholders](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=A2\&title=Copy%20of%20New%3A%20Webhook%20Placeholders) for more information on using Message Placeholders.

A common use case for Custom Headers involves utilizing a specific custom header (for example, “User-Agent: Apica”) in order to bypass bot protection for a specific website.

**Custom Header Placeholders**

It is possible to use the following placeholders within Custom Headers in order to pass dynamic information regarding the check to the application the check is accessing. This can be helpful when a URL call needs to pass unique URL-specific information along to the application. Currently, the following placeholders are available:

| Placeholder   | Description                                                                                                   | Example                                                                   |
| ------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `%GUID%`      | Check GUID.                                                                                                   | A UUID in the format `XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`.              |
| `%TIMESTAMP%` | Timestamp adjusted to timezone of current dispatch target (may be based on user/customer). Falls back to UTC. | Format `YYYY-MM-DD HH:MM:SS` (TZ-offset) or `YYYY-MM-DD HH:MM:SS` if UTC. |
| `%DATETIME%`  | Date and time in predefined format.                                                                           | Format `YYYY-MM-dd HH:mm:ss.SSS`.                                         |

#### Block <a href="#editingbrowserchecks-block" id="editingbrowserchecks-block"></a>

Block rules are often an important part of a check configuration, especially for checks which load many URLs. Block rules utilize the wildcard syntax; generally, you should include a wildcard before and after any string pattern you wish to block. For example, if you wish to block all URLs coming from [http://example.com](http://example.com) , use the block pattern \*[http://example.com](http://example.com) \*. If you wish to block only a certain URL or URLs on a certain subdomain, use the block pattern \*[example.com/firstSubdomain/secondSubdomain](http://example.com/firstSubdomain/secondSubdomain)\* (of course, firstDomain and secondDomain are arbitrary values and should be replaced with the path of the URL(s) you want to block). If you wish to block a certain URL with a certain subtype, use the block pattern \*[example.com/firstSubdomain/\*.woff\*](http://example.com/firstSubdomain/*.woff*). Again, these are arbitrary values; the importance lies in the placement of the wildcard character which will block any value before and after it until it reaches another defined character, per the definition of a wildcard.

The following header-based integrations require that the **Save Response Headers** option is enabled in the Browser Data settings.

#### Disable Automatic Page Breaks <a href="#editingbrowserchecks-disableautomaticpagebreaks" id="editingbrowserchecks-disableautomaticpagebreaks"></a>

Disables the insertion of automatic [page breaks](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Page-Breaks-in-a-Browser-Check-Result) which are generally inserted when the ASM scenario runs the “open” and any of the “…andWait” commands (e.g. clickAndWait). If automatic insertion of page breaks is disabled in the Browser Behavior section, page breaks can still be entered via the ASM scenario using the [insertPageBreak](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2135393876/Comparing+Selenium+IDE+Scripts+to+ASM+Scenarios#insertPageBreak) command.

#### Enable VDMS Debug Headers <a href="#editingbrowserchecks-enablevdmsdebugheaders" id="editingbrowserchecks-enablevdmsdebugheaders"></a>

When the VDMS option is enabled, [Edgecast X-EC-Debug](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2133691404/Edgecast+VDMS+Integration) headers are included, containing debugging information.

#### Enable Akamai Pragma Headers <a href="#editingbrowserchecks-enableakamaipragmaheaders" id="editingbrowserchecks-enableakamaipragmaheaders"></a>

Enabling the Akamai Pragma Headers options adds a header to the request.

#### Enable DynaTrace PurePath <a href="#editingbrowserchecks-enabledynatracepurepath" id="editingbrowserchecks-enabledynatracepurepath"></a>

When the DynaTrace PurePath option is enabled, a request header is added (overriding any existing header).

#### AppDynamics SnapShots <a href="#editingbrowserchecks-appdynamicssnapshots" id="editingbrowserchecks-appdynamicssnapshots"></a>

When the AppDynamics Snapshots option is enabled, transaction snapshots provided by AppDynamics are included in check results. This option will only be available if you have installed AppDynamics. If you have not enabled AppDynamics for your account, you will see the message “You haven’t installed AppDynamics” instead, with a link to the AppDynamics configuration page in ASM:



#### Screen Resolution <a href="#editingbrowserchecks-screenresolution" id="editingbrowserchecks-screenresolution"></a>

The browser screen resolution to use when accessing the URL. Default resolution is 1280 x 1024. Any [screenshots](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Screenshots) displayed in the check Results will be taken using this screen resolution.

## Browser Data <a href="#editingbrowserchecks-browserdata" id="editingbrowserchecks-browserdata"></a>

The check can be configured to store request and response headers in the Browser Data section:



When Request and Response headers are stored, every URL in the [URL Waterfall section](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#The-URL-Waterfall-Section) of a check result will contain additional request and response header information:



## Screenshots & Filmstrips <a href="#editingbrowserchecks-screenshots-and-filmstrips" id="editingbrowserchecks-screenshots-and-filmstrips"></a>

### Screenshots <a href="#editingbrowserchecks-screenshots" id="editingbrowserchecks-screenshots"></a>

You can instruct the check to take a screenshot during different intervals. If you want to save screenshots for your check, you can either elect to save screenshots for the check run when the check changes status (for example, from Informational to Fatal) or when the check fails.

It is possible to configure a check to produce screenshots for every run using the hidden menu item “Always”. However, this feature must be enabled per account. Talk to your Technical Account Manager if you would like more information on enabling the “Always” option for screenshots for one or many of your account’s checks.

The following screenshot shows the default options for screenshots:



You can see on which conditions ASM inserts a screenshot into a scenario [in this article](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Screenshots).

### Filmstrips <a href="#editingbrowserchecks-filmstrips" id="editingbrowserchecks-filmstrips"></a>

Filmstrips are a deprecated feature of ASM. They are available for Firefox checks and Chrome v23 and v55 checks. Filmstrips take screenshots at certain time-based frequencies during the check run, providing a very visual representation of the user journey.



### Blurring Mode <a href="#editingbrowserchecks-blurringmode" id="editingbrowserchecks-blurringmode"></a>

It is possible to set a “Blurring Mode” for screenshots which will hide sensitive data from being seen on the Check Results page. There are 4 different blurring modes - use the mode which will effectively hide the information you do not wish to show to an end user who can view Check Results but does not have access to the Edit Check page.

## Severity Handling <a href="#editingbrowserchecks-severityhandling" id="editingbrowserchecks-severityhandling"></a>

The Severity Handling section allows users to configure rules which will affect the returned Severity of the check (Informational, Warning, Error, or Fatal).



| **Item**                   | **Description**                                                                                                                                                                                                                      | **Comment**                                                                                                                                                                                                                                                                       |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Check Fail Severity**    | This will be the Severity that the check will be assigned if it fails. This can be used to trigger a different Severity for the check results.                                                                                       | Default is `Fatal`.                                                                                                                                                                                                                                                               |
| **High Warning Threshold** | Thresholds are used to set custom thresholds for triggering Severity changes of checks. If the returned value from the check passes over High Warning Threshold it will trigger a Severity change of the check Warning (**Yellow**). | A warning is triggered **above** this value.                                                                                                                                                                                                                                      |
| **High Error Threshold**   | Thresholds are used to set custom thresholds for triggering Severity changes of checks. If the returned value from the check passes over High Error Threshold it will trigger a Severity change of the check Error (**Orange**).     | Error is triggered **above** this value.                                                                                                                                                                                                                                          |
| **Low Warning Threshold**  | Thresholds are used to set custom thresholds for triggering Severity changes of checks. If the returned value from the check drops below Low Warning Threshold it will trigger a Severity change of the check Warning (**Yellow**).  | A warning is triggered **below** this value.                                                                                                                                                                                                                                      |
| **Low Error Threshold**    | Thresholds are used to set custom thresholds for triggering Severity changes of checks. If the returned value from the check drops below Low Error Threshold it will trigger a Severity change of the check Error (**Orange**).      | Error is triggered **below** this value.                                                                                                                                                                                                                                          |
| **Severity Mapping**       | See dedicated “Severity Mapping” section below.                                                                                                                                                                                      | See dedicated “Severity Mapping” section below.                                                                                                                                                                                                                                   |
| **Preserve Value**         | Enable this option to preserve the Returned Value for a check run with URL errors that are mapped to I, W, or E (and there is no selenium error).                                                                                    | By default, a check run with URL errors are shown as a failed check run and the Returned Value is not saved or shown in the [Check Result message](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2134212678/Understanding+Browser+Check+Results#Result-Message).       |
| **Error Wildcard**         | <p>Error Status Codes pattern '*' applies to:</p><ul><li>Bad HTTP status (0, 4*, 5*) and any other URL error</li><li>Bad HTTP status only (0, 4*, 5*)</li><li>Any HTTP status</li></ul>                                              | <p>This feature allows a user to configure what the wildcard character applies to when it is used in the “Error Status Codes” field.</p><p>If a user wishes to “map” the wildcard character to 4** and 5** errors only, they should select “Bad HTTP status only (0, 4*, 5*).</p> |
| **Target SLA %**           | Sets a 1st Target SLA in percentage e.g 99.5 or 99.                                                                                                                                                                                  | This is used in certain types of reports.                                                                                                                                                                                                                                         |
| **Target SLA %(2nd)**      | Sets a 2nd Target SLA in percentage e.g 99.5 or 99.                                                                                                                                                                                  | This is used in certain types of reports.                                                                                                                                                                                                                                         |

#### Severity Mapping <a href="#editingbrowserchecks-severitymapping" id="editingbrowserchecks-severitymapping"></a>

Severity Mapping allows a user to manually change the default severity that would be assigned to a certain URL or set of URLs when a certain HTTP status code is returned. Severity Mapping is generally used when a user wishes to “ignore” a URL failure or to map it to a lesser severity. For example, a user who receives 404 status codes for a set of resources matching the Wildcard pattern [http://ticketmonster.apicasystem.com/ticket-monster/resources/templates/\*](http://ticketmonster.apicasystem.com/ticket-monster/resources/templates/*) can manually assign those “failing” resources a status of Informational using Severity Mapping. That way, the check will still pass! Other common reasons to use Severity Mappings include:

* Some specific background error that needs investigation but doesn't need to throw alerts
* Monitor 3rd party URLs without check failures
* Integrating Severity Mappings with [Alerts](broken-reference)

**Examples of Severity Mapping**

In the following example, any 500 error status code or 404 status code from any page on [http://www.example.com](http://www.example.com) will be assigned a Warning severity:

| **Url Pattern Type** | **Url Pattern** | **Error Status Codes** | **Treat as Severity** |
| -------------------- | --------------- | ---------------------- | --------------------- |
| Wildcard             | \*example.com\* | 404, 500               | Information           |

The following example utilizes regex for severity mapping:

| **Url Pattern Type** | **Url Pattern**                                           | **Error Status Codes** | **Treat as Severity** |
| -------------------- | --------------------------------------------------------- | ---------------------- | --------------------- |
| Regex                | ^http:\\/\\/(www\\.)?(\[a-zA-Z0-9-]+\\.)?example\\.com.\* | 403                    | Information           |

In the following all error status codes from `example.com` are mapped as `Fatal` and all status code `500` that does not come from `example.com` are mapped as `Warning`:



| Url Pattern   | Error Status Code | Treat as Severity |
| ------------- | ----------------- | ----------------- |
| `example.com` | `*`               | `Fatal`           |
| `*`           | `500`             | `Warning`         |

Note that the Error Wildcard in the above example is set to “Any HTTP status”. This will ensure that 2\*\*, 3\*\*, etc. status codes are also mapped to Fatal (not just 4\*\*, 5\*\*, and other standard error codes).

Severity rules are resolved in the following order. If a URL matches two or more severities the higher severity will be used:

1. Fatal
2. Error
3. Warning
4. Information
