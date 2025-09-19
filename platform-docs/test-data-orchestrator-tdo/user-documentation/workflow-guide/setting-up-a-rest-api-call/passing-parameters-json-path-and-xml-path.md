# Passing Parameters - JSON Path and XML Path

TDO allows any value returned in a call to be referenced in a subsequent call using JSON Path or XML Path to query the results from the completed call.  The method used should match the protocol of the call being referenced (i.e., JSON Path for a JSON response and XML Path for an XML response). &#x20;

In this section, JSON Path is shown but can be replaced with XML Path in any example.

{% hint style="warning" %}
Note that both the prior example of filtering for a specific workset id, and passing the id from the prior call, are both valid methods of passing parameters.  In the prior example, we are asking for the workset id associated with a specific workset and version (ex: second\_workset 1.0).  In this example, we are specifying a specific return position in the response (give me the workset id from the first workset in the response message).

Which method you use to pass the parameters to the url or body of your call will depend on your specific situation.
{% endhint %}

JSON Path/XML Path queries and user guided parameters can be combined inside a single call.  In the example below, JSON Path is used to provide the workset ID in the URL and user guided parameters are used in the body to pass the user ID and password.

### Using JSON Path in the Rest call&#x20;

The clone workset call is shown below.  It is referencing the response message from the prior call (get\_all\_worksets) to get the workset ID.  This is combined with a user guided parameter at the end of the call to define the cloned workset name, as well as guided parameters in the body for the user ID and password.

<figure><img src="../../../../../.gitbook/assets/image (1039).png" alt=""><figcaption><p>Combining JSON Path and User guided parameters</p></figcaption></figure>

The 'extract(act\_res\[retrieve\_workset],' language is used to define the response message to be parsed (it can be any activity in the workflow prior to the current activity). &#x20;

When the workflow is executed, the response will show in the execution log.  Note in the 5th line in the log, the 5th line shows the extract command has been replaced with the system ID for the workset to be cloned (68126a9d68da6160327aa80c) from the prior call's response.

<figure><img src="../../../../../.gitbook/assets/image (1040).png" alt=""><figcaption><p>Execution Log</p></figcaption></figure>

### Using JSON Path in the Call Body

JSON Path can also be used in the body of the call to pass a value from the any prior response message.

In the workflow shown below, the first call is to get all determining attributes.  The second call, update determining attribute, uses the ID of the determining attribute in the body of the call.  In the entity section, this is shown on the 'id' line. The command given is to extract the 'id' value from the first item in the returned array from the 'get\_all\_da' call.

<figure><img src="../../../../../.gitbook/assets/image (1041).png" alt=""><figcaption><p>Using JSON Path in the body of the call</p></figcaption></figure>

When this is run, the execution log will display the results.

<figure><img src="../../../../../.gitbook/assets/image (1042).png" alt=""><figcaption><p>Execution Log</p></figcaption></figure>

And the determining attribute that was updated now shows priorities set (the update was to add priorities).

<figure><img src="../../../../../.gitbook/assets/image (1043).png" alt=""><figcaption><p>Updated Determining Attribute.</p></figcaption></figure>
