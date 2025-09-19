---
description: >-
  There are a set of policy and permissions that are defined by Apica. Find the
  below list of Apica defined permissions highlighting the function of each and
  what action they allow.
---

# Apica defined permissions

**Dashboards**

**Policy:** `manage_dashboards`

Allows creating, editing, deleting, and viewing dashboards within the system.

| Permission         | Resource   | Action | Description              |
| ------------------ | ---------- | ------ | ------------------------ |
| get\_dashboards    | dashboards | read   | View dashboards          |
| create\_dashboards | dashboards | create | Create new dashboards    |
| edit\_dashboards   | dashboards | update | Edit existing dashboards |
| delete\_dashboards | dashboards | delete | Delete dashboards        |

#### Dashboards (Default)

**Policy:** `manage_dashboards_default`

Grants limited default access to viewing and creating dashboards, usually for non-admin roles.

| Permission         | Resource   | Action | Description           |
| ------------------ | ---------- | ------ | --------------------- |
| get\_dashboards    | dashboards | read   | View dashboards       |
| create\_dashboards | dashboards | create | Create new dashboards |

#### Queries

**Policy:** `manage_queries`

Allows users to create, edit, execute, and delete queries within the system. Typically granted to analysts or developers who work directly with data.

| Permission       | Resource | Action  | Description           |
| ---------------- | -------- | ------- | --------------------- |
| create\_queries  | queries  | create  | Create new queries    |
| edit\_queries    | queries  | update  | Edit existing queries |
| execute\_queries | queries  | execute | Run/execute queries   |
| delete\_queries  | queries  | delete  | Delete queries        |
| get\_queries     | queries  | read    | View or list queries  |

#### Queries (Default)

**Policy:** `manage_queries_default`

Provides limited default access to create, edit, execute, and view queries. Usually assigned to standard users.

| Permission       | Resource | Action  | Description           |
| ---------------- | -------- | ------- | --------------------- |
| create\_queries  | queries  | create  | Create new queries    |
| edit\_queries    | queries  | update  | Edit existing queries |
| execute\_queries | queries  | execute | Run/execute queries   |
| get\_queries     | queries  | read    | View or list queries  |

#### Users

**Policy:** `manage_users`

Allows administrators to create, update, disable, delete, and view user accounts.

| Permission     | Resource | Action  | Description            |
| -------------- | -------- | ------- | ---------------------- |
| get\_users     | users    | read    | View user accounts     |
| create\_users  | users    | create  | Create new users       |
| edit\_users    | users    | update  | Edit user details      |
| disable\_users | users    | disable | Disable existing users |
| delete\_users  | users    | delete  | Delete user accounts   |

#### Users (Default)

**Policy:** `manage_users_default`

Provides read-only access to user accounts for non-admin roles.

| Permission | Resource | Action | Description        |
| ---------- | -------- | ------ | ------------------ |
| get\_users | users    | read   | View user accounts |

#### Settings

**Policy:** `manage_settings`

Gives control over system configuration such as general settings, mail settings, and admin options.

| Permission            | Resource                 | Action | Description             |
| --------------------- | ------------------------ | ------ | ----------------------- |
| get\_settings         | settings:general         | read   | View general settings   |
| edit\_settings        | settings:general         | update | Update general settings |
| get\_mail\_settings   | settings:mail            | read   | View mail settings      |
| edit\_mail\_settings  | settings:mail            | update | Update mail settings    |
| get\_admin\_settings  | settings:admin\_settings | read   | View admin settings     |
| edit\_admin\_settings | settings:admin\_settings | update | Update admin settings   |

#### Settings (Default)

**Policy:** `manage_settings_default`

Provides limited read-only access to system settings such as general and mail settings.

| Permission          | Resource         | Action | Description           |
| ------------------- | ---------------- | ------ | --------------------- |
| get\_settings       | settings:general | read   | View general settings |
| get\_mail\_settings | settings:mail    | read   | View mail settings    |

#### Groups

**Policy:** `manage_groups`

Allows administrators to create, edit, delete, and view groups. Useful for managing user organization and role-based access.

| Permission     | Resource | Action | Description          |
| -------------- | -------- | ------ | -------------------- |
| get\_groups    | groups   | read   | View groups          |
| create\_groups | groups   | create | Create new groups    |
| edit\_groups   | groups   | update | Edit existing groups |
| delete\_groups | groups   | delete | Delete groups        |

#### Groups (Default)

