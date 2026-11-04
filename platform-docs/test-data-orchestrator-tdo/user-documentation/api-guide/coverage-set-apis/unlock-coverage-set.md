# Unlock Coverage Set

Once you are finished working in a coverage set, you should release the lock so that other users can access it if desired. The call is very similar to ‘lock coverage set’, except that the command in the header is ‘unlock’ instead of ‘lock’.

<figure><img src="../../../../../.gitbook/assets/image (285).png" alt=""><figcaption><p>Unlock coverage set API call</p></figcaption></figure>

The body of the call is the same as in the ‘lock’ call.

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

The return message will show the lock attributes removed from the coverage set (highlighted below).

<figure><img src="../../../../../.gitbook/assets/image (286).png" alt=""><figcaption><p>Return message showing lock removed</p></figcaption></figure>

When viewed in TDO, the ‘locked by’ column is now blank for this coverage set (api\_demo\_coverage 1.0), showing that the lock has been removed.

<figure><img src="../../../../../.gitbook/assets/image (287).png" alt=""><figcaption><p>TDO screen showing lock removed</p></figcaption></figure>
