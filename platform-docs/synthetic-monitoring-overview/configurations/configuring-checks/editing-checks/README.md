# Editing Checks

You can edit a check after creating it by navigating to the “Edit Check” page, which can be found by clicking on a check to enter the Check Details and then clicking on the “Edit Check” button:



This article will review some of the more technical features of the Edit Check page. If a field is self-explanatory (for example, the “Name” field), it will not be included in the article. If a section is specific to only a certain check type, refer to this article’s child pages for that section! For example, you can only attach a Selenium scenario to a Browser check, so refer to [Editing Browser Checks](broken-reference) for instructions on how to upload and edit a Selenium script within ASM.

Almost every feature in the Edit Check section contains a tooltip which will give you more information pertaining to that feature!

### Cloning Checks <a href="#editingchecks-cloningchecks" id="editingchecks-cloningchecks"></a>

To clone a check, click the “Clone” button on the top right of the “Edit Check” page:



When you clone a check, all of the settings of the parent check are duplicated identically, with the exception of the check title. The copy is named “Copy of {check\_title}”, where {check\_title} is the check’s original title.

## Check Information <a href="#editingchecks-checkinformation" id="editingchecks-checkinformation"></a>

### Tags <a href="#editingchecks-tags" id="editingchecks-tags"></a>

Categorization and identification of checks can be done by adding tags. [Tags](broken-reference) are keys that can have multiple values, allowing for better context in results and management. For example, the key “Environment” could have values such as “Prod”, “Dev”, “Alpha”, “Beta”, letting you quickly identify checks running on different environments.

Tags can also be accessed through the API, which lets you perform more intelligent categorization in automated tasks and integrations.

#### Add Existing Tags to a Check <a href="#editingchecks-addexistingtagstoacheck" id="editingchecks-addexistingtagstoacheck"></a>

To add tags to a check, click into the Tags field:



A dropdown containing the available tags is shown:



Added tags are shown in the Tags field:



### Enabling and Disabling Checks <a href="#editingchecks-enablinganddisablingchecks" id="editingchecks-enablinganddisablingchecks"></a>

If you un-check the “Enabled” check box, the check will be “disabled”; it will not run and it will not be visible on the Dashboard. It is possible to enable/disable many checks at a time using the Bulk Edit feature.



## Execution Behavior <a href="#editingchecks-executionbehavior" id="editingchecks-executionbehavior"></a>



#### Location <a href="#editingchecks-location" id="editingchecks-location"></a>

ASM presents many potential options for check locations. You can select from multiple tiers of public agent locations (Tiers 1+ to Tier 3), which are hosted in our SaaS environment. You can also select private agents if your account has private agents installed for the check type you are editing. See the articleUnderstanding ASM Check Host Locations for more information on locations.

#### Enable Failover <a href="#editingchecks-enablefailover" id="editingchecks-enablefailover"></a>

When failover is enabled, the check will be executed from a second location if it fails. Before failover happens, the check is attempted from the primary location according to the number of max attempts in the “Max Attempts” box. Only one attempt will be made from the failover location.

Thus, if a check is specified to run with 3 attempts and failover is enabled, it will actually run four times - 3 times from the default location, and once from the failover location.

#### Frequency <a href="#editingchecks-frequency" id="editingchecks-frequency"></a>

This field defines the frequency at which your check will return results. Every check type has a different minimum frequency.

It is possible to configure lower minimum intervals for different check types on an account level. Configuring checks to run at a lower interval than the default options is generally a paid feature. Contact your TAM for more information.

#### Max Attempts <a href="#editingchecks-maxattempts" id="editingchecks-maxattempts"></a>

This field specifies the maximum number of attempts that will be made to pass the check before the check is assigned a Failure status (Error, Warning, or Fatal). This setting applies to primary location only, not any failover locations.

#### Attempt Pause <a href="#editingchecks-attemptpause" id="editingchecks-attemptpause"></a>

