# Permissions

## Overview

Permissions are essential for regulating access to a resource, ensuring that only authorized users can perform specific actions. Different levels of permissions can be assigned, ranging from read-only access, where users can view the data without making alterations, to full control, allowing users to modify and manage the resource completely.&#x20;

**Components of a Permission:**

* Permission Name: A unique label for each permission within the policy.
* Resources: The specific assets or data (e.g., databases, files, services) that the permission controls access to.
* Actions: The operations permitted on the resources, such as read, write, delete, or execute.

<figure><img src="../../../.gitbook/assets/image (1092).png" alt=""><figcaption></figcaption></figure>

***

### &#x20;Add permissions to a policy

To add permissions:

1. Go to IAM > Policy Management.
2. Create a new customer-managed policy or edit an existing one.
3. Click Add Permission.
4. Enter a unique name for the permission.
5. Click Add Resources and select the applicable resources from the modal.
6. Click Actions and select the appropriate actions for those resources.
7. Click Save Policy to apply the changes.

Example: If you choose only the Read action on a Postgres data source, users with this permission will have read-only access.

***

### &#x20;Remove permissions from a policy

To remove a permission:

1. Navigate to the desired policy under Settings > IAM > Policy Management.
2. Click on Edit button.
3. Click the Delete icon next to the permission you wish to remove.
4. Click Save Policy to confirm the changes.

***

### &#x20;Permissions types and scopes

All policies created by users are categorized as customer-managed policies. These policies provide full flexibility in defining:

* Permission names
* Resources (e.g., data sources, services)
* Actions (e.g., read, write, delete)

This allows organizations to tailor access control based on specific roles, data sensitivity, and operational requirements.
