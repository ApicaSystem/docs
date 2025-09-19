# Akamai Integration

**Caveat**: each of the following integration directions was based on the UI when it was written. The UIs may change by the time you read this, so _UI updates are beyond the scope of these articles_. Please go to the integration target sites for their latest information on integration directions.

## Akamai <a href="#akamaiintegration-akamai" id="akamaiintegration-akamai"></a>

By monitoring the relationship between response times and actual traffic pushed through Akamai over time, you can better understand your environment and more easily troubleshoot problems as they arise.

**View**



## Akamai Integration Features <a href="#akamaiintegration-akamaiintegrationfeatures" id="akamaiintegration-akamaiintegrationfeatures"></a>

#### Introduction <a href="#akamaiintegration-introduction" id="akamaiintegration-introduction"></a>

Akamai is one of the world’s largest content delivery networks (CDN). Apica is an Akamai Partner and offers full API Integration for CDN Traffic information from Akamai - Luna Control.

There is also support for enabling Akamai pragma headers for Synthetic Monitoring checks, meaning tracing and troubleshooting sites that use Akamai is even easier.

This allows you to dive deeper into the results of each request, determine if URLs are being cached and pinpoint the root cause of poor response times.

**View**

Sample views:

Integration Dashboard



Check Results



## Setting up Akamai <a href="#akamaiintegration-settingupakamai" id="akamaiintegration-settingupakamai"></a>

#### Setup <a href="#akamaiintegration-setup" id="akamaiintegration-setup"></a>

Setting the Akamai integration up for your Synthetic Monitoring account requires Akamai account credentials.

**View**



| Item                      | Description                                       |
| ------------------------- | ------------------------------------------------- |
| Username                  | Akamai username.                                  |
| Password                  | Akamai password.                                  |
| Available Akamai Services | Akamai Services that are enabled for the account. |

#### Buttons <a href="#akamaiintegration-buttons" id="akamaiintegration-buttons"></a>

| Button | Action    | Description                          |
| ------ | --------- | ------------------------------------ |
|        | Save      | Store the changes.                   |
|        | Cancel    | Stop editing and ignore all changes. |
|        | Dashboard | Open the Akamai Dashboard.           |

## Step-by-Step Akamai Integration <a href="#akamaiintegration-step-by-stepakamaiintegration" id="akamaiintegration-step-by-stepakamaiintegration"></a>

#### Akamai Setup <a href="#akamaiintegration-akamaisetup" id="akamaiintegration-akamaisetup"></a>

Setting up the Akamai integration is mostly a matter of allowing Synthetic Monitorings to access your Akamai account.

**Note:** Using Akamai integration requires an active Akamai account.

**Setup**

To set up the Akamai integration:



* Click **Setup Akamai**



* Enter your **User name** (email)



* Enter your **Password**
* Click **Save**

The integration is set up.



## Akamai Dashboard <a href="#akamaiintegration-akamaidashboard" id="akamaiintegration-akamaidashboard"></a>

#### Akamai Dashboard <a href="#akamaiintegration-akamaidashboard.1" id="akamaiintegration-akamaidashboard.1"></a>

The Akamai Dashboard shows information about data collected from the Akamai account.



Each available service is shown in a separate tab.

