# API Structure and Usage

### General API information

Each request must have a body that includes credentials \[required], project name/version \[required], and entity definition \[optional].  Each API will be covered in detail within the specific section devoted to that action.&#x20;

&#x20;

The context object is used to provide TDO authentication data and project information. For Business Rule API’s the Coverage Set information must also be passed in the context object.  The context object is a JSON object that must be included in the request body.

&#x20;&#x20;

Specification:

&#x20;

| Field            | Type   | Description             | Mandatory |
| ---------------- | ------ | ----------------------- | --------- |
| user             | String | User name               | Yes       |
| password         | String | Password                | Yes       |
| project          | Object | Project definition      | Yes       |
| project.name     | String | Project name            | Yes       |
| project.version  | String | Project version         | Yes       |
| coverage         | Object | Coverage Set definition | No        |
| coverage.name    | String | Coverage Set name       | No        |
| coverage.version | String | Coverage Set version    | No        |
| params           | Object | Additional parameters   | No        |

&#x20;

Example:

&#x20;

```
{
  "context": {
    "user": "tdo_api_user",
    "password": "welcome",
    "project": {
      "name": "api_testing",
      "version": "1.0"
    },
    "coverage": {
      "name": "api_testing_coverage",
      "version": "1.0"
    }
  }
}
```

&#x20;

&#x20;

Authentication

&#x20;

TDO will authenticate the credentials presented by the API using the following algorithm, based on what authentication protocol is active:

&#x20;

·       Basic TDO form authorization – credentials are set up in TDO

·       LDAP – credentials will be passed to LDAP by TDO and validated in LDAP

·       SAML – user with name/password must exist in TDO and will be authenticated in TDO

&#x20;

Note that for the ‘Delete’ API’s, TDO only allows the ‘Admin’ role to perform deletions.  The API’s do not override this requirement, so to perform the delete functions you must use credentials that are enrolled as Admin.  If you send credentials that are enrolled as User, you will receive an error message that you do not have the right authority to perform that function.

&#x20;

Entity Object

&#x20;

Entity Object defines the entity the API will process. Entity must contain one of the following attributes – name (create request) or id (update request).   (Create determining attribute entity is shown below for reference.)

&#x20;

```
  "entity": {
        "name": "acct_type",
        "dataType": "STRING",
        "type": "VALUE",
        "values": [
            "Checking", "Savings", "Current"
  }
```

&#x20;

&#x20;

In all of the tables in the detail sections, the URLs shown should be preceded by the identifying server information (http(s):\<server\_name>:8080, for instance).  The format for this will be specific to your installation.
