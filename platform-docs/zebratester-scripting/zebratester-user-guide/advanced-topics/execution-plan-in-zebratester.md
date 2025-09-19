# Execution Plan in ZebraTester

An execution plan in ZebraTester is designed to control VUsers, Test duration, Max loops per user and RampUp via a flat file, which contain instructions written in a simple scripting language, and have the file-name extension \*.exepl.

The benefit of having an execution plan is that the VUsers, test duration, ramp up and ramp down can be altered at any point of time during the test which will be helpful in simulating a stepped load test, spike test etc.

**Procedure**:

1. Create an execution plan flat file with extension “.exepl”
2. Now design the execution plan as per the test scenario
3. Refer the documentation [here](https://files-apicasystem-com.s3.eu-west-1.amazonaws.com/proxysniffer/prxfiles/V75A/doc/ZebraTesterApplicationReferenceManual.pdf) Sec 3.10
4. When an execution plan is selected in ZebraTester before starting a Load test, then these 4 options are disabled from the UI and is controlled via the execution plan “.exepl” file



**Example:**

An example of a stepped load test starting with 5 VUsers having ramp up of 2sec per user with a stable period of 5 minutes and going up to 50 VUsers is provided below:

&#x20;

//Define a name for this execution plan

set(ExecutionPlanTitle,"Step\_Up\_Scenario")

//Define the maximum test duration, though the test can be executed shorter than the planned

set(MaxTestDuration,2:0:0)

//Set the max loops any user can execute, enter 0 or unlimited for a duration test

set(MaxLoopsPerUser,unlimited)

//Initialise the first set of users within specific time defined

rampup(+5,within,10)

//Optional - This is to make sure the ramp up completes and will extend the MaxTestDuration if required until ramp-up is completed

synch(rampup)

//This will act like stable period (5 minutes here)

wait(5:0)

//Second set of users ramping up

rampup(+5,within,10)

//Next stable period for all set of users running now

wait(5:0)&#x20;

rampup(+5,DelayPerUser,2)

wait(5:0)

rampup(+5,DelayPerUser,2)

wait(5:0)

rampup(+5,DelayPerUser,2)

wait(5:0)

rampup(+5,DelayPerUser,2)

wait(5:0)

rampup(+5,DelayPerUser,2)

wait(5:0)

rampup(+5,DelayPerUser,2)

wait(5:0)

rampup(+5,DelayPerUser,2)

wait(5:0)

rampup(+5,DelayPerUser,2)

wait(5:0)

//Ramp down specific number of users in the given time. The users count may go beyond the actual no. of running vusers

rampdown(-1000,within,0)

synch(rampdown)

//Aborting the test. If there is no eot statement then the test will stop when it reaches the MaxTestDuration

eot



***

**Running scenarios using execution plan in ALT:**

_(Make sure that the patch which supports execution plan is available in the agent used for the test which is ZT 7.0-B or higher)_

In order to use execution plan in ALT there are certain steps which needs to be followed and its outlined below:

1. Create the execution plan exepl file for each script
2. Now generate a zip which should consists of this exepl file. To do this, go to Project Navigator and select all the necessary files for the script along with exepl and click on ‘Zip selected files’ button



_**Confirmation message: Weather\_Extract\_APIKey.zip created (4 entries)**_

3\. Once the zip is created, upload the same to ALT portal as usual

4\. Use -executionPlan _ExecutionPlanName_.exepl syntax in the Additional Options field as below so that the execution plan file can be considered during execution



4\. The test execution has no effect of the 'Users', 'Duration' and 'Ramp-up Time' selected from ALT portal as below and it always picks these values from the exepl file



5\. Save the scenario and execute test&#x20;

6\. Active VUsers graph from ALT



\*\*\*End of article \*\*\*



&#x20;
