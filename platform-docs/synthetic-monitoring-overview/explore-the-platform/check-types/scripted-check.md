# Scripted Check

* Introduction
  * Why Use a Scripted Check?
  * Scripted Check Overview
* Creating an Example Scripted Check
  * 1\. Scripting the Check
    * Import Libraries (as needed)
    * Set the URL Request
    * Add JSON format
    * Expanding the Returned values
    * Advanced JSON
    * About Adding JSON Return Values
    * Adding More Values
  * 2\. Uploading the Check to a Repository
  * 3\. Uploading and Running the Check in ASM
    * Open ASM
    * Add Script via Run Python.
    * Creating a Run Python Check, Step 1
    * Run Python Step 2
    * Step 3 Interval, Thresholds & Monitor Groups
    * Confirm Your Check
    * Check Created
    * Check Details Page
    * Check Results
    * Drill down
    * Messaging via JSON
  * 3\. Interpreting the Check Results in ASM
    * Open ASM
    * Select the Target check for the API
    * Postman Results of Standard API Check Endpoint
    * Apica API for Generic Results
    * Postman Results of Generic API Check Endpoint
    * The Result Object
* Appendix
  * Adding a Custom Python or NodeJS Module to ApicaNet for use with Scripted Checks
  * Testing a Script on the Executing Agent Itself

## Introduction <a href="#scriptedcheck-introduction" id="scriptedcheck-introduction"></a>

Apica's "Scripted Checks" are ASM checks written in several scripting languages. So, instead of needing a custom scripting tool or a proprietary scripting format, developers and monitoring teams can use familiar languages to create their custom monitoring scripts and metrics for the long-term understanding of their applications.

