# Determining Attribute APIs

The following actions can be performed via API’s for determining attributes.

&#x20;

<table data-header-hidden><thead><tr><th width="205"></th><th></th><th></th></tr></thead><tbody><tr><td>HTTP Method</td><td>URL</td><td>Action</td></tr><tr><td>POST</td><td>/core/1.0/API/determiningAttribute</td><td>Create</td></tr><tr><td>PATCH</td><td>/core/1.0/API/determiningAttribute</td><td>Update</td></tr><tr><td>DELETE</td><td>/core/1.0/API/determiningAttribute/:id</td><td>Delete</td></tr><tr><td>POST</td><td>/core/1.0/API/determiningAttributes</td><td>Get all DAs for project</td></tr><tr><td>POST</td><td>/core/1.0/API/determiningAttribute/:id</td><td>Get DA details</td></tr></tbody></table>

&#x20;

The Create action can create two types of determining attribute:  a range based attribute (ex: 1 – 100, 101 – 200, etc) or a value based attribute sourced from a data block.  These are two separate API’s.

&#x20;

The Get all DA’s for project API will return the determining attribute names and id’s.  In order to run the Update, Delete, or Get DA details actions, you must first run this action to get the id for the action you want to work with.

&#x20;

The Update API can be used to add additional values to a determining attribute or to add/change priorities assigned to those values.

&#x20;

The Delete API will delete the specified determining attribute.

&#x20;

The Get DA details API will pull all details associated with the specified determining attribute.

&#x20;

The tables below show both the required and optional items in the Create and Update requests.  Note that some of these vary between a value-based determining attribute and a range-based determining attribute.

&#x20;

Value-based determining attribute:

&#x20;

| Field                 | Type   | Values                                                     | Description                                                          | Mandatory                                                          |
| --------------------- | ------ | ---------------------------------------------------------- | -------------------------------------------------------------------- | ------------------------------------------------------------------ |
| entity.name           | String | Any                                                        | DA name (for create request)                                         | Yes \[create]                                                      |
| entity.id             | String | Any                                                        | DA Id                                                                | Yes \[update]                                                      |
| entity.dataType       | String | <p>[“STRING”, “NUMBER”,</p><p>“BOOLEAN”,</p><p>“DATE”]</p> | DA data type                                                         | No, String is default and will be applied if this is not specified |
| entity.type           | String | \[“VALUE”, “RANGE”]                                        | DA type                                                              | Yes \[create]                                                      |
| entity.values         | Array  | Any                                                        | DA values                                                            | Yes, must have more than one value                                 |
| entity.source         | Object | -                                                          | Underlying data block                                                | No                                                                 |
| entity.source.name    | String | Any                                                        | Data Block name                                                      | No                                                                 |
| entity.source.version | String | Any                                                        | Data Block version                                                   | No                                                                 |
| entity.valuesPriority | Object | -                                                          | Object where the key is DA value and value is priority               | No                                                                 |
| entity.criteria       | Object | -                                                          | Object where the key is DA name and value is grouping attribute name | No                                                                 |

&#x20;

&#x20;

Range-based determining attributes contain the same fields as the value-based API but with a different format for the entity.values \[ ] field.  In this case, you must send both a minValue and a maxValue; if you do not sent both for a range-based entity the API will fail.

&#x20;

| Field                     | Type            | Values | Description  | Mandatory                          |
| ------------------------- | --------------- | ------ | ------------ | ---------------------------------- |
| entity.values             | Array of Object | -      | Range values | Yes, must have more than one value |
| entity.values.element     | Object          | -      | Yes          | Yes                                |
| entity.values\[].minValue | Number\|Date    | -      | Yes          | Yes                                |
| entity.values\[].maxValue | Number\|Date    | -      | Yes          | Yes                                |
