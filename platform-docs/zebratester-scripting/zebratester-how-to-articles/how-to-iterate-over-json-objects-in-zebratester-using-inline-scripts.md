# How to iterate over JSON objects in ZebraTester using Inline Scripts

During ZebraTester scripting you may encounter a use case in which you’d like to iterate or loop through a list of JSON objects, especially if there’s information / data that you’d like to run through another request. Instead of hardcoding each request with the required data, we can request the initial list of objects and iterate through it to loop the next request based on the number of objects.

This process requires basic knowledge of inline scripts and the ZT Basic scripting syntax. See 7. Custom Scripting - Inline Scripts for more information. The ZT Basic scripting manual pertinent to your ZebraTester version can be found in the “Documentation” subfolder within the root folder of your local ZebraTester installation.

## Setup <a href="#howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-setup" id="howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-setup"></a>

**Request 1: (R1)** [https://api-wpm.apicasystem.com/v3/Help/Route/GET-checks\_enabled\_severity\_include\_tag\_op](https://api-wpm.apicasystem.com/v3/Help/Route/GET-checks_enabled_severity_include_tag_op)

* Simple GET request from ASM that fetches all available Checks for your user
  * These checks are displayed as individual JSON objects within the JSON response
  * In this guide we’re not using any of the additional parameters
    * Example: [https://api-wpm2.apicasystem.com:443/v3/checks/?auth\_ticket=](https://api-wpm2.apicasystem.com/v3/checks/?auth_ticket=)

**Request 2: (R2)** [https://api-wpm.apicasystem.com/v3/Help/Route/GET-checks-checkId-metadata](https://api-wpm.apicasystem.com/v3/Help/Route/GET-checks-checkId-metadata)

* Simple GET request that fetches the metadata for an individual check, based on the check ID
  * We will iterate/loop this request based on amount of objects in **R1** and for each iteration we will use the next available check ID.
  * Example: [https://api-wpm2.apicasystem.com/v3/checks/{checkid}/metadata?auth\_ticket=](https://api-wpm2.apicasystem.com/v3/checks/%7Bcheckid%7D/metadata?auth_ticket=)
    * In this test we will replace {checkid} with the actual ID on each iteration

## Step 1: Record your requests <a href="#howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step1-recordyourrequests" id="howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step1-recordyourrequests"></a>

As with any other ZebraTester script, we need to record / add the requests we want to execute during the test. This requires no particular set up, but we will make some adjustments to make the requests more dynamic for next steps.



Page breaks will be used for looping, but are not necessary as you can do URL loops instead. In this example, we are using Page breaks simply to visualize the different steps / requests.

**Optional:**

To make the script look and feel more dynamic, we can replace the recorded Check ID on **R2** with a variable to understand what we’re replacing in the request. To do this, we can edit the request from the Var Handler:



In the Full Path field, we can change the recorded check ID to something more dynamic for later use (essentially whichever value we will replace later on)

**Before:**



**After:**



## Step 2: Save the R1 content as a JSON <a href="#howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step2-savether1contentasajson" id="howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step2-savether1contentasajson"></a>

As the JSON response can’t directly be saved as a correct JSON, we need to save it as one using an inline script. We will create two new variables in this inline script:

* `jsonresponse`
  * This variable will contain the full JSON response now saved as a correct JSON by adding a “top key” called placeholder.
* `jsonsize`
  * This variable will contain an integer which we will later use to determine amount of loops needed
    * This integer is based on the number of objects/items within the placeholder key (in this case, the amount of checks we have available in the response from **R1**).

This inline script has to be executed after URL 1 in this case, or after the specific URL in your test case.



**Code:**

```
jsonresponse = "{\"placeholder\":" + getHTTPResponseContent() + "}"

jsonsize = jsonArraySize(jsonresponse,"placeholder")
```

## Step 3: Create iteration variable <a href="#howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step3-createiterationvariable" id="howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step3-createiterationvariable"></a>

Before we move on to iterating through the JSON content, we need to determine which iteration we’re actually on. A simple way of doing this is to have a variable that increases in value for each iteration.



## Step 4: Create iteration <a href="#howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step4-createiteration" id="howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step4-createiteration"></a>

Now that we have our complete JSON together with the iteration variable, we can create the logic behind the iteration that will take place on each loop. When we have a correctly formatted JSON object, we can use the inline function “jsonGetData” to get the data we require for the loop, this uses a JSONpath to fetch the data. From our jsonresponse content, we want to fetch every iteration of “id”:



```
checknumber = jsonGetData(jsonObject,"placeholder."+iteration+".id")

iteration = iteration + 1
```

And for every iteration we add “1” to the iteration variable as preparation for the next iteration; as you can see, we use this variable to extract the correct iteration from the JSON content.

Of course, the JSONpath might differ depending on the structure of content from R1. You can use tools such as [https://jsonpathfinder.com/](https://jsonpathfinder.com/) to quickly find the path you require.

## Step 5: Replace original request with current Check ID <a href="#howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step5-replaceoriginalrequestwithcurrentch" id="howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step5-replaceoriginalrequestwithcurrentch"></a>

If you performed the optional step in Step 1, you will remember the {CheckID} variable that we created to make the script look more dynamic. This is where we want to replace this value with the checkID that was created from the inline script in Step 4.



This allows us to replace the original value from the request with our generated variable value instead.

The principle is similar if you instead need to replace the value in a POST body or header value, for example. In this particular example, the value is based in the URL.

## Step 6: Set your inner loop <a href="#howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step6-setyourinnerloop" id="howtoiterateoverjsonobjectsinzebratesterusinginlinescripts-step6-setyourinnerloop"></a>

In order to actually loop **R2** as many times as we have objects in the JSON content, we need to create an inner loop for the 2nd page break.



As you remember, the variable “jsonsize” is set to an integer that is based on the amounts of checks/objects we had available in the response from **R1**. This will define the amount of time we need to loop **R2** in order to iterate through all available objects.

The process is now complete! When we execute this script, **R1** will execute once, and we will save the response content as a correct JSON. Before executing **R2,** we will determine the next object to be used in the URL and we will loop this as many times as there are objects in our JSON.
