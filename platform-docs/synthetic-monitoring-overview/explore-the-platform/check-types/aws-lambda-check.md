# AWS Lambda Check

* 1\. Intro to Lambda Computing
  * Use Case for an AWS Lambda check.
    * Powerful: AWS Lambda has many runtimes available.
    * Other Reasons to Use the AWS Lambda check
    * AWS SDK for Python (Boto3)
* Lambda Check Overview
* 2\. Coding Lambda
  * Import Libraries
    * Define the Main Function
    * Scripting the Check
    * The finished script
    * Running the check
* 3\. AWS Setup
  * Get into the AWS Lambda Service
  * Create New Lambda Function
  * Configure the Function
  * Permissions
  * Create Function
  * Import Your Script
  * Create Test Event
  * Deploy the AWS Changes, Test
  * Edit Runtime Handler
  * Test
* 4\. Adding a JSON Event
  * Add an Event Field
* 5\. ASM Check Creation
  * Step 1: Name, Description, and Tags
  * Step 2a: Command and location
  * Step 2b: Command and location
  * Step 3: Interval, Thresholds, & Monitor Groups
  * Create check
* 6\. Run Result

## 1. Intro to Lambda Computing <a href="#awslambdacheck-1.introtolambdacomputing" id="awslambdacheck-1.introtolambdacomputing"></a>

This page is a step-by-step guide to using the AWS Lambda check type.

From [What is AWS Lambda?](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)

Lambda is a compute service that lets you run code without provisioning or managing servers. Lambda runs your code on a high-availability compute infrastructure and performs all of the administration of the compute resources, including server and operating system maintenance, capacity provisioning and automatic scaling, code monitoring, and logging. You can run code for virtually any application or back-end service with Lambda. All you need to do is supply your code in one of the [languages that Lambda supports](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html).



### Use Case for an AWS Lambda check. <a href="#awslambdacheck-usecaseforanawslambdacheck" id="awslambdacheck-usecaseforanawslambdacheck"></a>

#### Powerful: AWS Lambda has many runtimes available. <a href="#awslambdacheck-powerful-awslambdahasmanyruntimesavailable" id="awslambdacheck-powerful-awslambdahasmanyruntimesavailable"></a>

