# Workset API's

These calls can be used to create, update, delete, get all, get details, clone, and unlock worksets.  The URL’s and call types are listed in the table below.

| HTTP Method | URL                                        | Action                                                     |
| ----------- | ------------------------------------------ | ---------------------------------------------------------- |
| POST        | /core/1.0/API/workSet                      | Create                                                     |
| PATCH       | /core/1.0/API/workSet                      | Update                                                     |
| DELETE      | /core/1.0/API/workSet/:id                  | Delete                                                     |
| POST        | /core/1.0/API/workSets                     | Get all work sets for project                              |
| POST        | /core/1.0/API/workSet/:id                  | Get work set details                                       |
| POST        | /core/1.0/API/workSet/clone/:id?name=:name | Clone work set, id – original ws id, name – cloned ws name |
| PATCH       | /core/1.0/API/workSet/unlock/:id           | Unlock work set                                            |

&#x20;

For the create and update API’s, the body fields are needed to provide the necessary context.  A list of these fields and which call they are required for is provided below.

&#x20;

| Field                               | Type   | Values | Description                            | Mandatory     |
| ----------------------------------- | ------ | ------ | -------------------------------------- | ------------- |
| entity.name                         | String | Any    | WS name                                | Yes \[create] |
| entity.id                           | String | Any    | WS Id                                  | Yes \[update] |
| entity.scenario                     | Object | -      | Scenario object                        | Yes           |
| entity.scenario.name                | String | Any    | Scenario name                          | Yes           |
| entity.scenario.version             | String | Any    | Scenario version                       | Yes           |
| entity.primary                      | Object | -      | Primary source                         | Yes           |
| entity.primary.view                 | Object | -      | Primary data view                      | Yes           |
| entity.primary.view.name            | String | Any    | Primary data view name                 | Yes           |
| entity.primary.view.version         | String | Any    | <p>Primary data view</p><p>version</p> | Yes           |
| entity.primary.dataSet              | Object | -      | Primary data set                       | Yes           |
| entity.primary.dataSet.name         | String | Any    | Primary data set name                  | Yes           |
| entity.primary.dataSet.version      | String | Any    | Data set version                       | Yes           |
| entity.dataViews                    | Array  | -      | List of Data Views                     | No            |
| entity.dataViews\[].view            | Object | -      | Data View Object                       | -             |
| entity.dataViews\[].view.name       | String | Any    | Data view name                         | -             |
| entity.dataViews\[].view.version    | String | Any    | Data view version                      | -             |
| entity.dataViews\[].dataSet         | Object | -      | Data Set Object                        | -             |
| entity.dataViews\[].dataSet.name    | String | Any    | Data set name                          | -             |
| entity.dataViews\[].dataSet.version | String | Any    | Data Set version                       | -             |
