# ZebraTester FAQ

**A list of frequently asked questions.**

* [Installation and Configuration](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Installation-and-Configuration)
  * [How can I update the license without reinstalling ZebraTester?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#How-can-I-update-the-license-without-reinstalling-ZebraTester%3F)
  * [How to upgrade ZebraTester to a newer version?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#How-to-upgrade-ZebraTester-to-a-newer-version%3F)
  * [Why are my load test jobs restricted to simulate only 50 virtual users?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Why-are-my-load-test-jobs-restricted-to-simulate-only-50-virtual-users%3F)
  * [How can I start an Exec Agent (Load Generator) as a Windows Service?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#How-can-I-start-an-Exec-Agent-\(Load-Generator\)-as-a-Windows-Service%3F)
  * [Where I can register additional Exec Agents in the GUI?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Where-I-can-register-additional-Exec-Agents-in-the-GUI%3F)
  * [What kinds of network protocols are supported for transferring load test jobs to external Exec Agents?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#What-kinds-of-network-protocols-are-supported-for-transferring-load-test-jobs-to-external-Exec-Agents%3F)
  * [How can I change the root directory of the Project Navigator?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#How-can-I-change-the-root-directory-of-the-Project-Navigator%3F)
  * [How can I change the default time zone?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#How-can-I-change-the-default-time-zone%3F)
  * [Why I get the error "AWS Error Message: Request has expired" when trying to access the Amazon EC2 Service from the ZebraTester GUI?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Why-I-get-the-error-%22AWS-Error-Message%3A-Request-has-expired%22-when-trying-to-access-the-Amazon-EC2-Service-from-the-ZebraTester-GUI%3F)
  * [How to remove ZebraTester completely from a computer?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#How-to-remove-ZebraTester-completely-from-a-computer%3F)
* [Recording and Post-Processing of Web Surfing Sessions](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Recording-and-Post-Processing-of-Web-Surfing-Sessions)
  * [Is it possible to open two scripts at the same time?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Is-it-possible-to-open-two-scripts-at-the-same-time%3F)
  * [Which web browser products are supported for the recording of web surfing sessions?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Which-web-browser-products-are-supported-for-the-recording-of-web-surfing-sessions%3F)
  * [Which web browser products can be emulated during a load test?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Which-web-browser-products-can-be-emulated-during-a-load-test%3F)
  * [What kinds of data are captured during the recording of a web surfing session?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#What-kinds-of-data-are-captured-during-the-recording-of-a-web-surfing-session%3F)
  * [Is it possible to record a web surfing session over several web servers?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Is-it-possible-to-record-a-web-surfing-session-over-several-web-servers%3F)
  * [Why does the web browser display a security warning during the recording of a web surfing session for an SSL-encrypted website (HTTPS)?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Why-does-the-web-browser-display-a-security-warning-during-the-recording-of-a-web-surfing-session-for-an-SSL-encrypted-website-\(HTTPS\)%3F)
  * [Are session cookies supported?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Are-session-cookies-supported%3F)
  * [How can I handle session-specific parameters which are exchanged as CGI or as form values?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#How-can-I-handle-session-specific-parameters-which-are-exchanged-as-CGI-or-as-form-values%3F)
  * [How can I assign to each simulated user an own username and password during the execution of a load test?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#How-can-I-assign-to-each-simulated-user-an-own-username-and-password-during-the-execution-of-a-load-test%3F)
  * [How can I achieve that some of the simulated users are executing only parts of a web surfing session?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#How-can-I-achieve-that-some-of-the-simulated-users-are-executing-only-parts-of-a-web-surfing-session%3F)
* [Load Test Execution](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Load-Test-Execution)
  * [What can I do if my generated load test program does not work?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#What-can-I-do-if-my-generated-load-test-program-does-not-work%3F)
  * [I have recorded a web surfing session which uploads a file - But why does the load test fail?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#I-have-recorded-a-web-surfing-session-which-uploads-a-file---But-why-does-the-load-test-fail%3F)
  * [Is it possible to run in parallel several load test jobs that are based on different web surfing sessions?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Is-it-possible-to-run-in-parallel-several-load-test-jobs-that-are-based-on-different-web-surfing-sessions%3F)
  * [What is the maximum number of virtual users that can be reached by a load test?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#What-is-the-maximum-number-of-virtual-users-that-can-be-reached-by-a-load-test%3F)
  * [Why I can't use my Windows workstation to generate a realistic load?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#Why-I-can't-use-my-Windows-workstation-to-generate-a-realistic-load%3F)
  * [What should be measured?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#What-should-be-measured%3F)
  * [How can I easily determine if the network is the reason for slow response times?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#How-can-I-easily-determine-if-the-network-is-the-reason-for-slow-response-times%3F)
  * [What can be done if embedded images are slowly displayed?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#What-can-be-done-if-embedded-images-are-slowly-displayed%3F)
  * [If a response timeout is measured - or when slow response times are measured: How can I determine exactly if this is a network problem or because if the web application responds too slowly?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#If-a-response-timeout-is-measured---or-when-slow-response-times-are-measured%3A-How-can-I-determine-exactly-if-this-is-a-network-problem-or-because-if-the-web-application-responds-too-slowly%3F)
  * [What's the error type "Network Error at Client Side"?](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620802/ZebraTester+FAQ#What's-the-error-type-%22Network-Error-at-Client-Side%22%3F)

***

## Installation and Configuration <a href="#installation-and-configuration" id="installation-and-configuration"></a>

### How can I update the license without reinstalling ZebraTester? <a href="#how-can-i-update-the-license-without-reinstalling-zebratester" id="how-can-i-update-the-license-without-reinstalling-zebratester"></a>

You have to update the content of the files prxsniff.key and ExecAgentTicket.dat by using a normal text editor like notepad.exe or vi. Both files are located in the ZebraTester installation directory. The file prxsniff.key contains your GUI license key and the File ExecAgentTicket.dat contains your Exec Agent License Ticket. You have to restart ZebraTester after you have updated your license. Note: if you do not have an Exec Agent License Ticket for your local system on which the GUI is running you can let the content of the file ExecAgentTicket.dat empty. In such a case only 50 virtual users can be simulated by your local Exec Agent.

### How to upgrade ZebraTester to a newer version? <a href="#how-to-upgrade-zebratester-to-a-newer-version" id="how-to-upgrade-zebratester-to-a-newer-version"></a>

If you have installed ZebraTester by using an installation kit for Windows, Mac OS X, or Ubuntu, you have first to uninstall ZebraTester by calling the corresponding uninstaller utility. Your load test data will not be deleted. After that install the new ZebraTester version. During installation, select the same installation directory that was used in the previous version in order that the content of your MyTests sub-directory continues to be accessible from the Project Navigator. Ensure that all additional (remote) Exec Agents are also upgraded to the new ZebraTester Version. Mixing different ZebraTester versions for the GUI and the (remote) Exec Agents is not supported, and will lead to errors when starting Load Tests.

### Why are my load test jobs restricted to simulate only 50 virtual users? <a href="#why-are-my-load-test-jobs-restricted-to-simulate-only-50-virtual-users" id="why-are-my-load-test-jobs-restricted-to-simulate-only-50-virtual-users"></a>

The reason is that the content of the file ExecAgentTicket.dat which contains your Exec Agent License Ticket data cannot be read or contains invalid data. If you have started ZebraTester in a normal way by clicking on the "ZebraTester Console" icon, please scroll up inside the ZebraTester Console (the black window with the green text) at the beginning of the output to see the corresponding error message. Please note that the content of the file ExecAgentTicket.dat must also include the delimiter lines:

`-----BEGIN EXEC AGENT LICENSE TICKET-----`

and

`-----END EXEC AGENT LICENSE TICKET-----`

### How can I start an Exec Agent (Load Generator) as a Windows Service? <a href="#how-can-i-start-an-exec-agent-load-generator-as-a-windows-service" id="how-can-i-start-an-exec-agent-load-generator-as-a-windows-service"></a>

Starting an Exec Agent (load generator) as a Windows service is only recommended on (remote) systems where no ZebraTester Console is started. As the first step, install ZebraTester by running the normal Windows installation kit but do not enter a GUI license key during installation: enter only the corresponding Exec Agent License Ticket data. After installation, call InstallExecAgentService.bat. This script will register the Windows Service ZebraTester ExecAgent. For the first time - after running this script - you have to start this service manually. Consider also that you have to reconfigure the firewall in such a way that inbound connections on TCP/IP port 7993 are enabled. Note for Windows Vista/7/2008 systems: it is necessary that you disable UAC to start this service successfully. Special notes for uninstalling ZebraTester in such a case: before uninstalling ZebraTester you have first to stop manually the service ZebraTester ExecAgent. Then deregister the service by calling UninstallExecAgentService.bat. After that, you can continue to uninstall ZebraTester in the normal way.

### Where I can register additional Exec Agents in the GUI? <a href="#where-i-can-register-additional-exec-agents-in-the-gui" id="where-i-can-register-additional-exec-agents-in-the-gui"></a>

From the Main Menu, open the "Project Navigator", and after that click on the "Network" icon at the top of the "Project Navigator" window which will open the "Exec Agent Network Configuration" window.

### What kinds of network protocols are supported for transferring load test jobs to external Exec Agents? <a href="#what-kinds-of-network-protocols-are-supported-for-transferring-load-test-jobs-to-external-exec-agent" id="what-kinds-of-network-protocols-are-supported-for-transferring-load-test-jobs-to-external-exec-agent"></a>

For internal communication between the GUI and the Exec Agents, plain TCP/IP network connections as well as HTTP/S tunneling is supported. Usually, the Exec Agents are listening on plain TCP/IP port 7993 - or on port 80 / 443 when HTTP / HTTPS is used for internal communication.

### How can I change the root directory of the Project Navigator? <a href="#how-can-i-change-the-root-directory-of-the-project-navigator" id="how-can-i-change-the-root-directory-of-the-project-navigator"></a>

Modify the content of the file mytests.dat inside the installation directory. Then restart ZebraTester and clear all cookies of your web browser.

Hint: the root directory of the Project Navigator can also point to a directory of a file share in order that several users of the ZebraTester product have access to the same data.

### How can I change the default time zone? <a href="#how-can-i-change-the-default-time-zone" id="how-can-i-change-the-default-time-zone"></a>

Modify the content of the file prxsniff.dat inside the installation directory. Then restart ZebraTester and clear all cookies of your web browser.

### Why I get the error "AWS Error Message: Request has expired" when trying to access the Amazon EC2 Service from the ZebraTester GUI? <a href="#why-i-get-the-error-aws-error-message-request-has-expired-when-trying-to-access-the-amazon-ec2-servi" id="why-i-get-the-error-aws-error-message-request-has-expired-when-trying-to-access-the-amazon-ec2-servi"></a>

Please check the system clock on your computer. The date sent from your local computer must be within 15 minutes of the Amazon clock or you will get an error like this.

### How to remove ZebraTester completely from a computer? <a href="#how-to-remove-zebratester-completely-from-a-computer" id="how-to-remove-zebratester-completely-from-a-computer"></a>

If you have installed ZebraTester by using an installation kit, please call first the corresponding uninstall utility. However, the uninstall utility does not delete your license data and it does also not delete your load test programs and your load test results. After running the uninstall utility, you have to also delete the ZebraTester installation directory manually in order that everything is uninstalled.

***

## Recording and Post-Processing of Web Surfing Sessions <a href="#recording-and-post-processing-of-web-surfing-sessions" id="recording-and-post-processing-of-web-surfing-sessions"></a>

### Is it possible to open two scripts at the same time? <a href="#is-it-possible-to-open-two-scripts-at-the-same-time" id="is-it-possible-to-open-two-scripts-at-the-same-time"></a>

It is possible to open two scripts at the same time starting from [ZebraTester version 7.5A](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/2078801921). Simply open the ZebraTester GUI (127.0.0.1:7990) in two separate tabs, open one script in the first tab via Project Navigator, and open the second script in the second tab.

### Which web browser products are supported for the recording of web surfing sessions? <a href="#which-web-browser-products-are-supported-for-the-recording-of-web-surfing-sessions" id="which-web-browser-products-are-supported-for-the-recording-of-web-surfing-sessions"></a>

Every web browser product is supported (Microsoft Internet Explorer, Firefox, Safari, ..). For a recording of a web surfing session, you have only to modify the Proxy Settings of your web browser. If you are using Firefox you can also install our Firefox Add-On named "Recording Extension" which allows you to record web surfing sessions in a more convenient way.

### Which web browser products can be emulated during a load test? <a href="#which-web-browser-products-can-be-emulated-during-a-load-test" id="which-web-browser-products-can-be-emulated-during-a-load-test"></a>

In our opinion, this is the wrong question. In the opposite way to many other products - ZebraTester emulates during a load test exactly the traffic of the web browser product with which one the web session has been recorded. So if you use for example a German Mozilla V1.0 web browser for recording, a German Mozilla V1.0 web browser is emulated during the load test - with all of its specific traffic. This may be a big benefit if the webserver delivers browser-specific content. Many other products are only able to record web surfing sessions with a modified Microsoft browser which is not the same. Please note that altering only the HTTP header field "User-Agent" (this is what they do) for emulating another web browser does not the same because the internal behavior will be still based on the Microsoft browser engine.

### What kinds of data are captured during the recording of a web surfing session? <a href="#what-kinds-of-data-are-captured-during-the-recording-of-a-web-surfing-session" id="what-kinds-of-data-are-captured-during-the-recording-of-a-web-surfing-session"></a>

Completely all data which are exchanged between the web browser and the webserver(s), inclusive exchanged data released by JavaScript code and AJAX and released by Pop-Up windows.

### Is it possible to record a web surfing session over several web servers? <a href="#is-it-possible-to-record-a-web-surfing-session-over-several-web-servers" id="is-it-possible-to-record-a-web-surfing-session-over-several-web-servers"></a>

Yes. However, for testing web portals, it might be a good idea to strip off advertising banners from external servers by using the filter of the Web Admin GUI or by deleting individual URL calls.

### Why does the web browser display a security warning during the recording of a web surfing session for an SSL-encrypted website (HTTPS)? <a href="#why-does-the-web-browser-display-a-security-warning-during-the-recording-of-a-web-surfing-session-fo" id="why-does-the-web-browser-display-a-security-warning-during-the-recording-of-a-web-surfing-session-fo"></a>

If you record encrypted HTTPS data with ZebraTester, the web browser will display a security alert. This is "normal" behavior when - and only when - using ZebraTester because the integrated SSL tunnel will decrypt the data (for recording), and will generate on-the-fly a faked and invalid server certificate.

It's **strongly recommended** to create your own trusted root certificate for ZebraTester to use to prevent this from happening. How to do this is described in the ZebraTester Installation Guide.

The format of this warning message depends on the web browser you are using. To continue recording, you can click one or more times through to the "Continue", "Ignore" or "Confirm Security Exception" button.

Note: Never ignore these kinds of error messages when not recording web sessions with ZebraTester; that is, during normal web surfing. The apparent secure connection to the webserver may actually be insecure and might be wiretapped or modified by cyber-criminals in this situation.

### Are session cookies supported? <a href="#are-session-cookies-supported" id="are-session-cookies-supported"></a>

Yes (no special configuration is needed).

### How can I handle session-specific parameters which are exchanged as CGI or as form values? <a href="#how-can-i-handle-session-specific-parameters-which-are-exchanged-as-cgi-or-as-form-values" id="how-can-i-handle-session-specific-parameters-which-are-exchanged-as-cgi-or-as-form-values"></a>

The GUI based "Variable Finder" and "Variable Handler" menus support to extract session-specific parameters from HTTP header fields, from HTML forms, from hyperlinks, from XML and SOAP data, from JSON data, and by using an integrated GUI based parser from any response content. The assignment of such extracted values to succeeding URL calls happens automatically. Please take a look at this example. Further information is provided in the "Users Guide".

### How can I assign to each simulated user an own username and password during the execution of a load test? <a href="#how-can-i-assign-to-each-simulated-user-an-own-username-and-password-during-the-execution-of-a-load" id="how-can-i-assign-to-each-simulated-user-an-own-username-and-password-during-the-execution-of-a-load"></a>

You have to define an "Input File". Please take a look at this example - and please read the corresponding chapter about Input Files in the "Users Guide".

### How can I achieve that some of the simulated users are executing only parts of a web surfing session? <a href="#how-can-i-achieve-that-some-of-the-simulated-users-are-executing-only-parts-of-a-web-surfing-session" id="how-can-i-achieve-that-some-of-the-simulated-users-are-executing-only-parts-of-a-web-surfing-session"></a>

You have to define "Inner Loops" which numbers of iterations are controlled by a variable. The value of such a variable can also be 0 (zero). A value of zero means that a simulated user does not execute (enter) the inner loop. This can be used in combination with an Input File whose file scope is "new line per user" or "new line per loop" and whose lines contain values of zero and one which is assigned to the variables of the iterations; that is, some of the users skip parts of the recorded web surfing session during the load test.

***

## Load Test Execution <a href="#load-test-execution" id="load-test-execution"></a>

### What can I do if my generated load test program does not work? <a href="#what-can-i-do-if-my-generated-load-test-program-does-not-work" id="what-can-i-do-if-my-generated-load-test-program-does-not-work"></a>

In many such cases the handling of "Dynamically-Exchanged Session Parameters" was not performed in the GUI. Please read this documentation Handling of "Dynamically-Exchanged Session Parameters" and perform the suggested tasks. After that generate the load test program again and try to run your load test once more.

### I have recorded a web surfing session which uploads a file - But why does the load test fail? <a href="#i-have-recorded-a-web-surfing-session-which-uploads-a-file-but-why-does-the-load-test-fail" id="i-have-recorded-a-web-surfing-session-which-uploads-a-file-but-why-does-the-load-test-fail"></a>

The load test fails because the uploaded file has not been zipped together with the load test program. You have to copy the uploaded file also into the same "Project Navigator" directory, in which your load test program is located. After that, you have to ZIP the compiled class (\*.class file) of the load test program together with the uploaded file (and optionally together with your Input Files and Plug-Ins) to one ZIP archive by using the ZIP functionality inside the "Project Navigator". After that, you can start the load test by clicking on the Execute-Icon of the newly created ZIP archive.

### Is it possible to run in parallel several load test jobs that are based on different web surfing sessions? <a href="#is-it-possible-to-run-in-parallel-several-load-test-jobs-that-are-based-on-different-web-surfing-ses" id="is-it-possible-to-run-in-parallel-several-load-test-jobs-that-are-based-on-different-web-surfing-ses"></a>

Yes, this is fully supported. The GUI only 'transfers' a load test job to a local or to a remote Exec Agent (load generator), which allows you to execute an unlimited number of parallel load test jobs at the same time. Each Exec Agent is also able to execute several load test jobs at the same time. Nevertheless, the GUI can (but not must) hold a live network connection to each load test job which allows us to display real-time statistics. Closing a real-time statistic window will not interrupt a load test job.

### What is the maximum number of virtual users that can be reached by a load test? <a href="#what-is-the-maximum-number-of-virtual-users-that-can-be-reached-by-a-load-test" id="what-is-the-maximum-number-of-virtual-users-that-can-be-reached-by-a-load-test"></a>

The ZebraTester architecture supports executing high-end load tests with an in reality an unlimited number of virtual users. All product components are fully multithreaded implemented. However, the underlying operating system of a single Exec Agent (load injector) can be overloaded if too many concurrent virtual users are executed by the same system. In most common cases of overload, the CPU(s) of an Exec Agent is always nearly 100% used and the measured response times are in such a case not valid because the measuring system by itself is overloaded.

ZebraTester supports therefore to combine an unlimited number of Exec Agents to a cluster so that an unlimited number of virtual users can be reached - or in other words, the maximum number of virtual users is only limited by the power and the number of the Exec Agents. ZebraTester supports to execute cluster jobs in an absolutely transparent way and merges automatically the measured results of the corresponding Exec Agents to a united load test result. Several cluster jobs can run in parallel, by using the same or a different collection of Exec Agents. Exec Agent Clusters can be composed by using a mixed collection of local and remote Windows and Unix-like systems.

### Why I can't use my Windows workstation to generate a realistic load? <a href="#why-i-cant-use-my-windows-workstation-to-generate-a-realistic-load" id="why-i-cant-use-my-windows-workstation-to-generate-a-realistic-load"></a>

Normally, the anti-virus scanner of your Windows workstation intercepts all HTTP(S) connections but is not capable to scan the network traffic during a load test when hundreds of web users are simulated. As a result of this, you will measure wrong response times and nonexistent network problems.

Therefore we strongly recommend that you operate the load generators on Unix-Like systems. The scalable and operating system independent architecture of ZebraTester allows you to run the ZebraTester GUI on any operating system (including Windows) and to use from these GUI load generators which are installed on any other operating system. The most normal case is that the GUI is installed on one or several Windows workstations, but that the load generators are installed on Unix-like systems.

As a further alternative, you can also use your Windows workstation or dedicated Windows servers as load generators - but only in case if you are permitted to disable the anti-virus scanner in such a way that no HTTP(S) connections are scanned.

### What should be measured? <a href="#what-should-be-measured" id="what-should-be-measured"></a>

We recommend, that you record a web surfing session which covers the key menus (most used menus) of the web application and that you execute the same load test several times by using a different number of concurrent users for each test-run (1, 2, 5, 10, 20, 50, 100, 200 …). After that, a graphical comparison of the measured results can be done (so-called "Load Curves") which will give you an excellent overview of the stability and the maximal capacity of the web application.

You should also have a closer look at the response times per web page and within a page to the response time per URL to isolate the top-time consuming URLs. If you encounter big differences between the URL response times - which are more or less size-independent - you have found valuable candidates for a server-sided tuning.

You will obtain a lot of additional information by examining the detailed results of each test-run. Up to 19 different diagrams and statistics are available. Example - composition of slowest URL calls:

To detect memory and resource leaks at the server side we recommend that you additionally perform an endurance test over a couple of hours by using a moderate number of concurrent users.

### How can I easily determine if the network is the reason for slow response times? <a href="#how-can-i-easily-determine-if-the-network-is-the-reason-for-slow-response-times" id="how-can-i-easily-determine-if-the-network-is-the-reason-for-slow-response-times"></a>

Whatever somebody is trying to tell you - the network throughput is commonly not the reason for slow response times. We suggest that you compare the response time of a bigger static image ore a style sheet with the response time of a server-side generated HTML page which has approximately the same size. For example: if an image of 20 kBytes size has been received within 200 Milliseconds, but a server-side generated HTML page with a size of 30 kBytes takes 5 Seconds, the network is definitively not the reason that the server-side generated HTML page has a slow response time. There must be another reason which is outside the network, commonly found inside the webserver.

### What can be done if embedded images are slowly displayed? <a href="#what-can-be-done-if-embedded-images-are-slowly-displayed" id="what-can-be-done-if-embedded-images-are-slowly-displayed"></a>

If the text of a web page is received within a moderate response time, but the embedded images are displayed slowly bit by bit, it might be that the keep-alive option has been disabled at server-side or a downgrade to the older HTTP protocol version 1.0 is forced by the web server - instead of using the newer HTTP protocol version 1.1. You can check this by selecting the "HTTP Keep-Alive Efficiency" diagram on the result details menu of a test-run.

If the rate of the "Successful Recycled Network Connections" is less than 70% - or if only "New Created Network Connections" have been measured, the webserver is wrong configured and you should try to enable its keep-alive option. Thereafter you should measure the webserver again to check if it performs better. We recommend that the keep-alive timeout is configured within a range of 7-15 Seconds.

### If a response timeout is measured - or when slow response times are measured: How can I determine exactly if this is a network problem or because if the web application responds too slowly? <a href="#if-a-response-timeout-is-measured-or-when-slow-response-times-are-measured-how-can-i-determine-exact" id="if-a-response-timeout-is-measured-or-when-slow-response-times-are-measured-how-can-i-determine-exact"></a>

During the execution of each HTTP(S) request the "internal processing states" of the HTTP(S) request are also captured by ZebraTester. In case of a response timeout - or when slow response times are measured - such an error is only a network problem (firewall, rooter, insufficient network throughput, loss of TCP/IP packets) if the error occurs at the internal HTTP(S) processing states "Open Network Connection", or "Receive HTTP Header", or "Receive Content".

If a response timeout or slow response times are measured at the HTTP(S) processing state "Wait for Server Response" the error occurred because the web application responds too slowly (the most normal case).

The following "internal processing states" of each HTTP(S) request are measured by ZebraTester.

The time elapsed in milliseconds for some states is also captured by ZebraTester if no error occurs - for each successful executed HTTP(S) request.

### What's the error type "Network Error at Client Side"? <a href="#whats-the-error-type-network-error-at-client-side" id="whats-the-error-type-network-error-at-client-side"></a>

You are out of free client sockets (free network connections) on your load generator (Exec Agent) and you have to tune the TCP/IP configuration of the operating system on the load generator. This may happen especially on Windows systems - or if the load test uses the older HTTP V1.0 protocol - or when the web application server does not support "keep-alive" and therefore network connections can not be reused or recycled. This may also happen if the web application performs very well and therefore the load initiating system is using a lot of new network connections within a short time.

Action: add the following new entries with Regedit on your load initiating system. Afterward, you must reboot the system.

`\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters`

[Microsoft Knowledge Base Article - 120642](https://support2.microsoft.com/default.aspx?scid=kb;EN-US;120642)

[Microsoft Knowledge Base Article - 314053](https://support2.microsoft.com/default.aspx?scid=kb;en-us;314053\&Product=winxp)

In addition, we recommend that you execute the following command from a terminal window: netsh int ipv4 set dynamicport tcp start=12288 num=53247

UNIX-like Systems

This problem usually does not occur on Unix-like systems: you can check with `ulimit -n` the number of maximally available file and network connections per process. Increasing this value can be done with `ulimit -n`. Example (recommended value): `ulimit -n 16384`. This has to be done before a ZebraTester Exec Agent process is started.
