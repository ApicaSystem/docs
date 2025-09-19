---
description: >-
  All functions that can be performed via the user interface (UI) in TDO can
  also be performed via API from any Test or DevOps tool capable of using REST
  API calls.
---

# API Guide

Within each functional area, the API’s are capable of:

* Create new item
* Get all items (needed to get the internal ID for any item you want to update, get details, or delete)
* Update item
* Get item details
* Delete item
* Lock/Unlock item (Coverage Sets and Work Sets)

In order to execute any of these functions: update, delete, get item details, lock, or unlock you need to first run the ‘get all’ API to get the item’s internal ID which is then sent in the action API.&#x20;

In this document, Postman (free version) is used to demonstrate how each API should be set up and used and show the expected response formats.
