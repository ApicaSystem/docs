# Get All Worksets

This call returns a list of all of the worksets in any given project. It is POST call.

<figure><img src="../../../../../.gitbook/assets/image (313).png" alt=""><figcaption><p>Get all worksets API call</p></figcaption></figure>

The body for this call is very simple, containing only the user credentials and the project name.

```
{
          "context": {
                    "user": "mbj_test",
                    "password": "xxxx",
                    "project": {
                              "name": "mug_test_project",
                              "version": "1.0"
                    }
          }
}
```

When run, the return message shows all of the worksets in this project.

<figure><img src="../../../../../.gitbook/assets/image (314).png" alt=""><figcaption><p>Return message (successful) showing all worksets</p></figcaption></figure>
