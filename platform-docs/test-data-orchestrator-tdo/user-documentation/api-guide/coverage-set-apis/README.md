# Coverage Set API’s

As with Determining Attributes, you can perform the ‘create’, ‘update’, ‘get all’, and ‘delete’ actions.  You can also perform the ‘lock’ and ‘unlock’ actions on Coverage Sets via API calls.  \[Locking a coverage set prevents other users from changing it while you are working on it, and the unlock action removes the lock so that it is available for another user to work with it.]

&#x20;

The list of Coverage Set API’s is shown in the table below.

&#x20;

<table data-header-hidden><thead><tr><th></th><th width="360"></th><th></th></tr></thead><tbody><tr><td>HTTP Method</td><td>URL</td><td>Action</td></tr><tr><td>POST</td><td>/core/1.0/API/coverageSet</td><td>Create</td></tr><tr><td>PATCH</td><td>/core/1.0/API/coverageSet</td><td>Update</td></tr><tr><td>DELETE</td><td>/core/1.0/API/coverageSet/:id</td><td>Delete</td></tr><tr><td>POST</td><td>/core/1.0/API/coverageSets</td><td>Get all Coverage sets for project</td></tr><tr><td>POST</td><td>/core/1.0/API/coverageSet/:id</td><td>Get Coverage set details</td></tr><tr><td>PATCH</td><td>/core/1.0/API/coverageSet/lock/:id</td><td>Lock coverage set</td></tr><tr><td>PATCH</td><td>/core/1.0/API/coverageSet/unlock/:id</td><td>Unlock coverage set</td></tr></tbody></table>

&#x20;

The list of fields used in the API’s is shown below, along with when/where they are required.

&#x20;

| Field                                   | Type   | Values | Description                  | Mandatory     |
| --------------------------------------- | ------ | ------ | ---------------------------- | ------------- |
| entity.name                             | String | Any    | DA name (for create request) | Yes \[create] |
| entity.id                               | String | Any    | DA Id                        | Yes \[update] |
| entity.determiningAttributes            | Array  | -      | DA references                | Yes           |
| entity.determiningAttributes\[].name    | String | Any    | DA name                      | Yes           |
| entity.determiningAttributes\[].version | String | Any    | DA version                   | Yes           |
