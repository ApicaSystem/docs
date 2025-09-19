# Policy

## Overview

A policy outlines access control to specific resources by specifying the actions users are permitted to perform.

**Components of a Policy:**

* Policy Name: A unique identifier for the policy that clearly describes its purpose or scope. It helps administrators quickly recognize and manage policies within the system.
* Permissions: The specific actions allowed or denied by the policy. Permissions define what resources the policy applies to and what operations users can perform on those resources (e.g., read, write, delete).

<figure><img src="../../../.gitbook/assets/image (1090).png" alt=""><figcaption></figcaption></figure>

***

### &#x20;Create a Policy

To create a policy:

1. Navigate to Settings > IAM > Policy Management.
2. Click on the create policy button.
3. Add the name of the policy. It should be unique.
4. Click on Add permission button.
5. Add permissions to the policy. Navigate [here](permissions.md) to learn how to create a permission.
6. Click on Add policy to create a new policy.\


***

### Update a Policy

Only customer-managed policies can be edited.

To update a policy:

1. Navigate to Settings > IAM > Policy Management.
2. Locate the customer-managed policy you want to modify.
3. Click the Edit button next to the policy.
4. Update the desired fields (e.g., name, permissions, resources, actions).
5. Click Save Policy to apply the changes.\


***

### Delete a Policy

Only customer-managed policies can be deleted.

To delete a policy:

1. Go to Settings > IAM > Policy Management.
2. Click the Delete button next to the relevant policy.
3. Confirm the deletion in the popup dialog.

Note: Deleting a policy is irreversible and will remove all associated permissions.

***

### View details of a Policy

To view the details of a policy:

1. Navigate to IAM > Policy Management.
2. Click on the policy name to open and review its configuration, including permissions, resources, and assigned roles.

<figure><img src="../../../.gitbook/assets/image (1091).png" alt=""><figcaption></figcaption></figure>