**Policy:** `manage_groups_default`

Provides read-only access to view groups.

| Permission  | Resource | Action | Description |
| ----------- | -------- | ------ | ----------- |
| get\_groups | groups   | read   | View groups |

#### Alerts

**Policy:** `manage_alerts`

Allows creating, editing, deleting, and viewing alerts in the system. Useful for monitoring and notifying based on conditions.

| Permission     | Resource | Action | Description          |
| -------------- | -------- | ------ | -------------------- |
| get\_alerts    | alerts   | read   | View alerts          |
| create\_alerts | alerts   | create | Create new alerts    |
| edit\_alerts   | alerts   | update | Edit existing alerts |
| delete\_alerts | alerts   | delete | Delete alerts        |

#### Alerts (Default)

**Policy:** `manage_alerts_default`

Provides basic access to create and view alerts, intended for standard users.

| Permission     | Resource | Action | Description       |
| -------------- | -------- | ------ | ----------------- |
| get\_alerts    | alerts   | read   | View alerts       |
| create\_alerts | alerts   | create | Create new alerts |

#### Data Sources

**Policy:** `manage_data_sources`

Allows administrators to create, edit, delete, and view data sources. Essential for connecting and managing integrations.

| Permission            | Resource      | Action | Description                |
| --------------------- | ------------- | ------ | -------------------------- |
| get\_data\_sources    | data\_sources | read   | View data sources          |
| create\_data\_sources | data\_sources | create | Add new data sources       |
| edit\_data\_sources   | data\_sources | update | Edit existing data sources |
| delete\_data\_sources | data\_sources | delete | Remove data sources        |

#### Data Sources (Default)

**Policy:** `manage_data_sources_default`

Provides limited access to create new data sources.

| Permission            | Resource      | Action | Description          |
| --------------------- | ------------- | ------ | -------------------- |
| create\_data\_sources | data\_sources | create | Add new data sources |

#### Journals

**Policy:** `manage_journals`

Provides the ability to access the audit trail (system logs of activities). Useful for monitoring and compliance.

| Permission        | Resource | Action | Description            |
| ----------------- | -------- | ------ | ---------------------- |
| get\_audit\_trail | events   | read   | View system audit logs |

#### License

**Policy:** `manage_license`

Provides control over viewing and updating the system license.

| Permission      | Resource | Action | Description               |
| --------------- | -------- | ------ | ------------------------- |
| view\_license   | license  | read   | View current license info |
| update\_license | license  | update | Update or change license  |

#### License (Default)

**Policy:** `manage_license_default`

Allows viewing license information without update privileges.

| Permission    | Resource | Action | Description               |
| ------------- | -------- | ------ | ------------------------- |
| view\_license | license  | read   | View current license info |

#### Notification Destinations

**Policy:** `manage_notification_destinations`

Gives full control over notification destinations used for alerts and other system events.

| Permission                         | Resource                   | Action | Description                             |
| ---------------------------------- | -------------------------- | ------ | --------------------------------------- |
| create\_notification\_destinations | notification\_destinations | create | Create new notification destinations    |
| get\_notification\_destinations    | notification\_destinations | read   | View existing notification destinations |
| edit\_notification\_destinations   | notification\_destinations | update | Update notification destinations        |
| delete\_notification\_destinations | notification\_destinations |        |                                         |

#### Notification Destinations (Default)

**Policy:** `manage_notification_destinations_default`

Provides limited access to create and update notification destinations, usually for standard users.

| Permission                         | Resource                   | Action | Description                          |
| ---------------------------------- | -------------------------- | ------ | ------------------------------------ |
| create\_notification\_destinations | notification\_destinations | create | Create new notification destinations |
| edit\_notification\_destinations   | notification\_destinations | update | Update notification destinations     |

#### Pipeline Rules

**Policy:** `manage_pipeline_rules`

Allows managing rules for pipelines, including creating, editing, deleting, and viewing them.

| Permission              | Resource  | Action | Description                  |
| ----------------------- | --------- | ------ | ---------------------------- |
| get\_pipeline\_rules    | pipelines | read   | View pipeline rules          |
| create\_pipeline\_rules | pipelines | create | Create new pipeline rules    |
| edit\_pipeline\_rules   | pipelines | update | Edit existing pipeline rules |
| delete\_pipeline\_rules | pipelines | delete | Delete pipeline rules        |

#### Pipeline Rules (Default)