AWS Lambda functionality adds flexibility to the [Apica Scripted Checks](https://apica-kb.atlassian.net/wiki/spaces/A2/pages/2002649089). The Scripted Check Options have a pre-selected set of Runtime languages, listed below. Select the _**Run AWS Lambda**_ icon for additional languages beyond these to develop checks from language resources you already may have.

| **Apica's Scripted Checks**                                 | **Amazon Web Services Lambda Runtimes**                                                                                       |
| ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| <ul><li>Java</li><li>Python 3+</li><li>JavaScript</li></ul> | <ul><li>Node.js</li><li>Python</li><li>Ruby</li><li>Java</li><li>Go</li><li>.NET Core</li><li>C#</li><li>PowerShell</li></ul> |

With AWS Lambda, you could use any one of these services to create your new ASM check.

Additionally, you can use [Lambda container images](https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html) to provide your Elastic Container, the runner for this check.

#### Other Reasons to Use the AWS Lambda check <a href="#awslambdacheck-otherreasonstousetheawslambdacheck" id="awslambdacheck-otherreasonstousetheawslambdacheck"></a>

Example: You have a very secure Virtual Private Cloud where no traffic is allowed inside, and perhaps you don't want to use a private Apicanet agent. You can spawn your Lambda execution inside your secure VPC and take full advantage of the AWS permissions model. You could use it to give your Lambda access to additional services such as databases or an AWS secret store.

#### AWS SDK for Python (Boto3) <a href="#awslambdacheck-awssdkforpython-boto3" id="awslambdacheck-awssdkforpython-boto3"></a>

Get started quickly using AWS with [Boto3](https://github.com/boto/boto3), the AWS SDK for Python. Boto3 makes it easy to integrate your Python application, library, or script with AWS services, including Amazon S3, Amazon EC2, Amazon DynamoDB, and more.

In our next section, we'll step through writing a very simple Python Lambda. And we will then add it into our ASM account and then run it and see the results.

## Lambda Check Overview <a href="#awslambdacheck-lambdacheckoverview" id="awslambdacheck-lambdacheckoverview"></a>

1. Establish an [AWS Lambda Account](https://aws.amazon.com/lambda/).
2. Prepare by importing the Libraries your script will need.
3. Create the AWS Lambda Function, which the ASM Check will call for execution.
   1. Define the Main Functions of the script.
   2. Script the check. (Note: You could use a [Scripted Check](https://apica-kb.atlassian.net/wiki/spaces/A2/pages/2002649089) here.)
   3. Create a New Lambda Function.
   4. Import Your Script into that Lambda Function.
4. Create the Lambda Event that ASM will display.
5. Create the AWS Lambda Check on any ASM-supported AWS Regions on the Apica Monitoring Platform.
6. Collect, compare and analyze the ASM Check Results OR send the results to integrated systems that use ASM as a data source.

## 2. Coding Lambda <a href="#awslambdacheck-2.codinglambda" id="awslambdacheck-2.codinglambda"></a>

For this AWS Lambda example, we will use Python to create the code for our cloud function. This example will be a simple Lambda; we will not be importing any libraries other than the default Python libraries.

Our goal is to create a check that returns a random value.

It appears simplistic, but this is to provide an example of creating a Lambda.

<table data-header-hidden><thead><tr><th></th><th></th></tr></thead><tbody><tr><td><strong>Step</strong></td><td><strong>Screenshot</strong></td></tr><tr><td><h3 id="awslambdacheck-importlibraries">Import Libraries</h3><p><code>Import random</code> because we need a random number.</p><p><code>Import time</code> because we're going to need to know the start and end times of our check execution for our check.</p></td><td><pre><code>import random
import time
</code></pre></td></tr><tr><td><h4 id="awslambdacheck-definethemainfunction">Define the Main Function</h4><p>We must keep track of the name of the main function. It needs to receive two things:</p><ol start="1"><li>An event</li><li>A context.</li></ol><p>These objects are passed from AWS Lambda when we configure it later.</p></td><td><pre><code>def main(event, context):
</code></pre></td></tr><tr><td><h4 id="awslambdacheck-scriptingthecheck">Scripting the Check</h4><p>This script will generate the dictionary, a list of values we will measure for further analysis.</p><ul><li>Generate a random value (<code>rand_value</code>) between 0 and 100.</li><li>Create <code>json_value</code> that will capture all the defined return values that we want: Return Code, time</li></ul><p>The expandable JSON result format will allow us to present a message with the generated random value, a unit of time measurement (milliseconds), and a Lambda function (set to True).</p></td><td><p>Important: if you've created a scripted check before, all you need to do is put the same thing into a Lambda.</p><p><code>rand_value = random.randint(0, 100)</code></p><pre><code>    json_value = {
        "returncode": 0,
        "start_time": time.time (),
        "end_time": time.time(),
        "message": f'Random value: {rand_value}.',
        "unit": "ms",
        "value": rand_value,
        “lambda": True
    }
</code></pre></td></tr><tr><td><h4 id="awslambdacheck-thefinishedscript">The finished script</h4></td><td><pre><code>def main(event, context):
    rand_value = random.randint(0, 100)
    json_value = {
        "returncode": 0,
        "start_time": time.time (),
        "end_time": time.time(),
        "message": f'Random value: {rand_value}.',
        "unit": "ms",
        "value": rand_value,
        “lambda": True
    }
    return json_value

 if __name__ == "__main__":
    main('', '')
</code></pre></td></tr><tr><td><h4 id="awslambdacheck-runningthecheck">Running the check</h4><p>The returned dictionary script finished here with an exit code of 0 but nothing else. But when we upload this to Lambda, we'll show you how to test it and make sure that everything is okay.</p></td><td></td></tr></tbody></table>

To add and use additional libraries in AWS Lambda, for example, add some additional Python packages, here's [a link that may get you started](https://aws.amazon.com/premiumsupport/knowledge-center/cloud9-deploy-lambda-external-libraries/). The AWS SDK for Python, [Boto3](https://aws.amazon.com/sdk-for-python/), is already included with your Python Lambda.

And the next step is uploading our script into AWS.

## 3. AWS Setup <a href="#awslambdacheck-3.awssetup" id="awslambdacheck-3.awssetup"></a>

Here, we will create the function, which will be called by our check inside the Amazon AWS UI.

| **Step**                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | **Screenshot**                                                                                                                               |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| <h4 id="awslambdacheck-getintotheawslambdaservice">Get into the AWS Lambda Service</h4><p>Log into your Amazon account enter Lambda in the Search field. If you have visited Lambda earlier, there should be a shortcut.</p>                                                                                                                                                                                                                                                | <p></p><p></p>                                                                                                                               |
| <h4 id="awslambdacheck-createnewlambdafunction">Create New Lambda Function</h4><p>Click <strong>Create Function</strong>.</p>                                                                                                                                                                                                                                                                                                                                               |                                                                                                                                              |
| <h4 id="awslambdacheck-configurethefunction">Configure the Function</h4><ul><li>Name it "DemoFunction"</li><li>Select the Runtime, <strong>Python 3.9</strong></li></ul>                                                                                                                                                                                                                                                                                                    |                                                                                                                                              |
| <h4 id="awslambdacheck-permissions">Permissions</h4><p>(Optional) Set your Lambda function to run with specific permissions for a specific existing (or new) role that has the rights that it needs to run correctly.</p>                                                                                                                                                                                                                                                   | <p></p><p>For example, if the function needs to access a relational database or other Amazon services, this is where you would set that.</p> |
| <h4 id="awslambdacheck-createfunction">Create Function</h4><p>Click <strong>Create Function</strong>.</p><p>Here's our DemoFunction with an AWS-created default/placeholder function called <code>lambda handler</code>.</p>                                                                                                                                                                                                                                                |                                                                                                                                              |
| <h4 id="awslambdacheck-importyourscript">Import Your Script</h4><p>Paste the Script Code into the DefaultFunction section</p><p>Note: if you press test now, you'll get an error because we are not ready.</p>                                                                                                                                                                                                                                                              |                                                                                                                                              |
| <h4 id="awslambdacheck-createtestevent">Create Test Event</h4><p>In the main definition, you have <code>event</code> and <code>context</code>. We have not defined a test event yet, so if you click <strong>Test,</strong> AWS will throw an error prompting you to define the event, opening an event template.</p><ul><li>Enter your test event name</li><li>Click <strong>Create</strong></li></ul>                                                                     |                                                                                                                                              |
| <h4 id="awslambdacheck-deploytheawschanges-test">Deploy the AWS Changes, Test</h4><ul><li><strong>Deploy</strong> your changes</li><li>Our pasted code has changed the name of the Runtime Handler from <strong>lambda_handler</strong> to <strong>main</strong> so that a test will return an <strong>error</strong>. This error is not a problem because we can edit the Handler to match the code.</li><li>Note the test Status shows <strong>Failed</strong>.</li></ul> | <p></p><p></p>                                                                                                                               |
| <h4 id="awslambdacheck-editruntimehandler">Edit Runtime Handler</h4><p>Find <strong>Runtime settings</strong> beneath the test results and note the Handler shows as named <strong>lambda_handler</strong></p><p>Click <strong>Edit</strong> to change this to our name of <strong>main</strong></p><p>Click <strong>Save</strong></p>                                                                                                                                      | <p></p><p></p>                                                                                                                               |
| <h4 id="awslambdacheck-test">Test</h4><p>Click <strong>Test</strong> to repeat the test, now with the handler name updated to <strong>main.</strong></p><p>We can see that the test Status shows <strong>Succeeded</strong></p><p>What we see is going to be our check response.</p>                                                                                                                                                                                        |                                                                                                                                              |

So the above is how you create the Lambda function in Amazon, and it's ready for use. But first, let's add a JSON Event to our check before we set up the check in ASM.

## 4. Adding a JSON Event <a href="#awslambdacheck-4.addingajsonevent" id="awslambdacheck-4.addingajsonevent"></a>

To demonstrate some of the power of Lambda, we'll be editing our code directly in AWS Lambda.

We will be adding just one additional field to our results because it's essential to show the power of our expandable JSON results.

| **Step**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | **Screenshot** |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| <h4 id="awslambdacheck-addaneventfield">Add an Event Field</h4><p>In AWS Lambda, we're going to add a field called <code>event</code>. And it will be the event that's passed in; i.e., the event is data from the check itself. So when we add it in this section, we can show that happening.</p><p>Click <strong>Deploy</strong></p><p>Click <strong>Test</strong> to do a quick test, and we'll see that the event has our test event that we created earlier. We'll see how this works when we run the ASM function.</p><p>Note the test Status now shows <strong>Succeeded</strong>.</p> |                |

Next, we'll be creating our check in the ASM UI. And we'll be running this and retrieving a result from it.

## 5. ASM Check Creation <a href="#awslambdacheck-5.asmcheckcreation" id="awslambdacheck-5.asmcheckcreation"></a>

We're going to create our check in ASM.

| **Step**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | **Screenshot**        |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| <p>Navigate to ASM, <strong>New Check+</strong>. Under the Scripted Check banner, click the <strong>Run AWS Lambda</strong> icon.</p><p>The check wizard will open. So let's create a new check.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                       |
| <h4 id="awslambdacheck-step1-name-description-andtags">Step 1: Name, Description, and Tags</h4><p>Provide a name for your check. In this example, we will call it <strong>New Lambda Check</strong>. Add any Description and Tags to help organize this check.</p><p>Click <strong>Next</strong></p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                       |
| <h4 id="awslambdacheck-step2a-commandandlocation">Step 2a: Command and location</h4><p><strong>AWS Region:</strong> This is the AWS region that your Lambda resides in. It may not default to your location, which you'll find that in the upper right-hand corner of your Amazon screen, or your Amazon UI.</p><p>In this example, it says Frankfurt, but up in the browser URL, you will see <code>eu-central-1.console.aws.ams:on.com/lambda/hometregion-=eu-central-14</code></p><p>So, select <code>eu-central-1</code> for this example or whatever matches your AWS Region in the dropdown choices.</p><p><strong>Function Name</strong>: Our example function name is simply <strong>DemoFunction</strong>, which we will type in, and find in our AWS UI, indicated to the right.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |                       |
| <h4 id="awslambdacheck-step2b-commandandlocation"><strong>Step 2b: Command and location</strong></h4><p><strong>AWS access key &#x26; AWS secret key.</strong> It would be best if you had this from AWS. You may need to ask your Operations team to get you an AWS Access Key and AWS Secret Key to execute this function. Enter these here.</p><hr><p><strong>Base64 Encoded JSON Payload</strong>. This JSON payload is the event that is passed here. For this field, create a JSON object; Base64 encode it and paste it in here.</p><p>You can use a Base64 encoding website <a href="http://base64encode.org">http://base64encode.org</a> . In this example, we'll create a very simple JSON by entering 'hello world,' and then we will encode it; this is our encoded JSON, and then we will paste that in the field.</p><hr><p>For other fields, such as <strong>AWS Session Token,</strong> <strong>AWS Role ARN,</strong> and <strong>Role Session Name</strong>: if/when you provide these inputs, the script that runs your Lambda will assume a role before running the Lambda.</p><p>You may have a security scheme that uses that, but, in this case, we don't. So we're going to leave these empty.</p><p><strong>Location</strong>. Select for this example Montreal and then press <strong>Next</strong>.</p> | <p></p><p></p><p></p> |
| <h4 id="awslambdacheck-step3-interval-thresholds-and-monitorgroups">Step 3: Interval, Thresholds, &#x26; Monitor Groups</h4><p>Set this check to run manually, and check the Monitor Group(s) to organize the check under. In this screenshot, It was put under the Driver Monitor Group. Click <strong>Next</strong>.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |                       |
| <h4 id="awslambdacheck-createcheck">Create check</h4><p>After Acknowledging the confirmation page, press <strong>Create</strong>.</p><p>For Testing:</p><ul><li>Disable failover</li><li>Set to Maximum Attempts to One</li><li>Click <strong>Save</strong></li></ul><p>We've created our ASM check.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |                       |

And in our next section, we will run the check and examine our results.

## 6. Run Result <a href="#awslambdacheck-6.runresult" id="awslambdacheck-6.runresult"></a>

We've created and configured our AWS Lambda check. We are ready to run it in ASM and view the results.

Note: the base 64 encoded JSON payload field that we provided is _entirely optional_. If you don't want to use it, you can leave it empty, and there won't be any additional information passed to your Lambda. But we'll keep it for this example.

| **Step**                                                                                                                                                                                                                                                                                                                                                  | **Screenshot** |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| <p>Check details page and manually run the check.</p><p>We see the result value/response time of 47 milliseconds.</p><p>If you click into this data point, in the Result section, you can see the <code>Lambda: true</code> event as well as the <code>hello: "world"</code> object that we encoded in Base64 and put inside our check configuration.</p> |                |

You can provide almost any kind of data in this check type. As long as you have an Amazon account, the possibilities with this check are endless.

As mentioned before, you can use many different types of runtimes. If you're a Ruby person and cannot have an Apica Private Agent inside your firewall, you can use Lambda.

Using **AWS Identity and Access Management**, you can set very fine-grained permissions.
