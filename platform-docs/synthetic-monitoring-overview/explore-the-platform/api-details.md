# API Details

For complete ASM API documentation, follow this link.

Supporting documentation will be referenced in the content below.

The ASM API allows developers to collect performance data programmatically or manage their account from an external service.The Synthetic Monitoring API uses a RESTful JSON implementation that allows you programmatically get and set data in Synthetic Monitoring.



## Required data <a href="#apidetails-requireddata" id="apidetails-requireddata"></a>

Requests must be provided with particular data to access the API.

### Base URL <a href="#apidetails-baseurl" id="apidetails-baseurl"></a>

The base URL for all operations is [https://api-asm1.apica.io/v3/Help](https://api-asm1.apica.io/v3/Help)

### Authorization <a href="#apidetails-authorization" id="apidetails-authorization"></a>

You can authorize your requests either with either a basic authorization header or an authentication ticket parameter.

| Header          | Content                                                                                                                                                                                                        | Example                    |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- |
| `Authorization` | <p><code>Basic</code> + Base64 encoded value of string <code>username:password</code><br>Where <code>username</code> is user name with access to the check and <code>password</code> is the user password.</p> | `dXNlcm5hbWU6cGFzc3dvcmQ=` |

| Parameter     | Content                              | Example                                 |
| ------------- | ------------------------------------ | --------------------------------------- |
| `auth_ticket` | Authentication ticket from API tool. |  `9C94CBC4-C64E-4AEA-BBB2-8241445B06CC` |

## API Usage Example <a href="#apidetails-apiusageexample" id="apidetails-apiusageexample"></a>

The following is an example of how you can use the API to trigger a check run, wait for the result and then get the result once it is available.

1. Get the latest check results based on check ID.

[https://api-asm1.apica.io/v3/Help/Route/GET-checks-checkId-results\_mostrecent\_detail\_level\\](https://api-asm1.apica.io/v3/Help/Route/GET-checks-checkId-results_mostrecent_detail_level)

1. Save

`timestamp_utc`

1. Trigger a check run based on check ID:

[https://api-asm1.apica.io/v3/Help/Route/POST-checks-checkId-job\\](https://api-asm1.apica.io/v3/Help/Route/POST-checks-checkId-job)

1. Get the latest result by continuously getting the latest result by the check-ID until

`timestamp_utc` has been changed.\
[https://api-asm1.apica.io/v3/Help/Route/GET-checks-checkId-results\_mostrecent\_detail\_level=1\\](https://api-asm1.apica.io/v3/Help/Route/GET-checks-checkId-results_mostrecent_detail_level=1)\
**Note:** use `detail_level=1`

1. Get and save

`identifier`

1. You can now get the detailed result for the check based on

`identifier`.\
a. Browser:\
[https://api-asm1.apica.io/v3/Help/Route/POST-checks-browser-checkId-results-urldata\\](https://api-asm1.apica.io/v3/Help/Route/POST-checks-browser-checkId-results-urldata)\
b. ProxySniffer/ZebraTester:\
[https://api-asm1.apica.io/v3/Help/Route/POST-checks-proxysniffer-checkId-results-urldata\\](https://api-asm1.apica.io/v3/Help/Route/POST-checks-proxysniffer-checkId-results-urldata)

## Generate GET Calls <a href="#apidetails-generategetcalls" id="apidetails-generategetcalls"></a>

The API tool allows you to select a check to generate GET calls for.

**View**



**Generate Check Operations**

* Click **Select Check**
* Choose the check you want from the dropdown list

The **Check Operations** Table is displayed, containing a list of calls and descriptions of each.

## Apica Synthetic Monitoring API Java Library <a href="#apidetails-apicasyntheticmonitoringapijavalibrary" id="apidetails-apicasyntheticmonitoringapijavalibrary"></a>

### Apica Synthetic Monitoring API Java Library <a href="#apidetails-apicasyntheticmonitoringapijavalibrary.1" id="apidetails-apicasyntheticmonitoringapijavalibrary.1"></a>



Java Library for Accessing the Apica Synthetic Monitoring API: Access and use the ASM API to work with checks and check runs.

### API Key <a href="#apidetails-apikey" id="apidetails-apikey"></a>

This app requires an API key for the Apica Synthetic Monitoring service. If you have an ASM account you can find your key on the Tools>API Settings page: [https://wpm.apicasystem.com/Tools/ApiSettings](https://wpm.apicasystem.com/Tools/ApiSettings)

The API Key is called auth\_ticket.

### Download <a href="#apidetails-download" id="apidetails-download"></a>

[https://github.com/patwakeem/Asm](https://github.com/patwakeem/Asm)

This app is considered to be a beta. Please report any crashes or feature requests. If you have a problem, your WPM username would be helpful in tracking down the cause.
