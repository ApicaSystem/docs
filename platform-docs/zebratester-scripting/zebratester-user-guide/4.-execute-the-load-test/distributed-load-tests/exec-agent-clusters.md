# Exec Agent Clusters

Note: this menu can be called from the [Project Navigator](http://127.0.0.1:7990/dfischer/webadmininterface/htdocs/helpProjectNavigator.html).

Several [Exec Agents](http://127.0.0.1:7990/dfischer/webadmininterface/htdocs/helpExecAgentConfig.html) can be combined to a virtual Exec Agent Cluster, which allows executing very strong load tests with an unlimited number of concurrent users. (Such functionality is often called by other load test products as multiple "load-injectors").



Once an Exec Agent Cluster has been defined, the handling of such a cluster is from the user's perspective absolutely transparent - like the job would be only started from a single Exec Agent. But in fact, the Exec Agent Cluster enables to split and distribute a single test over an unlimited number of Exec Agents. Each Exec Agent will execute only a part of the load test. Thereafter, when the cluster job has been completed, the results of all corresponding Exec Agents (cluster members) are merged automatically to one united result.

The distribution of the load per Exec Agent (distribution of concurrent users) can be indirectly controlled over the **load factor** which should represent the capacity/power of the Exec Agent computer. By clicking on the magnifier icon, you can manually modify the load factor - or alternatively apply a suggested value, based on a short internal performance test of the Exec Agent itself.

## **Functional Overview:** <a href="#execagentclusters-functionaloverview" id="execagentclusters-functionaloverview"></a>



* A (single) load test job can be executed as a "cluster job". This will split the test over several Exec Agents
* Cluster jobs are splitting virtual users - depending on the capability of the Exec Agents (load factor)
* Input files can be spitted - depending on the number of virtual users per Exec Agent
* The same cluster job can run over a mixed collection of Windows and Unix systems
* The (cluster) load test result data are automatically merged to a united result
* The united result data can be expanded to examine the individual result of each cluster member (Exec Agent)
* Running the Web Admin GUI and the Cluster Job Controller is not required during the load test execution
* Live statistics overall cluster members and detailed statistics for\
  each cluster member can be displayed during the load test execution
* Several cluster jobs (over the same or different clusters) can run concurrently at the same time

***

Once an Exec Agent Cluster has defined, it can be used transparently by selecting it as a load test executing source (input field "Execute Test from") on the Execute Load Test menu.



## Configuring Load-Releasing Clusters <a href="#execagentclusters-configuringload-releasingclusters" id="execagentclusters-configuringload-releasingclusters"></a>

| <p>If several Exec Agents have been defined, they can be combined to form a load-releasing cluster. You can also define more than one cluster by using some of the same Exec Agents in several different clusters.</p><p>After an arbitrary name of the cluster has been entered, the cluster members (Exec Agents) can be added to the cluster by clicking on the grey arrows in the list of <strong>Available Exec Agents</strong>.</p>                                                                                                                              | <p></p><p>In the above screenshot, we’ve clicked on the magnifier icon to show the Cluster 1 has two members, Sun Fire V240 and Test PC II. The Local Exec Agent is available to add to Cluster 1 by clicking on the grey area next to the Agent name.</p> |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| To get a suggestion for the load factor of a particular Exec Agent, you can click on the icon within the list of all defined Exec Agents. It is, however, recommended that you click several times on the icon in order to get a stable result. Even so, this result may not accurately reflect the power of the computer system.                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                            |
| By clicking on the magnifier icon of a cluster member, the Load Factor of this member can be modified. The **load factor** controls how many users will be assigned to this cluster member when the load test is distributed across the cluster members. The load factor by itself is an abstract value, meaning that the distribution of the users is made based on the ratio between the load factors. If you mix strong and weak systems within the same cluster, it is recommended that you give a higher load to the stronger systems than to the weaker systems. |                                                                                                                                                                                                                                                            |

**It is not necessary that all cluster members have the same operating system time.** Each time a cluster job is started, the cluster job controller automatically measures the time differences between the cluster members. These measured time differences will be automatically accounted for when the consolidated statistics data are merged.

### Starting Distributed Load Tests <a href="#execagentclusters-startingdistributedloadtests" id="execagentclusters-startingdistributedloadtests"></a>

If additional Exec Agents and/or clusters have been defined, you can select - when starting the test run - from which system or cluster the load test is to be released (input field: **Execute Test from**). The succeeding steps inside the Web Admin GUI are then the same as for executing the load test locally.

