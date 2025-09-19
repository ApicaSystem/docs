# Auditing and Logging

### Overview

Apica's Event Tracking feature is an essential tool for system administrators and developers, designed specifically to enhance the monitoring and oversight of system actions. By leveraging Event Tracking, administrators can gain deep insights into the system's activities, enabling them to identify and respond to potential security threats swiftly.&#x20;

### What events are tracked?

Here is a table listing the tracked events along with their corresponding audit levels.

| Event          | High | Medium | Low |
| -------------- | ---- | ------ | --- |
| Login          |      |        | ✔️  |
| Logout         |      |        | ✔️  |
| Signup         |      |        | ✔️  |
| Entity Update  |      | ✔️     |     |
| Create Entity  |      |        | ✔️  |
| Delete Entity  | ✔️   |        |     |

### User Cases:

1. Auditing User Role Changes:\
   Track which admin changed a user's role, when, and what the role was before and after.
2. Security Monitoring:\
   Detect high-risk activities such as deletions of users or organizations.
3. Debugging Issues:\
   Understand how a user's configuration changed over time.