**Policy:** `manage_pipeline_rules_default`

Provides limited read-only or create/edit access to pipeline rules for non-admin users.

| Permission              | Resource  | Action | Description                  |
| ----------------------- | --------- | ------ | ---------------------------- |
| get\_pipeline\_rules    | pipelines | read   | View pipeline rules          |
| create\_pipeline\_rules | pipelines | create | Create new pipeline rules    |
| edit\_pipeline\_rules   | pipelines | update | Edit existing pipeline rules |

#### Pipelines

**Policy:** `manage_pipelines`

Allows creating, updating, deleting, and viewing pipelines in the system.

| Permission       | Resource  | Action | Description           |
| ---------------- | --------- | ------ | --------------------- |
| create\_pipeline | pipelines | create | Create new pipelines  |
| delete\_pipeline | pipelines | delete | Delete pipelines      |
| update\_pipeline | pipelines | update | Update pipelines      |
| read\_pipeline   | pipelines | read   | View pipeline details |

#### Pipelines (Default)

**Policy:** `manage_pipelines_default`

Provides read-only access to pipelines, typically for standard users.

| Permission     | Resource  | Action | Description           |
| -------------- | --------- | ------ | --------------------- |
| read\_pipeline | pipelines | read   | View pipeline details |

#### Forwarders

**Policy:** `manage_forwarders`

Allows full management of forwarders, including creating, editing, deleting, and viewing them.

| Permission         | Resource   | Action | Description              |
| ------------------ | ---------- | ------ | ------------------------ |
| get\_forwarders    | forwarders | read   | View forwarders          |
| create\_forwarders | forwarders | create | Create new forwarders    |
| edit\_forwarders   | forwarders | update | Edit existing forwarders |
| delete\_forwarders | forwarders | delete | Delete forwarders        |

#### Forwarders (Default)

**Policy:** `manage_forwarders_default`

Provides limited read-only access to forwarders for non-admin users.

| Permission      | Resource   | Action | Description     |
| --------------- | ---------- | ------ | --------------- |
| get\_forwarders | forwarders | read   | View forwarders |

#### Forwarder Mappings

**Policy:** `manage_forwarder_mappings`

Allows full control over forwarder mappings, including creating, editing, deleting, and viewing them.

| Permission                  | Resource            | Action | Description                   |
| --------------------------- | ------------------- | ------ | ----------------------------- |
| get\_forwarder\_mappings    | forwarders:mappings | read   | View forwarder mappings       |
| create\_forwarder\_mappings | forwarders:mappings | create | Create new forwarder mappings |
| edit\_forwarder\_mappings   | forwarders:mappings | update | Edit existing mappings        |
| delete\_forwarder\_mappings | forwarders:mappings | delete | Delete forwarder mappings     |

#### Forwarder Mappings (Default)

**Policy:** `manage_forwarder_mappings_default`

Provides read-only access to forwarder mappings for non-admin users.

| Permission               | Resource            | Action | Description             |
| ------------------------ | ------------------- | ------ | ----------------------- |
| get\_forwarder\_mappings | forwarders:mappings | read   | View forwarder mappings |

#### Source Extensions

**Policy:** `manage_source_extensions`

Allows administrators to create, edit, delete, and view source extensions. Useful for managing integrations and data enrichment.

<table><thead><tr><th width="216.5999755859375">Permission</th><th>Resource</th><th width="114.5999755859375">Action</th><th>Description</th></tr></thead><tbody><tr><td>get_source_extensions</td><td>source_extensions</td><td>read</td><td>View source extensions</td></tr><tr><td>create_source_extensions</td><td>source_extensions</td><td>create</td><td>Add new source extensions</td></tr><tr><td>edit_source_extensions</td><td>source_extensions</td><td>edit</td><td>Edit existing source extensions</td></tr><tr><td>delete_source_extensions</td><td>source_extensions</td><td>delete</td><td>Delete source extensions</td></tr></tbody></table>

#### Source Extensions (Default)

**Policy:** `manage_source_extensions_default`

Provides read-only access to source extensions for non-admin users.

| Permission              | Resource           | Action | Description            |
| ----------------------- | ------------------ | ------ | ---------------------- |
| get\_source\_extensions | source\_extensions | read   | View source extensions |

#### Fleet Agents

**Policy:** `manage_fleet_agents`

Allows full management of fleet agents, including creating, editing, deleting, and viewing them.

