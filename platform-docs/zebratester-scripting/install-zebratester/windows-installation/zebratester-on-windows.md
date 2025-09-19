# ZebraTester on Windows

Accessing the ZebraTester GUI and recording of web surfing sessions is fully supported by using Microsoft Internet Explorer.

In fact, recording of Web surfing sessions is supported by using _any_ web browser, such as Internet Explorer, Google Chrome or Safari. You can use also ZebraTester in either Firefox or Chrome without installing their respective [Apica Recorder Extensions](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620878/Download+the+Extension).

However, without the [Firefox or Chrome browser ](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620878/Download+the+Extension)extension, you must reconfigure your Web browser before you will be able to record a Web-surfing session. This is described in the Installation Guide, Chapter 3:

**\*\*Note:\*\* Using a Recording Extension requires that the ZebraTester Console is started.**

***

Before using ZebraTester, you must configure appropriate Web browser settings:

* Pop-up windows must be allowed from the localhost (127.0.0.1)
* A special, local proxy server is already started with the product. Recording web surfing sessions require that the data exchange between the Web browser and the Web server(s) flows through this local proxy server; therefore, the Web browser must be reconfigured for recording.

***

| For IE 11 browsers, this is found under Internet Options (LAN Settings)                                                                                                                                                          | Open attachments/25782926/25783015/1![](blob:https://apica-kb.atlassian.net/c33a1432-8fae-4a53-a03a-2b7b9bd1b01f#media-blob-url=true\&id=ab808baa-847f-4455-9192-a50c8973c0ee\&collection=contentId-4620840\&contextId=4620840\&width=412\&height=518\&alt=) |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Under LAN Settings, check the box to use a Proxy server for your LAN and click Advanced to Proceed.                                                                                                                              | Open attachments/25782926/25783016/1![](blob:https://apica-kb.atlassian.net/55ad7071-8192-4e14-8331-f292f8790123#media-blob-url=true\&id=5d6e1059-512c-4a94-8a24-899e9f9a4359\&collection=contentId-4620840\&contextId=4620840\&width=383\&height=330\&alt=) |
| <p>In the Proxy Settings Window, use these values for HTTP &#x26; HTTPS connections. Add the Exceptions as illustrated.</p><ul><li>Proxy host 127.0.0.1</li><li>Proxy port 7997</li><li>Do not use Proxy for 127.0.0.1</li></ul> | Open attachments/25782926/25783017/1![](blob:https://apica-kb.atlassian.net/49fa9d18-d045-4d30-a1b2-75a152835212#media-blob-url=true\&id=09e55c29-63de-426a-ad85-61843e20fdbe\&collection=contentId-4620840\&contextId=4620840\&width=400\&height=421\&alt=) |

&#x20;

&#x20;

&#x20;

&#x20;