Video versions of this guide are available on the Apica Systems YouTube account here: [https://www.youtube.com/playlist?list=PL7P4sd6wT60B5JAxU3l3Rzjhf7v01lqQz](https://www.youtube.com/playlist?list=PL7P4sd6wT60B5JAxU3l3Rzjhf7v01lqQz)



### Why Use a Scripted Check? <a href="#scriptedcheck-whyuseascriptedcheck" id="scriptedcheck-whyuseascriptedcheck"></a>

If you are in a DevOps shop, you can use the DevOps Toolchain that you might already have in place. If you've got the resources to write and edit Java, Python, or JavaScript, you can create a long-term global script for ASM without needing a unique scripting tool or proxy setup. If you know what URLs you want to monitor, this allows you to become less reliant on proprietary scripting solutions and also frees these script languages from being unable to do more than a test application performance from a single QA/developer machine.

### Scripted Check Overview <a href="#scriptedcheck-scriptedcheckoverview" id="scriptedcheck-scriptedcheckoverview"></a>

The term “Scripted Check” refers to checks which run scripts which customers create on their own and upload to the ASM Platform for monitoring. Currently, Java, Python, JavaScript, and AWS Lambda scripts are supported within ASM. Scripts may be stored and uploaded to an HTTP server or GitHub repository. When you download a script for execution, you must specify either the HTTP URL or the GitHub Repo URL.

Note: this page will cover only the GitHub repository method of script uploading and storage.

1. Setup GitHub to store the scripts.
2. Script the check (in Java, Python, or JavaScript)
3. Upload the Script into GitHub.
4. Create the ASM Check to any one of Apica's global agents on the Apica Monitoring Platform.
5. Collect, compare and analyze the ASM Check Results OR send the results to integrated systems that use ASM as a data source.

## Creating an Example Scripted Check <a href="#scriptedcheck-creatinganexamplescriptedcheck" id="scriptedcheck-creatinganexamplescriptedcheck"></a>

The following guide utilizes Python code, but the workflow can apply to Java checks, JavaScript checks, or any other Scripted check type.

### 1. Scripting the Check <a href="#scriptedcheck-1.scriptingthecheck" id="scriptedcheck-1.scriptingthecheck"></a>

Next is a simple example of writing your script and running it in ASM.

We will be coding a straightforward Python check for its use in ASM. This Python check will call a URL that we specify, and it will return the response that we received from this URL.

<table data-header-hidden><thead><tr><th></th><th></th></tr></thead><tbody><tr><td><strong>Step</strong></td><td><strong>Screenshot</strong></td></tr><tr><td><h4 id="scriptedcheck-importlibraries-asneeded">Import Libraries (as needed)</h4><p><code>import requests</code></p><p><code>import sys</code></p><p><code>import JSON</code></p><p><code>import time</code></p><p>After Python is up, import the <strong>requests</strong> {a library for doing any URL call}, <strong>sys</strong>, <strong>JSON</strong>, and <strong>time</strong> libraries into the virtual environment.</p><p>See <a href="https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2135393547/Scripted+Check#7.-Appendix">https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2135393547/Scripted+Check#7.-Appendix</a> for instructions on using a custom module within your script.</p></td><td><p></p><p> </p></td></tr><tr><td><h4 id="scriptedcheck-settheurlrequest">Set the URL Request</h4><p>Set the URL call to be an argument.</p><p>Make a GET request against that URL.</p><p>The response will need to set a default URL to call, if we don't have an argument. Set exceptions as '<strong>e</strong>'. and The URL will be <a href="http://google.com">http://google.com</a>.</p><p>Our script returned a 200 status code. Our script will call either <a href="http://google.com">http://google.com</a> or a URL that we provide.</p></td><td><pre><code>  try:
        url = sys.argv[1]
except Exception as e:
       url = 'https://google.com'

response = requests.get (url)
print (response.status_code)  url = sys.argv[1)
</code></pre><p></p></td></tr><tr><td><h4 id="scriptedcheck-addjsonformat">Add JSON format</h4><p>What JSON format does Apica’s back-end system expect? Apica’s back-end is based on MongoDB.</p><p>MongoDB allows us to have an expandable result format. So that's a result format that you can upload almost anything to, and it will become a part of the result.</p><p>We have the <strong>start</strong> and <strong>end times</strong> that we need. So the start and end times will be the start and end times of your check in ASM (These will show up in the check Result view in ASM).</p><ul><li>Set <code>start_time = time.time()</code>.</li><li>Set <code>end_time = time.time()</code>.</li></ul><p>Note: we're doing the <code>start_time</code> before our URL call and the <code>end_time</code> at the end of our URL call. This measures the time it takes to call this URL.</p><p><em><strong>Set a message</strong></em>. So our message is “<em>URL call returned status code”</em>, then adds a string response (the returned status code) the value that you see here, in the JSON format, it will be the value of the results.</p><p>So this is the main value that you will see. Usually, it's the duration, but it could be anything. To show this, let's say that it's the status code, because this is what we're saying in the message. So we'll set it to <code>response.status.code</code>.<br>After running this, we have our JSON output; by itself, a valid result.</p></td><td><pre><code>  try:
        url = sys.argv[1]
except Exception as e:
       url = 'https://google.com'

start_time = time.time()
response = requests.get (url)
end_time time. time()

json_return = (
 "returncode": 0,
 "start_time": start_time,
  "end_time": end_time,
  "message": "URL call returned status code: " + str(response.status_code),
  "unit": "ms",
  "value": response.status.code,
}
 
print(json.dumps(json_return))
</code></pre><p> </p><p> </p><p> </p><p> </p><p> </p><p> </p><p> </p><p> </p><p> </p><p></p><p> </p></td></tr><tr><td><h4 id="scriptedcheck-expandingthereturnedvalues">Expanding the Returned values</h4><p>Let's expand this a little bit; we have an expandable JSON format, so let's give ourselves more content and data.</p><p><em>How many headers do we have here?</em></p><p><em>What is the length of the returned content?</em></p><p>Add these lines below the "value" (line 16 above) to return the response header count and the size of the content.</p></td><td><p><code>"header_count": Len(response. headers),</code></p><p><code>"content_size": len(response.content)</code></p><p> </p><p></p></td></tr></tbody></table>

Although simple, the above is a perfectly valid example of a Python Scripted Check. It uses Python standard libraries and the 'requests' library, included in the Apica Scripted Check Private Agent installation.

Apica's Scripted Checks are very flexible; if your script requires additional Python libraries, you may simply add those libraries to your Scripted Check Private Agent.

#### Advanced JSON <a href="#scriptedcheck-advancedjson" id="scriptedcheck-advancedjson"></a>

Some additional points to the previous steps.

| **Step**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | **Screenshot**                                                                                                                                                              |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <h4 id="scriptedcheck-aboutaddingjsonreturnvalues">About Adding JSON Return Values</h4><p>When we simply added some values into the JSON, we could have added any sort of content that you want to include. In the previous case, we added these:</p><p><code>"header_count": len(response.headers),</code></p><p><code>"content_size": len(response.content)</code></p><p> </p>                                                                                                                                                 |                                                                                                                                                                             |
| <h4 id="scriptedcheck-addingmorevalues">Adding More Values</h4><p>A very powerful concept that Apica supports with Scripted Checks: <em>Add more fields to add more values.</em></p><p>Let’s capture the headers coming out of our response by creating another field and calling it '<code>headers</code>.' This is going to be an actual inner JSON object that contains our headers.</p><p>Add <code>dict_response.headers</code> and rerun the check. The result shows that we have our header, JSON, inside this field.</p> | <p></p><p>Anything that JSON supports is supported in this result format. So you can add lists, inner dictionaries, null values, integers, booleans, etc. to this JSON.</p> |

Test your check locally before uploading to a repository which is linked to ASM. If you have a private agent with the necessary software installed and are planning to run the script on that agent, it is possible to test the script locally on the agent before uploading to your repository. See [https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2135393547/Scripted+Check#Testing-a-Script-on-the-Executing-Agent-Itself](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2135393547/Scripted+Check#Testing-a-Script-on-the-Executing-Agent-Itself) for more information.

### 2. Uploading the Check to a Repository <a href="#scriptedcheck-2.uploadingthechecktoarepository" id="scriptedcheck-2.uploadingthechecktoarepository"></a>

When you have finished writing the check and testing locally, upload the check to a repository which has been linked to ASM. See Manage Repository Profiles for instructions on linking a repository for use within ASM. A repository can be added directly via the check creation wizard, when editing the check via the Edit Check page, or within the “Manage > Repository Profiles” page on the top ASM navigation bar.

### 3. Uploading and Running the Check in ASM <a href="#scriptedcheck-3.uploadingandrunningthecheckinasm" id="scriptedcheck-3.uploadingandrunningthecheckinasm"></a>

When the script is complete and uploaded to your repository profile, you are ready to create a Scripted check in ASM in order to utilize the script.

You MUST select either “+1 Stockholm, Sweden, \[amazon] or a private agent with the correct software installed when selecting an agent location. See “Run Python Step 2” for more information.

<table data-header-hidden><thead><tr><th></th><th></th></tr></thead><tbody><tr><td><strong>Step</strong></td><td><strong>Screenshot</strong></td></tr><tr><td><h4 id="scriptedcheck-openasm">Open ASM</h4><p>Navigate to <strong>New Check+</strong></p></td><td></td></tr><tr><td><h4 id="scriptedcheck-addscriptviarunpython">Add Script via Run Python.</h4><p>The Run Python Scripted Check type icon should be displayed. If you don't have this, you may need to get it unlocked. Please ask your sales team for access because this is a more advanced check, not available for customers by default.</p></td><td></td></tr><tr><td><h4 id="scriptedcheck-creatingarunpythoncheck-step1">Creating a Run Python Check, Step 1</h4><p>Enter "New Test Check." Add any description and relevant tags, and then click <strong>Next</strong>.</p></td><td></td></tr><tr><td><h4 id="scriptedcheck-runpythonstep2">Run Python Step 2</h4><p>Configure this check</p><ul><li><strong>Resource URL/Github URL</strong></li><li><strong>Resource Auth Type</strong></li><li><strong>Resource Auth</strong></li><li><strong>Resource Path</strong></li><li><strong>Secondary Resource</strong></li><li><strong>Script Runner</strong> </li><li><strong>Script Arguments</strong></li><li><strong>Location</strong></li></ul><ul><li>Note that the agent will delete any local files you create after running your script. Any sensitive data written to local files during script execution is deleted at the end of execution.</li></ul></td><td><p></p><p><strong>Resource URL/Github URL:</strong> This answers the question, <em>"Where do we find your script?"</em> This could be an HTTP download link, or it can be to your GitHub repository. For this example, go to your repository and copy+paste the URL here, ending with the branch (<code>master/main</code>). Ours is <strong>main</strong>.</p><p>Enter the URL that this script resides at. In this example, it resides in a GitHub Repo at <code>https://github.com/[username]/NewTestRepository/main</code></p><p><strong>Resource Auth Type:</strong> This type of resource authorization will be needed, GitHub or HTTP. This example uses GitHub. But if you have your file on an HTTP server, you could use HTTP as the type.</p><p><strong>Resource Auth: Resource authorization is required</strong>. The authorization header allows you to download resources.</p><ul><li><p>It's a basic authorization header when your resource authorization type is HTTP.</p><ul><li>If you have an HTTP server with no protection, you may do it that way, but Apica <em>does not recommend it</em> because it's not secure.</li></ul></li><li><p>If your auth type is GitHub, this form <code>&#x3C;USERNAME>:&#x3C;TOKEN></code>.</p><ul><li>Remember, the token is the Personal Access Token that we created back in the first step [it can also be empty if your repository is public].</li><li>Example if your username is foobar: <code>foobar:ghp_JlvGv7PGTrAzI2LWVIQZDhRthYBBQI1TGl0J</code></li></ul></li></ul><p>Resource Auth Best Practice</p><p>To set the Resource Auth, remember that it is a hidden field, so you won't be able to see anything you type here. Apica recommends taking your username as your username without the email domain and then assembling it with the colon and Personal Access Token so you can see it in another location.</p><p>For example: if your GitHub username is <a href="mailto:foobar@gmail.com">foobar@gmail.com</a>, your username will be 'foobar,' without @gmail.com.</p><p>Then append the colon ':.'</p><p>Finally, add the Personal Access Token, and your resource authorization looks like this and is ready to copy into that field:</p><p><code>foobar:ghp_JlvGv7PGTrAzI2LWVIQZDhRthYBBQI1TGl0J</code></p><p><strong>Resource Path:</strong> This is the path inside your repository to the scripts you want to run. Our example scripts are just in the base level repository, so enter <code>main.py</code></p><p><strong>Secondary Resource:</strong> If your script requires any sort of additional files, you can use this secondary resource to download another file. However, you can also start your script off by downloading the file directly: That way, you can use any sort of security you want to protect it. For example, you could have a secondary resource, like a certificate protected by OAuth: Your script could go through the whole OAuth process and then use the local file.</p><p>In this example, the secondary resource will be blank because it is unnecessary.</p><p>It is possible to reference subfolders from a base directory using the “Secondary Resource” field. For instance, if your use case requires a “/python/main.py” file and main.py depends on a module defined in /python/modules, you can specify /python, and the check runner will recognize the module because it is able to “search” the /python folder for secondary resources.</p><p>For example, if “local_module_sample.py” depends on a subfolder in /python, you can specify the project like so:</p><p></p><p><strong>Script Runner:</strong> Python is pre-selected (as the only choice).</p><p><strong>Script Arguments:</strong> These will be provided if we enter them on the command lines. Enter <code>http://example.com</code> So, we will pass this argument to our script.</p><p><strong>Location: you </strong><em><strong>must</strong></em><strong> use either the “+1 Sweden, Stockholm, [amazon]” location OR a private agent with the necessary software installed to run the check! Not all check locations have the necessary software required to run the check.</strong></p><p>Consult <a href="mailto:support@apica.io">Apica Support</a> or your TAM if you would like more information on running Scripted Checks on a private agent.</p></td></tr><tr><td><h4 id="scriptedcheck-step3interval-thresholds-and-monitorgroups"><strong>Step 3 Interval, Thresholds &#x26; Monitor Groups</strong></h4><p>In this example, we will be creating a manual check.</p><p>Select an interval, if needed, and check the groups you want this check to be a part of.</p><p>Click <strong>Next</strong>.</p></td><td></td></tr><tr><td><h4 id="scriptedcheck-confirmyourcheck">Confirm Your Check</h4><p>A Confirmation Page will be displayed for you to either go <strong>Back</strong> to edit it or <strong>Create</strong> to continue.</p><p>If you are satisfied, you click <strong>Create</strong> to create the check.</p></td><td></td></tr><tr><td><h4 id="scriptedcheck-checkcreated">Check Created</h4><ul><li>Uncheck <strong>Enable Failover</strong> (which is checked by default) because we don't want to have that enabled right now, as this is just for demo purposes.</li><li>Set the max attempts to 1 because we want the check to fail quickly for the test.</li><li>Click <strong>Save</strong>.</li></ul><p>Apica generally recommends these settings for <strong>testing</strong> because what can happen is too long with the default behaviors. If Max Attempts remains at three and the <strong>Attempt Pause</strong> for each attempt is 30 seconds, this means that your test check could wait up to 90 seconds if it's failing. And so these settings don't help when trying just to debug something; it's better to have the information that your check failed <em>from the beginning</em>.</p><p>Click the <strong>Check Details</strong> button in the upper right as we're ready to run our check.</p></td><td></td></tr><tr><td><h4 id="scriptedcheck-checkdetailspage">Check Details Page</h4><p>The Check Details page has a section called "<strong>Status Last 24 Hours,</strong>" and beneath that will be a "<strong>Run Check</strong>" icon. Click to run manually.</p></td><td></td></tr><tr><td><h4 id="scriptedcheck-checkresults">Check Results</h4><p>In this example, we set the “Last Value” to the status code by assigning it to the variable “value” in the script.</p></td><td><p></p><p> </p><p> </p></td></tr><tr><td><h4 id="scriptedcheck-drilldown">Drill down</h4><p>Drilling into these results, we see the Result value (ms) is 200 because, even though the typical value for a result is the number of milliseconds it took to respond, we specified in our JSON that the value would be the <em><strong>response status code</strong></em>, so the 200 is displayed in its place. The number of Attempts is shown as 1, and beneath the <strong>result, code</strong> is the JSON that we specified:</p></td><td><p></p><pre><code>json_return = {
    "returncode": 0,
    "start_time": start_time,
    "end_time": end_time,
    "message": "URL call returned status code: " + str(response.status_code),
    "unit": "ms",
    "value": response.status_code,
    "headed count": len(response.headers),
    "content_size": len(response.content),
    "headers": dict(response.headers)
}
</code></pre></td></tr><tr><td><h4 id="scriptedcheck-messagingviajson">Messaging via JSON</h4><p>From <strong>Returned Value Table View</strong>, note the message it says URL call return status code 200. But this is the message that we sent inside of our JSON. So message when you set it will be placed here.</p><p>So you can record any data you like, and it will show up here.</p></td><td></td></tr></tbody></table>

Any metrics data that you want to record, you can keep for any data mining.

Results are stored for 13 months. So you'll have this data over a long time. It's a potent tool to make your customized results and even retrieve them in your front end.

In the next section, we will review how to retrieve your check information through the API.

### 3. Interpreting the Check Results in ASM <a href="#scriptedcheck-3.interpretingthecheckresultsinasm" id="scriptedcheck-3.interpretingthecheckresultsinasm"></a>

After creating our new check, using a Python script that we uploaded into GitHub, we know that the script presents the HTTP status code of the URL called as the value of the result in ASM. Next, we will use the ASM API to get information about this check.

&#x20;

| **Step**                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | **Screenshot**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <h4 id="scriptedcheck-openasm.1">Open ASM</h4><p>Navigate to <strong>Tools, API</strong></p><p>Select a check using the drop-down box</p>                                                                                                                                                                                                                                                                                                                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| <h4 id="scriptedcheck-selectthetargetcheckfortheapi">Select the Target check for the API</h4><p>We've selected the Test Demo check. Beneath that check selection is some example API calls to help you get started quickly.</p><p>We've copied the Last Result call pasted it into Postman to run it.</p>                                                                                                                                                                       | <p></p><p> </p><p></p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| <h4 id="scriptedcheck-postmanresultsofstandardapicheckendpoint">Postman Results of Standard API Check Endpoint</h4><p>Here, via API, is the last value of your check run, 200.</p>                                                                                                                                                                                                                                                                                              | <p></p><p>200 is the last status code of the URL. This is nice but is just a raw number without data or context, and there's no JSON used. This could be used just for a small script or something you can pull the last result of your check maybe test it for something.</p><p>A better API endpoint is the Checks Generic Check ID Results API endpoint.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| <h4 id="scriptedcheck-apicaapiforgenericresults"><a href="https://api-wpm.apicasystem.com/v3/Help/Route/POST-checks-generic-checkId-results">Apica API for Generic Results</a></h4><p>This API endpoint looks up the results for checks that present a result type of <strong>generic</strong>. '<em>Generic'</em> checks mean that they have the expandable JSON result format we saw in Step 5 above.</p>                                                                     | <p></p><p>Generic type Checks: Run Python scripts, Run Javascript, Run Java, and (when released) Run Azure Cloud, Run Lamda, etc.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| <h4 id="scriptedcheck-postmanresultsofgenericapicheckendpoint">Postman Results of Generic API Check Endpoint</h4><p>In Postman, using this API endpoint:</p><p><code>https://api-asm1.apica.io/dev/Checks/generic/43454/results?</code></p><p><code>auth_ticket=18FFE***-****-****-****-****0DCO</code></p><p>Instead of the earlier (for comparison):</p><p><code>https://api-asm1.apica.io/dev/Checks/49454/lastvalue?auth_ticket=18FFE***-****-****-****-****0DCO</code></p> | <p>The <a href="https://api-wpm.apicasystem.com/v3/Help/Route/POST-checks-generic-checkId-results">API documentation for Generic Check</a> shows these capabilities:</p><ul><li><p>Set a filter with a range</p><ul><li>Return the most recent results</li><li>Return results that occurred in between defined two-millisecond values that, for example, answer the question, "What results came in between 1.2 and 2.3 seconds?"</li></ul></li><li>Define a period to query (between two UTC stamps)</li><li>Return specific results IDs.</li></ul><p>This is a POST endpoint:</p><p></p><p>Note the JSON results returned above. So you may need to use these in some other API call to lookup even more information. In this example, we're just going to use the most recent because that is the simplest and easiest to show.</p> |
| <h4 id="scriptedcheck-theresultobject">The Result Object</h4><p>Note the headers that returned and (not shown in the screen capture) the content size, the header count, etc. All of the information you recorded in your script comes through the API.</p>                                                                                                                                                                                                                     | <p></p><p>What you choose to do next with these metrics is all up to your needs.</p><ul><li>You could create a script that scrapes this URL every once in a while, looks up to the last hour of results, and parses the JSON for data that you need.</li><li>You could even create another check that would read this information and then crunch the data to present other results, e.g., the average size of the headers or content length.</li><li>There is much more, only limited by your use cases.</li></ul>                                                                                                                                                                                                                                                                                                                    |

**Review:**

1. We've scripted our check (in this example, Python).
2. We've uploaded a script to GitHub.
3. We’ve created our ASM check using a script in a GitHub repository.
4. We've run our check in ASM and viewed the results.
5. We've pulled the results for the API, including the custom JSON.

## Appendix <a href="#scriptedcheck-appendix" id="scriptedcheck-appendix"></a>

### Adding a Custom Python or NodeJS Module to ApicaNet for use with Scripted Checks <a href="#scriptedcheck-addingacustompythonornodejsmoduletoapicanetforusewithscriptedchecks" id="scriptedcheck-addingacustompythonornodejsmoduletoapicanetforusewithscriptedchecks"></a>

Adding a custom python or node.js module to your private Browser agent is very simple and should take less than 5 minutes. This guide assumes you have administrator access to your agent or have an operations team that will perform these steps for you.

1. Determine the modules you need to install and log in to the private Browser agent.
2.  The worker runs apicanet in a chroot shell. This means you cannot simply run the following commands but must enter a chroot shell. To do this, run the following command:\


    ```
    /opt/asm-browser-agent/chroot_shell.sh
    ```

    &#x20;
3. You should now be in a chroot shell. From here, you may interact with pip3 and npm (package managers for python 3.5 and nodejs).
4.  Install the necessary packages by running the following commands:\


    ```
    # Node modules should be installed to the global scope.
    npm install -g <PACKAGE_NAME>

    # Python install command, ensure you use pip3, you should not touch the python2.7 install
    # The python2.7 install is used by ApicaNet itself.
    pip3 install <PACKAGE_NAME>
    ```

    &#x20;
5. Your packages are now installed and ready to use. If you wish, you can even test your script by opening a new shell instance and copying your script to /opt/asm-browser-agent/embedded/. You may then run your script in the chroot environment by using “node“ or “python3”. The script you placed in /opt/asm-browser-agent/embedded should be in the root folder of the chroot environment.

Tip: It’s a good idea to have 2 terminal windows open when testing; otherwise, it can be difficult to switch between the chroot and non-chroot windows in order to update and test your script. Alternatively, you can use scp (the [secure copy command](https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files/)) to copy from your local computer to /opt/apicanet-worker/embedded/.

### &#x20;Testing a Script on the Executing Agent Itself <a href="#scriptedcheck-testingascriptontheexecutingagentitself" id="scriptedcheck-testingascriptontheexecutingagentitself"></a>

If you are running a script from a private agent, It is possible to run it locally in order to ensure that all packages are installed in the correct location and that no syntax errors, etc. are present. It is an excellent step to use when troubleshooting Python checks which are not running correctly.

1. Copy the script onto `/opt/asm-browser-agent/embedded` on the agent itself
2. `cd ../` into /opt/asm-browser-agent
3. run `./chroot_shell.sh` (you can see this shell script if you run ls)
4. The script you copied into `/opt/asm-browser-agent/embedded` should be in the root folder. Run `ls` to verify.
5. You can run the script from the chroot shell using “node” or “python3”. Use the output to verify that the check is working without issue.