| Permission            | Resource     | Action | Description          |
| --------------------- | ------------ | ------ | -------------------- |
| get\_fleet\_agents    | fleet:agents | read   | View fleet agents    |
| create\_fleet\_agents | fleet:agents | create | Add new fleet agents |
| edit\_fleet\_agents   | fleet:agents | update | Edit existing agents |
| delete\_fleet\_agents | fleet:agents | delete | Delete fleet agents  |

#### Fleet Agents (Default)

**Policy:** `manage_fleet_agents_default`

Provides read-only access to fleet agents for non-admin users.

| Permission         | Resource     | Action | Description       |
| ------------------ | ------------ | ------ | ----------------- |
| get\_fleet\_agents | fleet:agents | read   | View fleet agents |

#### Fleet Configurations

**Policy:** `manage_fleet_configurations`

Allows full management of fleet configurations, including creating, editing, deleting, and viewing them.

<table><thead><tr><th width="238.20001220703125">Permission</th><th width="181">Resource</th><th width="92.7999267578125">Action</th><th>Description</th></tr></thead><tbody><tr><td>get_fleet_configurations</td><td>fleet:configurations</td><td>read</td><td>View fleet configurations</td></tr><tr><td>create_fleet_configurations</td><td>fleet:configurations</td><td>create</td><td>Add new fleet configurations</td></tr><tr><td>edit_fleet_configurations</td><td>fleet:configurations</td><td>update</td><td>Edit existing configurations</td></tr><tr><td>delete_fleet_configurations</td><td>fleet:configurations</td><td>delete</td><td>Delete fleet configurations</td></tr></tbody></table>

#### Fleet Configurations (Default)

**Policy:** `manage_fleet_configurations_default`

Provides read-only access to fleet configurations for non-admin users.

<table><thead><tr><th width="213.4000244140625">Permission</th><th>Resource</th><th width="102">Action</th><th>Description</th></tr></thead><tbody><tr><td>get_fleet_configurations</td><td>fleet:configurations</td><td>read</td><td>View fleet configurations</td></tr></tbody></table>

#### Fleet Packages

**Policy:** `manage_fleet_packages`

Allows full management of fleet packages, including creating, editing, deleting, and viewing them.

<table><thead><tr><th>Permission</th><th>Resource</th><th width="99.7999267578125">Action</th><th>Description</th></tr></thead><tbody><tr><td>get_fleet_packages</td><td>fleet:packages</td><td>read</td><td>View fleet packages</td></tr><tr><td>create_fleet_packages</td><td>fleet:packages</td><td>create</td><td>Add new fleet packages</td></tr><tr><td>edit_fleet_packages</td><td>fleet:packages</td><td>update</td><td>Edit existing packages</td></tr><tr><td>delete_fleet_packages</td><td>fleet:packages</td><td>delete</td><td>Delete fleet packages</td></tr></tbody></table>

#### Fleet Packages (Default)

**Policy:** `manage_fleet_packages_default`

Provides read-only access to fleet packages for non-admin users.

| Permission           | Resource       | Action | Description         |
| -------------------- | -------------- | ------ | ------------------- |
| get\_fleet\_packages | fleet:packages | read   | View fleet packages |

#### Fleet User

**Policy:** `manage_fleet_user`

Allows viewing fleet user details and monitoring user access.

| Permission       | Resource   | Action | Description             |
| ---------------- | ---------- | ------ | ----------------------- |
| get\_fleet\_user | fleet:user | read   | View fleet user details |

#### Fleet Install

**Policy:** `manage_fleet_install`

Allows creating new fleet installations for deploying and managing agents.

| Permission             | Resource      | Action | Description                    |
| ---------------------- | ------------- | ------ | ------------------------------ |
| fleet\_create\_install | fleet:install | create | Create new fleet installations |

#### Scenarios

**Policy:** `manage_scenarios`

Allows full management of scenarios, including creating, viewing, editing, and deleting them.

<table><thead><tr><th>Permission</th><th>Resource</th><th width="98.99993896484375">Action</th><th>Description</th></tr></thead><tbody><tr><td>create_scenarios</td><td>scenarios</td><td>create</td><td>Create new scenarios</td></tr><tr><td>view_scenarios</td><td>scenarios</td><td>read</td><td>View existing scenarios</td></tr><tr><td>edit_scenarios</td><td>scenarios</td><td>update</td><td>Edit existing scenarios</td></tr><tr><td>delete_scenarios</td><td>scenarios</td><td>delete</td><td>Delete scenarios</td></tr></tbody></table>

