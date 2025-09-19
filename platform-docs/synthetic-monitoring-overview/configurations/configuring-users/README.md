# Configuring Users

The **User** section provides access to account information and allows you to define account settings.

## Managing Your User <a href="#configuringusers-managingyouruser" id="configuringusers-managingyouruser"></a>



The **Settings** view provides access to settings for your user account.



### Configuring Your User Settings <a href="#configuringusers-configuringyourusersettings" id="configuringusers-configuringyourusersettings"></a>

The **Account Details** frame shows your Company Name and its contact information. All fields are plain text fields.



You can change your password from the Change Password window.



Regional details include your preference of Regional Setting (time and date format) and Timezone.



### Viewing Subscription Details <a href="#configuringusers-viewingsubscriptiondetails" id="configuringusers-viewingsubscriptiondetails"></a>

The **Subscription** view shows information regarding your account subscription.



**Quota**

The quota part displays information on about how many of various check types you are currently using, and what your subscription limit is for each type.



## Managing Other Users <a href="#configuringusers-managingotherusers" id="configuringusers-managingotherusers"></a>

Only users with the User Admin and Customer Admin roles are allowed to manage other users!

Within the “Manage Users” page, you will have the possibility to edit multiple details about Users you have the permissions to manage. For instance, you can use this page to assign different User Roles to users.



Clicking the Edit cog on the right of the row will open the **User Details** screen and show information about the user.



| **Item**           | **Description**                                     |
| ------------------ | --------------------------------------------------- |
| **Login/Username** | Unique system ID for the account.                   |
| Full Name          | The complete user’s name assigned to the account.   |
| Email              |                                                     |
| Phone              |                                                     |
| Mobile             |                                                     |
| Approved?          | Checked means the User is approved to use ASM       |
| Locked out?        | Checked means the User is locked out from using ASM |
| Regional Setting   | Select the region for this user                     |
| Roles              | List of roles assigned to the account.              |

### Understanding Basic User Roles <a href="#configuringusers-understandingbasicuserroles" id="configuringusers-understandingbasicuserroles"></a>

The user roles in Synthetic Monitoring provide different levels of access to the system. A user may have multiple roles assigned to their account.



Refer to this table for more details about permissions:

| Role                     | Permissions                                                                                                                                                          | Comment                                                       |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
|  `Alert Admin`           |  Manage recipients, manage alerts for checks                                                                                                                         |                                                               |
| `Alert Editor`           | Manage alerts for checks                                                                                                                                             |                                                               |
| `Alert Recipient Editor` | Manage recipients                                                                                                                                                    |                                                               |
| `Check Admin`            | Manage checks                                                                                                                                                        |                                                               |
|  `Check Power User`      | Manage checks in groups delegated from administrators                                                                                                                |                                                               |
|  `Customer Admin`        | Admin of the account inside of ASM                                                                                                                                   | Allowed to manage Tags                                        |
|  `Impersonator`          | Impersonate as user                                                                                                                                                  | Also as sub-customers if available                            |
|  `Maintenance Admin`     | Access to the Maintenance functionality where SLA can be modified for checks                                                                                         |                                                               |
|  `Panel Editor`          | Create, edit and delete [Panels](http://confluence.teamsinspace.com:8090/display/ASMDOCS/Panels) in Synthetic Monitoring, and create, modify and edit all dashboards |                                                               |
|  `Partner`               | This is used for partner API actions through the API                                                                                                                 |  `GetCustomer`, `PostCustomer`, `PutSubscription`, `PostUser` |
|  `Report User`           | Access the report functions                                                                                                                                          |                                                               |
|  `User`                  |  Minimal permissions to view and execute checks                                                                                                                      |                                                               |
|  `User Admin`            |  Manage the users on the customer account                                                                                                                            |                                                               |
|  `Tag Manager`           | Manage Tags                                                                                                                                                          |                                                               |
|  `Scenario Admin`        | Can create, edit, and delete scenarios                                                                                                                               |                                                               |

### Understanding the "Check Power User" Role <a href="#configuringusers-understandingthe-checkpoweruser-role" id="configuringusers-understandingthe-checkpoweruser-role"></a>

ASM Administrators can assign users a special role called the “Check Power User” role. It provides the user enhanced, yet still limited, access to actions relating to check management. To assign access to the “Check Power User” role, navigate to “Manage > Power User” from the top level ASM toolbar:



The user will be brought to the “Manage Power Users” page:



The Check Power User role grants users specific administration permissions to work with checks within designated monitor groups. You can think of it as having sub-administrators with access to limited sets of checks.

This allows you to let users have limited access to actions to checks in particular montioring groups. For the normal user role, users either have full access, or none.

Which actions a Check Power User can perform is configurable, but may include:

* create checks
* enable/disable checks
* edit checks (set of fields or all fields)
* assign/unassign checks to/from groups
* delete checks

This allows the Check Power User can perform more administrative tasks than a regular user without having full administrator access.

#### Customer Administrator Access <a href="#configuringusers-customeradministratoraccess" id="configuringusers-customeradministratoraccess"></a>

Customer Administrators own monitor groups and checks (different Customer Administrators can be owners of different monitor groups). The Customer Administrators can assign Check Power Users by granting them access to selected monitor groups, either as a Co-Owner of the group, or as a group user with enhanced permissions.

#### Check Power User Access (owner or co-owner) <a href="#configuringusers-checkpoweruseraccess-ownerorco-owner" id="configuringusers-checkpoweruseraccess-ownerorco-owner"></a>

A user can be associated with a monitor group as either a `user` or as a `co-owner`. The available check types and editable properties depends on this association type.

A Check Power User can only access checks in the Monitor Groups which they have access to. If checks are later moved to a group where the Check Power User doesn't have access, those checks will not be available to the Check Power User.

#### API <a href="#configuringusers-api" id="configuringusers-api"></a>

The Check Power User role cannot use the API to create, edit, or delete checks and monitor groups.

#### Configuration <a href="#configuringusers-configuration" id="configuringusers-configuration"></a>

1: Users must have the Roles (Synthetic Monitoring User) role assigned to them.

This configuration applies to the the user, and is done in the Manage Users view.

2: Users must have **user** or **co-owner** access to the monitor groups the checks belong to.

This configuration applies to the the monitor group, and is done in Edit Users view.

3: The Check Power User has special configuration, defining which types of checks are available to the Check Power User role.

This configuration applies to the the Check Power User role for all users, and is configured in the Manage Power Users view.
