# Recording Web Surfing Sessions with ZebraTester

Recording a Web-surfing session is supported by using _any_ web browser, like Internet Explorer, Google Chrome, or Safari.

You can also use ZebraTester in either Firefox or Chrome without installing their respective [Apica Recorder Extensions](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620878/Download+the+Extension).

However, it would be best if you reconfigured your Web browser without either [Firefox or Chrome browser ](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620878/Download+the+Extension)extension before you can record a Web-surfing session. This is described in the Installation Guide, Chapter 3:

**\*\*Note:\*\* Using a Recording Extension requires that the ZebraTester Console is started.**

***

Before using ZebraTester, you must configure appropriate Web browser settings:

* Pop-up windows must be allowed from the localhost (127.0.0.1)
* A special, local proxy server is already started with the product. Recording web surfing sessions require that the data exchange between the Web browser and the Web server(s) flows through this local proxy server; therefore, the Web browser must be reconfigured for recording.

**Note**: As a convenient alternative, you can use the [Apica Recorder Extension](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620878/Download+the+Extension), which is available for both Chrome and Firefox [here](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620878/Download+the+Extension).

***

| For IE 11 browsers, the proxy settings are found under Internet Options (LAN Settings)                                                                                                                                           |   |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | - |
| Under LAN Settings, check the box to use a Proxy server for your LAN and click Advanced to Proceed.                                                                                                                              |   |
| <p>In the Proxy Settings Window, use these values for HTTP &#x26; HTTPS connections. Add the Exceptions as illustrated.</p><ul><li>Proxy host 127.0.0.1</li><li>Proxy port 7997</li><li>Do not use Proxy for 127.0.0.1</li></ul> |   |

Load tests against Web servers or web applications are usually based on recorded web surfing sessions. This means that you usually first record a Web-surfing session before executing a load test. In simple cases - when no login is required, and no HTML forms need to be submitted - you may alternatively use the Page Scanner tool instead of recording a web surfing session manually.

***



### Recording the First Web Page <a href="#recordingwebsurfingsessionswithzebratester-recordingthefirstwebpage" id="recordingwebsurfingsessionswithzebratester-recordingthefirstwebpage"></a>

1. **Start a second Web browser window.**
2. **Clear the Web browser cache and all cookies ¹**
3. Click the **Start Recording** button in the Web Admin GUI **in the first Web browser window.**
4. Enter the desired start page of the Web server or Web application **in the second Web browser window**

The first Web page should now be recorded. Click the **Refresh Display** button in the right upper corner inside the Web Admin GUI to see if the Web page's recording was successful. If no data was recorded, you should check the Web browser's proxy configuration.

**¹** Please note that you must first clear the Web browser cache and all cookies every time before you start recording a new Web surfing session. Chapter 3.3 in **the Installation Guide** contains some illustrations about how to clear the Web browser cache and all cookies.

### Recording Subsequent Web Pages <a href="#recordingwebsurfingsessionswithzebratester-recordingsubsequentwebpages" id="recordingwebsurfingsessionswithzebratester-recordingsubsequentwebpages"></a>

**You must insert a** **page break** before the next Web page is called. This is because the local proxy server cannot recognize when a Web page starts and finishes. The local proxy server only sees single URL calls, such as requests for HTML data or image files. Adding a page break manually here is necessary to record the session properly.

Use the following strategy during the recording of a web surfing session over several web pages:

1. **First, plan** which URL or hyperlink you will call (and record) next, **but don't click on it just yet!**
2. Then, **insert a page break comment** into the Web Admin GUI. Enter a comment describing the expected result of the next recorded Web page.
3. Now **call the desired URL** by clicking on a hyperlink or submitting a form.

Repeat this strategy for each Web page that you call during recording. Remember that you must insert the page break **before** you click the next hyperlink or submit the next form.

The time in seconds near the page break comment is the user’s think time, which will be applied during the load test. This is when a (human) user needs to study the content of the Web page before clicking on the subsequent page. The percentage value near the time is the randomized range of the think time, which will be calculated new every time, for each user and page-call during the test. This means that concurrent users will not use the same think time.

Click the **Stop Recording** button in Web Admin after recording all Web pages.
