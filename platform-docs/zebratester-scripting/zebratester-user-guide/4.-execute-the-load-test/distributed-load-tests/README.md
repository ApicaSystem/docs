# Distributed Load Tests

Load tests can also be transmitted and started on **remote computers**. Similarly, a “single” load test can be divided up and run on several computers, in which case the load-releasing computers are combined into a "virtual" **application cluster**.

### Architecture and Configuration <a href="#distributedloadtests-architectureandconfiguration" id="distributedloadtests-architectureandconfiguration"></a>

The configuration is very simple and only requires that an **Exec Agent** process be installed on the involved load-releasing systems. This is implied in the case where the product has been installed and started on several computers, as each system already will contain an Exec Agent. Alternatively, **individual Exec Agent processes can be installed separately as a Windows service and/or a Unix daemon** (see the Application Reference Manual).

The communication between the Web Admin GUI and the remote Exec Agent processes usually uses raw TCP/IP network connections to port 7993; however, this port number can be freely chosen if the Exec Agent process is installed separately. The communication can also be made over HTTP or HTTPS connections (tunneling), and also supports outbound HTTP/S proxy servers. The support of outbound HTTP/S proxy server means, in this case, that tests can be started from a protected corporate network and then transmitted, over the proxy server of the corporation, to any load releasing system on the internet - all without the need for ordering new firewall rules.

The computers of a load-releasing cluster (the cluster members) may also be heterogeneous; that is, Windows and Unix systems, as well as strong and weak systems, can be mixed within the same cluster. The individual cluster members can be placed in different locations, and can also use different protocols to communicate with the Web Admin GUI (or rather with the local cluster job controller).



\


\
