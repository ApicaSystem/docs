# API Key Management

API Keys in ascent are used to access APIs. They are embedded in the API request using the `Authorization: Bearer <api-key>` header.&#x20;

These API keys can be accessed using the API key page. API keys are restricted to 2 per user.&#x20;

Create an API Key:

1. To create an API key, click on API Key > Create New Key
2. Add name, expiration and user info in the pop up box.
3. Click on create.

Note: An API Key with no expiration can be also used as `x-api-key` to access flash APIs

Disable an API Key:

1. Go to API Key page.
2. Toggle the API Key enable

Note: A disabled API key cannot be used to access APIs.

Delete an API Key:

1. Go to API Key page.
2. Click on delete API key
3. Click confirm

Note: Only users with admin role have the right to view/create/disable/delete the API Key of another user.
