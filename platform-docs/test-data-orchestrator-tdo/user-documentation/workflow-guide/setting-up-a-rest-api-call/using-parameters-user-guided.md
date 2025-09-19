# Using Parameters - User Guided

You may want to prompt the workflow users for information that will be used in the call:

* In the body of the call - for instance, to pass the user ID and password that is needed to run the call.
* In the header of the call - for instance, to set a filter to find a specific object in the project that the call is working on
* In either the header or the body, to pass a specific value.

User guided parameters are set at the workflow level and are available to any call in the workflow.

User guided parameters and querying prior results using JSON Path can be combined in a single call.

{% hint style="warning" %}
Note that both this example of filtering for a specific workset id, and passing the id from the prior call results, are valid methods of passing parameters.  In the this example, we are asking for the workset id associated with a specific workset and version (ex: second\_workset 1.0).  In the following page, we are specifying a specific return position in the response (give me the workset id from the first workset in the response message).

Which method you use to pass the parameters to the url or body of your call will depend on your specific situation.
{% endhint %}

For the first example, we will assign workflow parameters for User ID, Password, project, version, and cloned workset name.  The parameters are added on the 'Create Work Flow' main page and can be added after the workflow has been created.

To add a Parameter,  you must provide the following information:

* Parameter name - the name that will be used to reference this parameter in the workflow.  This should be both unique and simple.
* Parameter Label - the name that will show on the prompt screen to the user when they are asked to enter the value.  This should be a descriptive name that is easy to understand.
* Default value - if you want a default value to populate when the 'enter values' screen comes up, enter that value here.  Otherwise, leave this blank.
* Required - if the user must enter a value for the workflow to execute, check this box.  Otherwise, leave it blank.  If this box is checked, the user will not be allowed to execute the workflow unless a value is provided for this parameter.

The screen below shows the entries for the 'User ID' parameter.  Once the values are entered, click the blue plus (+) sign to the right of the values to add it to the parameters list.

<figure><img src="../../../../../.gitbook/assets/image (1034).png" alt=""><figcaption><p>Add Parameter pane</p></figcaption></figure>

The screen below shows all parameters set for this workflow.

<figure><img src="../../../../../.gitbook/assets/image (1035).png" alt=""><figcaption><p>Workflow Parameters</p></figcaption></figure>

To use a workflow parameter in your URL or body, it is called as wf\_params\[xx] where 'xx' is the parameter name.  This can be enclosed in single quotes in the URL and double quotes in the body, depending on how the parameters are used.

The User ID and Password in the body of the text have been replaced with parameters in the screen below.

<figure><img src="../../../../../.gitbook/assets/image (1036).png" alt=""><figcaption><p>Using parameters in the body of the call</p></figcaption></figure>

Parameters can also be used to query results from a prior call in the URL of the call. &#x20;

{% hint style="warning" %}
If you will be using parameters for JSON queries in the URL, you should be familiar with JSON Path.  Attempting to do this without knowing basic JSON protocols may result in workflow errors.
{% endhint %}

This is the 'clone workset' activity, and here the URL has been modified.  The original version is  [http://localhost:8080/core/1.0/API/workSet/clone/68126a9d68da6160327aa80c?name=api3\_clone\_workset](http://35.214.71.106:8080/core/1.0/API/workSet/clone/68126a9d68da6160327aa80c?name=api3_clone_workset). &#x20;

The modified version of the URL, using the parameters for both filtering results and passing data, is [http://localhost:8080/core/1.0/API/workSet/clone/extract(act\_res\[retrieve\_worksets\],$\[?(@.name==wf\_params\[name\]&&@.version==wf\_params\[version\])\].id)?name=wf\_params\[cloned\_name\]](http://localhost:8080/core/1.0/API/workSet/clone/extract\(act_res\[retrieve_worksets],$\[?\(@.name==%27wf_params\[name]%27&&@.version==%27wf_params\[version]%27\)].id\)?name=wf_params\[cloned_name])&#x20;

The first part of this is the filtering command, which is [extract(act\_res\[retrieve\_worksets\],$\[?(@.name==wf\_params\[name\]&&@.version==wf\_params\[version\])\].id)](http://localhost:8080/core/1.0/API/workSet/clone/extract\(act_res\[retrieve_worksets],$\[?\(@.name==%27wf_params\[name]%27&&@.version==%27wf_params\[version]%27\)].id\)?name=wf_params\[cloned_name]).  In the original call, this section of the URL is '[68126a9d68da6160327aa80c](http://35.214.71.106:8080/core/1.0/API/workSet/clone/68126a9d68da6160327aa80c?name=api3_clone_workset)', which is the workset ID that was retrieved in the 'get all worksets' API call.    Here we are giving the following instructions in the URL:

* extract - find this data in the results of the referenced call
* act\_res - activity response, or which activity to pull the response from.
* \[retrieve\_worksets] - this is the specific activity to get the response from.
* @.name ==wf\_params\[name] - find this workset name in the response
* @.version==wf\_params\[version] - find this workset version in the response
* id = when the specified workset name and version are found in the response, return the 24 digit ID for that workset

<figure><img src="../../../../../.gitbook/assets/image (1037).png" alt=""><figcaption><p>Using parameters for filtering in the URL</p></figcaption></figure>

In the last part of the call, we are simply passing the parameter name instead of the cloned workset name. &#x20;

In the original call, this section is [?name=api3\_clone\_workset](http://35.214.71.106:8080/core/1.0/API/workSet/clone/68126a9d68da6160327aa80c?name=api3_clone_workset)  (name the new workset 'api3\_clone\_workset')  and this has been replaced with [?name=wf\_params\[cloned\_name\]](http://localhost:8080/core/1.0/API/workSet/clone/extract\(act_res\[retrieve_worksets],$\[?\(@.name==%27wf_params\[name]%27&&@.version==%27wf_params\[version]%27\)].id\)?name=wf_params\[cloned_name]) (name the cloned workset using the value entered by the user at the start of workflow execution).

When you execute a workflow with user defined parameters, you will be prompted to enter those values at the start of the run.  Required fields are noted with an asterisk to the left of the parameter name.

<figure><img src="../../../../../.gitbook/assets/image (1038).png" alt=""><figcaption><p>Enter parameters window</p></figcaption></figure>