#### Certificates

**Policy:** `manage_certificates`

Allows full management of certificates, including viewing, adding, hiding, and deleting them.

| Permission           | Resource     | Action | Description                |
| -------------------- | ------------ | ------ | -------------------------- |
| view\_certificates   | certificates | read   | View certificates          |
| add\_certificates    | certificates | create | Add new certificates       |
| hide\_certificates   | certificates | update | Hide existing certificates |
| delete\_certificates | certificates | delete | Delete certificates        |

#### Checks as Admin

**Policy:** `manage_checks_as_admin`

Allows administrators to edit all checks across the system.

| Permission        | Resource | Action | Description              |
| ----------------- | -------- | ------ | ------------------------ |
| edit\_all\_checks | checks   | update | Edit all checks as admin |

#### Checks

**Policy:** `manage_checks`

Allows full management of system checks, including creating, editing, cloning, deleting, running, and enabling them.

| Permission     | Resource | Action  | Description           |
| -------------- | -------- | ------- | --------------------- |
| view\_checks   | checks   | read    | View existing checks  |
| run\_checks    | checks   | execute | Execute checks        |
| create\_checks | checks   | create  | Create new checks     |
| edit\_checks   | checks   | update  | Edit existing checks  |
| clone\_checks  | checks   | clone   | Clone existing checks |
| delete\_checks | checks   | delete  | Delete checks         |
| enable\_checks | checks   | update  | Enable checks         |

#### Dataflows

**Policy:** `manage_dataflows`

Allows viewing dataflows in the system for monitoring and analysis purposes.

| Permission      | Resource  | Action | Description    |
| --------------- | --------- | ------ | -------------- |
| view\_dataflows | dataflows | read   | View dataflows |

#### Run Checks

**Policy:** `manage_run_checks`

Allows execution of checks in the system.

| Permission  | Resource | Action  | Description           |
| ----------- | -------- | ------- | --------------------- |
| run\_checks | checks   | execute | Execute system checks |

#### Create Checks

**Policy:** `manage_create_checks`

Allows creating new checks in the system.

| Permission     | Resource | Action | Description       |
| -------------- | -------- | ------ | ----------------- |
| create\_checks | checks   | create | Create new checks |

#### Metrics

**Policy:** `manage_metrics`

Allows full management of metrics, including viewing, creating, editing, and deleting them.

| Permission      | Resource | Action | Description           |
| --------------- | -------- | ------ | --------------------- |
| view\_metrics   | metrics  | read   | View metrics          |
| edit\_metrics   | metrics  | update | Edit existing metrics |
| create\_metrics | metrics  | create | Create new metrics    |
| delete\_metrics | metrics  | delete | Delete metrics        |

#### Policies

**Policy:** `manage_policies`

Allows full management of system policies, including viewing, creating, editing, and deleting them.

| Permission       | Resource | Action | Description            |
| ---------------- | -------- | ------ | ---------------------- |
| view\_policies   | policies | read   | View policies          |
| edit\_policies   | policies | update | Edit existing policies |
| create\_policies | policies | create | Create new policies    |
| delete\_policies | policies | delete | Delete policies        |

#### System Status

**Policy:** `manage_system_status`

Allows viewing the current status of the system.

| Permission           | Resource       | Action | Description        |
| -------------------- | -------------- | ------ | ------------------ |
| read\_system\_status | system\_status | read   | View system status |

#### Tags

**Policy:** `manage_tags`

Allows full management of tags, including viewing, creating, editing, and deleting them.

| Permission   | Resource | Action | Description        |
| ------------ | -------- | ------ | ------------------ |
| view\_tags   | tags     | read   | View tags          |
| edit\_tags   | tags     | update | Edit existing tags |
| create\_tags | tags     | create | Create new tags    |
| delete\_tags | tags     | delete | Delete tags        |

#### Private Agents

**Policy:** `manage_private_agents`

Allows full management of private agents, including viewing, creating, editing, and deleting them.

| Permission              | Resource       | Action | Description               |
| ----------------------- | -------------- | ------ | ------------------------- |
| view\_private\_agents   | private-agents | read   | View private agents       |
| edit\_private\_agents   | private-agents | update | Edit existing agents      |
| create\_private\_agents | private-agents | create | Create new private agents |
| delete\_private\_agents | private-agents | delete | Delete private agents     |
