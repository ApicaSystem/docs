# Fleet Config Repository

The Fleet git repository allows users to add and configure fleet resources. Apica's Fleet control plane polls an assigned repository every few minutes to check for updates. Different fleet resource types are fetched separately and synced if there is an update. The check is done by keeping track of the commit hash.&#x20;

The following resources can be added and configured in Apica's Fleet Management git repository:

1. Agent Types
2. Agent's Installation Procedure - under Packages
3. Configuration files.

By default, Apica comes with a pre-built [GitHub Repository](https://github.com/ApicaSystem/fleet-management-defaults) that is linked to the environment. This has support for all the supported Agent Types, their installation package, and configuration files for all agent types.
