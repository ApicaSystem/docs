# Exec Agents

## Configuring Additional Load-Releasing Systems (Exec Agents) <a href="#execagents-configuringadditionalload-releasingsystems-execagents" id="execagents-configuringadditionalload-releasingsystems-execagents"></a>

Additional load-releasing systems can be added by using the **Network** menu, which can be invoked from the Project Navigator:



In the upper left part of the Window, a list of currently defined Exec Agents is shown. The Exec Agent configuration can be changed by clicking on the corresponding icon. In the lower part of the window, additional Exec Agents can be defined, and/or existing Exec Agents can be modified. You must click the **Refresh** button in the right upper corner of the windows to add several Exec Agents.

Exec Agent Icons:



**Select**: selects an Exec Agent. Thereafter you may modify its configuration.

**Delete**: removes an Exec Agent from the configuration.

**Test**: Test the network connection to an Exec Agent - used to verify and debug the access to the Exec Agent.\
**Duplicate Exec Agent**: duplicates the definition of an Exec Agent.\
**Upload or Delete Exec Agent License Ticket**: allows to upload a License Ticket to an Exec Agent or remove an already uploaded License Ticket from an Exec Agent. Using this functionality\
requires special license tickets: further information.\
**Protect Access to Exec Agent**: reconfigures an Exec Agent remotely so that other persons cannot access it. Or - if access protection has already been configured - the access protection can also be removed (in case if you know the actual user name and password of the Exec Agent).



### **Form Input Fields - Exec Agent:** <a href="#execagents-forminputfields-execagent" id="execagents-forminputfields-execagent"></a>

* **Description:** arbitrary name of the Exec Agent. The option list on the menu Execute Load Test and [Jobs](http://127.0.0.1:7990/dfischer/webadmininterface/htdocs/helpProjectNavigatorJobs.html) will display this name.
* **Host:** TCP/IP address or DNS Hostname of the Exec Agent
* **Port:** TCP/IP server port of the Exec Agent
* **Protocol:** network protocol, applied for the internal communication from the Web Admin GUI to the Exec Agent:
  * **plain:** raw TCP/IP connection, using an outbound proxy is not supported.
  * **HTTP:** embeds the communication inside the HTTP protocol.
  * **HTTPS:** embeds the communication inside the encrypted HTTPS protocol.
* **Username:** username for protected Exec Agents
* **Password:** password for protected Exec Agents

### **Form Input Fields - Outbound HTTP/S Proxy Server:** <a href="#execagents-forminputfields-outboundhttp-sproxyserver" id="execagents-forminputfields-outboundhttp-sproxyserver"></a>

Please leave all of these fields blank if you do not use an outbound proxy server.

* **Proxy Host:** TCP/IP address or DNS Hostname of the outbound proxy
* **Proxy Port:** TCP/IP port number of the outbound proxy
* **Proxy Username:** username for authentication on the outbound proxy (maybe optional)
* **Proxy Password:** password for authentication on the outbound proxy (maybe optional)

### Testing the Agent <a href="#execagents-testingtheagent" id="execagents-testingtheagent"></a>

You can test the configuration and the accessibility of an Exec Agent by clicking the Test Network Connection to Exec Agent **button** within the list of Exec Agents (a functional “ping” of the Exec Agent):



***

### Executing with the Agent <a href="#execagents-executingwiththeagent" id="execagents-executingwiththeagent"></a>

Once an Exec Agent has successfully installed and started on a remote system, it can be used transparently by selecting it as load test executing host (input field: Execute Test from) in the [Execute Load Test](http://127.0.0.1:7990/dfischer/webadmininterface/htdocs/helpProjectNavigatorExecuteLoadTest.html) menu.

