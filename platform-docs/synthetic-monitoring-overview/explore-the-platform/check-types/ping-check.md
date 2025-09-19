# Ping Check

Ping sends an ICMP echo packet (PING) to the host with an expected return.

#### Check info section <a href="#pingcheck-checkinfosection" id="pingcheck-checkinfosection"></a>



#### Check Result <a href="#pingcheck-checkresult" id="pingcheck-checkresult"></a>



## Configuration <a href="#pingcheck-configuration" id="pingcheck-configuration"></a>

The **Edit Configuration** view allows you to modify all available settings for a check.

1. In the **Verify Connection** section, you find configurations for verification of the site or check result.

\




| **Option**  | **Description**                                                                                                                  |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Verify Ping | List of hostnames to [ping](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/4632267/P+Ping) to after a `failed` result. |

2\. The **Execution Behavior** section defines how the check will be run.



| **Item**        | **Description**                                                                                            | **Comment**                                                                    |
| --------------- | ---------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| Location        | Location to run the test from.                                                                             | <p><br></p>                                                                    |
| Enable Failover | Use [failover](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/4631916/F+Failover) for the check. | <p><br></p>                                                                    |
| Frequency       | The time between data retrieval.                                                                           | If set to `manual`, the check is only run on demand.                           |
| Max Attempts    | The number of attempts for the check run.                                                                  | This setting applies to the primary location only, not any failover locations. |
| Attempt Pause   | The delay between attempts.                                                                                | <p><br></p>                                                                    |

\
3\. Groups

In the **Groups** section, selected and available [Monitor Groups](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/31195297/Monitor+Groups) are shown.



[Monitor Groups](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/4632483/Monitor+Groups)

Monitor groups are a way of organizing checks into manageable groupings or thematic units.

Monitoring groups are used in the Dashboard to organize checks in separate display widgets and lists, and in the Manage view to structure checks for a better overview.

You can have as many groups as you like, and any check can be a member of any number of groups.

**Top-Level Groups**

The **Top-Level Group**s are the main organizing level. They can contain any number of **Subgroup**s.

**Subgroups**

Subgroups provide a slightly more fine-grained organization and ar placed inside Top-Level Groups.

Subgroups are at the lowest level and cannot contain other subgroups.

**Access**

Users can have access to monitor groups either as either a co-owner or as a user (non-co-owner).

The **Information** section contains general information about the check.

### Configuration <a href="#pingcheck-configuration.1" id="pingcheck-configuration.1"></a>



| **Item**    | **Description**                         |
| ----------- | --------------------------------------- |
| Name        | Name of the check for display purposes. |
| URL         | URL to access.                          |
| Description | A longer description of the check.      |
| Enabled     | Turn check on or off.                   |

\
