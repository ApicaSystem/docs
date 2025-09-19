# More Tips for Executing Load Tests

Please note that the underlying operating system of a single Exec Agent (load injector) can be overloaded if too many concurrent (virtual) users are executed there.

In most cases where a system is overloaded, the CPU(s) of the Exec Agent will be constantly at nearly 100% used. In these cases, the measured response times will not be valid **because the measuring system itself is overloaded**.

We recommend that you monitor the CPU consumption of the Exec Agent during the load test and that you use an **Exec Agent** [**Cluster**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620499/Clusters), instead of a single Exec Agent when a single system does not have the necessary CPU resources to properly generate the load. The CPU consumption of the load-releasing system depends on the number of users (more users

Furthermore, we recommend that you tune the TCP/IP parameters of load releasing systems.
