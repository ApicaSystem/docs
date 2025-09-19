# Workflow Guide

You can use TDO to execute workflow.  Rest API calls and shell scripts (batch files) are both currently supported.  You can set up one or more items in a workflow group. &#x20;

To execute workflow, you must have Work Flow Access enabled in your user setup. &#x20;

You can execute API calls for TDO functions, for external programs with API's, and for shell scripts that are on the TDO server, or on a remote desktop that has firewall access open to the TDO server. &#x20;

For API calls, the TDO server must be able to ping the server that the program you are calling is installed on.  This may require opening firewalls to enable this process.

For shell/batch scripts, either the script must be on the same server as TDO or you must set up SSH on the server where the script resides and send the SSH credentials from TDO as part of the setup.

You can create user-driven parameters for Rest API calls, and you can pass values from prior calls using JSON Path protocols. &#x20;
