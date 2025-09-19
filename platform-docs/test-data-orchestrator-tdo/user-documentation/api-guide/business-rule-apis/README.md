# Business Rule API’s

You can create, update, delete, get details, or get all details for business rules using API’s.  This table shows the base API calls.

&#x20;

| HTTP Method | URL                            | Action                                  |
| ----------- | ------------------------------ | --------------------------------------- |
| POST        | /core/1.0/API/businessRule     | Create                                  |
| PATCH       | /core/1.0/API/businessRule     | Update                                  |
| DELETE      | /core/1.0/API/businessRule/:id | Delete                                  |
| POST        | /core/1.0/API/businessRules    | Get all business rules for coverage set |
| POST        | /core/1.0/API/businessRule/:id | Get business rule set details           |

&#x20;

The fields to be used in the create/update requests are listed below.  The get details, get all details, and delete API’s do not require any entity information.

&#x20;

| Field                          | Type   | Description                                                                                                        | Mandatory     |
| ------------------------------ | ------ | ------------------------------------------------------------------------------------------------------------------ | ------------- |
| entity.id                      | String | Business rule Id                                                                                                   | Yes \[update] |
| entity.conditions              | Object | Business rules conditions, keyed by determining attribute name, valued by an object contained array named ‘values’ | Yes           |
| entity.conditions.key          | String | Determining Attribute name                                                                                         | Yes           |
| entity.conditions.value        | Object | Conditions                                                                                                         | Yes           |
| entity.conditions.value.values | Array  | Values selected                                                                                                    | Yes           |