For details about the provided data, see the [https://www.akamai.com](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=Akamai\&linkCreation=true\&fromPageId=4631563) documentation for the services you are using.

## Debugging With Akamai Headers <a href="#akamaiintegration-debuggingwithakamaiheaders" id="akamaiintegration-debuggingwithakamaiheaders"></a>

#### Headers <a href="#akamaiintegration-headers" id="akamaiintegration-headers"></a>

Akamai provides debug data for content hosted by their CDN service. This data is useful when trying to assess issues with Akamai services.

**View**

When provided with the appropriate request headers through a check, Akamai servers can provide debug information about objects through the HTTP response headers.



The debug headers are displayed in the expanded [Waterfall](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=Waterfall\&linkCreation=true\&fromPageId=4631568) view.

## Akamai Pragma Request Headers <a href="#akamaiintegration-akamaipragmarequestheaders" id="akamaiintegration-akamaipragmarequestheaders"></a>

#### Request <a href="#akamaiintegration-request" id="akamaiintegration-request"></a>

The response headers are displayed on the left in the expanded [Waterfall](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=Waterfall\&linkCreation=true\&fromPageId=4631571) view.

**Request Headers**



| Header                             | Description                                                                               |
| ---------------------------------- | ----------------------------------------------------------------------------------------- |
| akama-xi-get-extracted-values      |                                                                                           |
| akamai-x--meta-trace               |                                                                                           |
| akamai-x-cache-on                  | Returns information about how the response was served.                                    |
| akamai-x-cache-remote-on           | Returns information about how the parent served its response.                             |
| akamai-x-check-cacheable           | Returns `X-Check-Cacheable` with the value of `yes` or `no` to indicate cacheable status. |
| akamai-x-get-cache-key             | Returns the cache key used for the request. (Deprecated.)                                 |
| akamai-x-get-extracted-values      | Returns the values extracted from the request into variables.                             |
| akamai-x-get-nonces                |                                                                                           |
| akamai-x-get-request-id            | Returns `request-id` used to identify request in the logs.                                |
| akamai-x-get-ssl-client-session-id |                                                                                           |
| akamai-x-get-true-cache-key        |                                                                                           |
| akamai-x-request-trace             |                                                                                           |
| akamai-x-serial-no                 | Returns `x-serial` with the serial number used for the request.                           |

## Enable Akamai Pragma Headers <a href="#akamaiintegration-enableakamaipragmaheaders" id="akamaiintegration-enableakamaipragmaheaders"></a>

#### Enable <a href="#akamaiintegration-enable" id="akamaiintegration-enable"></a>

In order to retrieve the debug data, checks must provide the correct pragma headers.

**View**

The settings for retrieving debug data are available in the check configuration, in the sections **Integrations** and **Browser Data**.

* Find the **Integrations** section



* Check **Enable Akamai Pragma Headers**
* Find the **Browser Data** section



* Check **Store Request & Response Headers**

The pragma headers are enabled for the check.

**Headers Example**

```
akamai-x-cache-on
akamai-x-cache-remote-on
akamai-x-check-cacheable
akamai-x-get-cache-key
akamai-x-get-extracted-values
akamai-x-get-nonces
akamai-x-get-ssl-client-session-id
akamai-x-get-true-cache-key
akamai-x-serial-no
```

**Response Example**

```
HTTP/1.x 200 OK
Content-Type: text/html
Etag: W/"26100-124692218130400"
Cache-Control: max-age=120
Date: Tue, 14 Jul 2009 18:01:27 GMT
X-Cache: TCP_MEM_HIT from a69-174-50-208 (AkamaiGHost/5.7.2-5726413) (-)
X-Cache-Key: S/L/2649/75069/6h/www.example.com/common/global.html
X-True-Cache-Key: /L/www.example.com/common/global.html
X-Serial: 2649
Connection: keep-alive
Vary: Accept-Encoding
X-Check-Cacheable: YES
```

## Akamai Responses to Pragma Headers <a href="#akamaiintegration-akamairesponsestopragmaheaders" id="akamaiintegration-akamairesponsestopragmaheaders"></a>

#### Response <a href="#akamaiintegration-response" id="akamaiintegration-response"></a>

The response headers are displayed on the right in the expanded [Waterfall](https://apica-kb.atlassian.net/wiki/pages/createpage.action?spaceKey=ASMDOCS\&title=Waterfall\&linkCreation=true\&fromPageId=4631574) view.

**Response Headers**



| Header              | Description                                                                                                                                                                    |   |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | - |
| X-Check-Cacheable   | Shows if the URL can be cached on Akamai.                                                                                                                                      |   |
| X-Akamai-Request-ID |  Request ID provides a unique request identifier on the Akamai network. Value of this header can be used to trace a request on the Akamai network by a support representative. |   |
| X-Cache-Key         | The value used to store content.                                                                                                                                               |   |
| X-Cache             | Cache information.                                                                                                                                                             |   |

**X-Check-Cacheable HTTP Response Header**

The X-Check-Cacheable HTTP header may be inaccurate depending on what metadata is applied to the request and how the TTL is set up (configuration vs response headers).

The most accurate way to determine cache-ability of an object is to run multiple requests and check the status of the response on the X-Cache header.

More information is available at [https://control.akamai.com/search/kb/5396](https://control.akamai.com/search/kb/5396) in the Akamai knowledgebase.

**X-Cache-Key HTTP Response Header**

The `X-Cache-Key` response header is deprecated. If used, it will return the Cache Key-value used to store content on Akamai network.

Example:

```
X-Cache-Key: /L/9/12345/1d/www.example.com/ index.html
```

The value before the URL (`1d` in the example) indicates the time setting for the cache (number and unit):

|     | Value           | Meaning                                           | Description |
| --- | --------------- | ------------------------------------------------- | ----------- |
| 000 | Non-cacheable.  |                                                   |             |
| 0s  | 0-second cache. | Serve from cache but revalidate on every request. |             |
| 10s | 10 seconds.     |                                                   |             |
| 45m | 45 minutes.     |                                                   |             |
| 8h  | 8 hours.        |                                                   |             |
| 1d  | 1 day.          |  24 hours.                                        |             |

**X-Cache HTTP Response Header**

The X-Cache HTTP response header is returned for requests using `Pragma: akamai-x-cache-on`.

| Response               | Meaning                                                                                                                                        |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `TCP_HIT`              | The object was fresh in cache and object from the disk cache.                                                                                  |
| `TCP_MISS`             | The object was not in the cache, the server fetched the object from origin.                                                                    |
| `TCP_REFRESH_HIT`      | The object was stale in the cache and we successfully refreshed with the origin on an If-Modified-Since request.                               |
| `TCP_REFRESH_MISS`     | The object was stale in the cache and refresh obtained a new object from the origin in response to our IF-Modified Since request.              |
| `TCP_REFRESH_FAIL_HIT` | The object was stale in the cache and we failed on refresh (couldn't reach origin) so we served the stale object.                              |
| `TCP_IMS_HIT`          | IF-Modified-Since request from client and object was fresh in the cache and served.                                                            |
| `TCP_NEGATIVE_HIT`     | Object previously returned a “not found” (or any other negatively cacheable response) and that cached response was a hit for this new request. |
| `TCP_MEM_HIT`          | The object was on disk and in the memory cache. Server served it without hitting the disk.                                                     |
| `TCP_DENIED`           | Denied access to the client.                                                                                                                   |
| `TCP_COOKIE_DENY`      | Denied access on cookie authentication (if centralized or decentralized authorization feature is being used in a configuration).               |
