# Lock Coverage Set

This call is sent to lock a coverage set in TDO – this will prevent any other user (within the UI or from automated API calls) from making changes to the coverage set or business rules while you are working within that coverage set. It is sent as a ‘PATCH’.

Note that the header is slightly different (it includes the command ‘lock’ in addition to the coverage set ID.

<figure><img src="../../../../../.gitbook/assets/image (281).png" alt=""><figcaption><p>Lock coverage set call</p></figcaption></figure>

The body of this call remains the same as the ‘get details’ API.

```
{
          "context": {
          "user": "mbj_test",
                   "password": "xxxx",
                   "project": {
                              "name": "imp_payments_demo",
                              "version": "1.0"
                    }
          }
}
```

The return message contains all of the details. Highlighted below is the section of the details around the lock that was placed.

<figure><img src="../../../../../.gitbook/assets/image (282).png" alt=""><figcaption><p>Lock coverage set return message - successfu;</p></figcaption></figure>

In TDO, the lock can be seen on the main coverage set page; the ID of the user who placed the lock is visible. By hovering the cursor to the right of that ID, you can see the lock icon is also visible.

<figure><img src="../../../../../.gitbook/assets/image (283).png" alt=""><figcaption><p>Coverage set lock shown in TDO</p></figcaption></figure>

If you try to place a lock, and the coverage set is already locked by a different user, you will get the return message below, including the ID of the user who has the lock in place.

<figure><img src="../../../../../.gitbook/assets/image (284).png" alt=""><figcaption><p>Error message - coverage set already locked</p></figcaption></figure>
