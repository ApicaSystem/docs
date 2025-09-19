# Understanding ASM Check Host Locations

The Apica Testing network is based on more than 50 co-locations around the world. These contain a both physical and hybrid cloud-based testing data clusters.

When setting up a check, it is assigned one or more locations, which will act as points of origin. This provides an easy way of providing a comprehensive monitoring solution.

If you assign a check to one location during check creation, one copy of the check will be created. If you assign a check to multiple locations during check creation, multiple copies of the check will be created - one copy for each location selected during check creation. One check cannot run from multiple locations.

## Tiers <a href="#understandingasmcheckhostlocations-tiers" id="understandingasmcheckhostlocations-tiers"></a>



### Agent Tiers <a href="#understandingasmcheckhostlocations-agenttiers" id="understandingasmcheckhostlocations-agenttiers"></a>

Apica locations are classified into various **Tiers** according to reliability and scalability.

#### Tier classification <a href="#understandingasmcheckhostlocations-tierclassification" id="understandingasmcheckhostlocations-tierclassification"></a>

| **Tier**                 | **Type**                                         | **Description**                                                                                                                                                                                                                  |
| ------------------------ | ------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **NG (Next Generation)** | High Availability                                | No single point of failure. The location is covered by more than one client and all clients can take over for each other. Jobs are sent to any of the available clients. The number of clients will scale depending on the load. |
|  **Tier 1+**             |  Apica Certified High Availability Cluster Setup |  World-wide main locations where scalability, performance, and high-availability are guaranteed.                                                                                                                                 |
|  **Tier 1**              |  Apica Certified Multi-Server Setup              |  Multi-server site with on-site failover capability.                                                                                                                                                                             |
|  **Tier 2**              |  Apica Generic Setup                             |  A site with off-site failover capability.                                                                                                                                                                                       |
|  **Tier 3**              |  Apica Basic Performance Setup                   |  The setup is in a location that can have variable performance.                                                                                                                                                                  |

A location that is classed as a Tier 3 is usually running in a country with less reliable infrastructure and performance, while Tier 1+ ensures the quality & scalability out of the location.

The tiers can be used to intentionally monitor the performance of your service from corresponding regions.

## Failover <a href="#understandingasmcheckhostlocations-failover" id="understandingasmcheckhostlocations-failover"></a>

In some instances a primary location may nor be working. When that happens, a secondary location may be used as failover.

### Failover Functionality <a href="#understandingasmcheckhostlocations-failoverfunctionality" id="understandingasmcheckhostlocations-failoverfunctionality"></a>

The failover location can be enabled for each individual check.

When the primary location is unavailable or unable to connect to the monitored service, a secondary location is automatically selected and used instead.

The secondary location will reside in the same geographical region and have the same priority, but the exact location is determined at run time.

## Public IP Location List <a href="#understandingasmcheckhostlocations-publiciplocationlist" id="understandingasmcheckhostlocations-publiciplocationlist"></a>

Use the following lists for whitelisting purposes to ensure Apica public locations are accessible from within your network.

* [Complete List of Apica Agent IP Addresses (HTML)](https://s3.eu-central-1.amazonaws.com/apica-ip-addresses/asm-agent-ips.html)
* [Complete List of Apica Agent IP Addresses (JSON)](https://apica-ip-addresses.s3.eu-central-1.amazonaws.com/asm-agent-ips.json)

If you are granting an Apica resource access to your application, they will be accessing your network from the IP ranges `194.213.118.0/24` and `194.213.119.0/24`. As such, please allow access to the application or server in question from those IP ranges.
