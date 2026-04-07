# API Guide

{% hint style="info" %}
Test Data Orchestrator (TDO) has been re-branded to Wayfinder as of Q1 2026.  These documents are currently being re-written to reflect that change.  Test Data Orchestrator / TDO / Wayfinder all refer to the same product throughout these documents.
{% endhint %}

All functions that can be performed via the user interface (UI) in TDO can also be performed via API from any Test or DevOps tool capable of using REST API calls.

Within each functional area, the API’s are capable of:

* Create new item
* Get all items (needed to get the internal ID for any item you want to update, get details, or delete)
* Update item
* Get item details
* Delete item
* Lock/Unlock item (Coverage Sets and Work Sets)

In order to execute any of these functions: update, delete, get item details, lock, or unlock you need to first run the ‘get all’ API to get the item’s internal ID which is then sent in the action API.&#x20;

In this document, Postman (free version) is used to demonstrate how each API should be set up and used and show the expected response formats.