Between every attempt there will be an Attempt Pause before the next attempt is performed. Select “0ms” to disable attempt pause between attempts. Of course, if only 1 attempt is specified, Attempt Pause will not be applied to the check.

### Schedule <a href="#editingchecks-schedule" id="editingchecks-schedule"></a>

In the **Schedule** section you can define time periods where the check runs should deviate from the basic Config Execution setting.



| Item              | Description                                                      |   |
| ----------------- | ---------------------------------------------------------------- | - |
| Inclusion Periods | Time period(s) when the check will run at the defined frequency. |   |
| Exclusion Periods | Time period(s) when the check will not run.                      |   |

The periods are configured with semi-colon-separated strings which specify the date and time ranges:

```
PERIOD [ ; PERIOD ]
PERIOD ::= ( WEEK-DAY-LIST | MONTH-DAY-LIST | DATE-LIST ) : TIME-RANGE
WEEK-DAY-LIST ::= WEEK-DAY-SPEC [ , WEEK-DAY-LIST ]*
WEEK-DAY-SPEC ::= ( WEEK-DAY | WEEK-DAY-RANGE )
WEEK-DAY-RANGE ::= WEEK-DAY - WEEK-DAY
WEEK-DAY ::= ( mon | tue | wed | thu | fri | sat | sun )
MONTH-DAY-LIST ::= MONTH-DAY-SPEC [ , MONTH-DAY-LIST ]*
MONTH-DAY-SPEC ::= ( MONTH-DAY | MONTH-DAY-RANGE )
MONTH-DAY-RANGE::= MONTH-DAY - MONTH-DAY
MONTH-DAY ::= 0-31 (Note: Month day 0 means last day of month)
DATE-LIST ::= DATE-SPEC [ , DATE-LIST ]*
DATE-SPEC ::= ( DATE | DATE-RANGE )
DATE-RANGE ::= DATE - DATE
DATE ::= [yy]yy-mm-dd
TIME-RANGE ::= TIME-SPEC - TIME-SPEC
TIME-SPEC ::= hh[:mm[:ss]]
```

For example:

```
mon-fri:21:30-22; sun:15-17; 0-1:12-18; 2018-04-01-2018-04-30:18-23
```

|                                | Section                                                    | Description |
| ------------------------------ | ---------------------------------------------------------- | ----------- |
|  `mon-fri:21:30-22`            |  Every monday to friday between 21:30 and 22:00            |             |
|  `sun:15-17`                   | Sundays between 15:00 and 17:00                            |             |
|  `0-1:12-18`                   |  The last and first day of each month, between noon and 18 |             |
|  `2018-04-01-2018-04-30:18-23` |  Between 18:00 and 23:00 on each day of April 2018         |             |

**Note:** The `;` separator is needed between periods, but not at the end.

The “Time Zone” specified in the Schedule section corresponds to the time zone of the exclusion periods. If you would like to configure a check to stop running on Sundays between 15:00 and 17:00 PDT, set the Time Zone to “(UTC - 8:00) Pacific Time (US & Canada)” and enter the syntax `sun:15-17` into the Exclusion Period box.

### Groups <a href="#editingchecks-groups" id="editingchecks-groups"></a>

Placing your check in a check Group will make it easier to access. In the Groups section, selected and available Monitor Groups are shown:



**Monitor Groups** are a way of organizing checks into manageable groupings or thematic units. They are used in the Dashboard to organize checks in separate display widgets and lists, and in the [Manage view](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2159149140/Manage+Checks#Managing-Monitor-Groups), to structure checks for a better overview. You can have as many groups as you would like, and any check can be a member of any number of groups.

**Top-Level Groups** are at the main organization level. They can contain any number of Subgroups.

**Subgroups** provide a slightly more fine-grained organization and are placed inside Top-Level Groups. They are at the lowest level and cannot contain other subgroups.

Users can have access to monitor groups either as either a co-owner or as a user (non-co-owner). Co-owners of a monitor group can add other users to that group.
