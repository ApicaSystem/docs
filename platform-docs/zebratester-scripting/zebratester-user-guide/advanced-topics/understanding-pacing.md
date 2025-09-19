# Understanding Pacing



**Pacing**: The **Enable** [**Pacing**](https://apica-kb.atlassian.net/wiki/spaces/GLOS/pages/101974037/Pacing) option allows you to define a minimum loop duration per User. So, when pacing is enabled, for this User, all the executed page breaks and URL calls must elapse within this **minimum** duration before the next iteration starts.\
So, if the iteration completes earlier than this specified pacing time, the User will be **inactive** until the pacing time has been reached.&#x20;

## Pacing on Outer Loops <a href="#understandingpacing-pacingonouterloops" id="understandingpacing-pacingonouterloops"></a>

The _**outer loop**_ is the one the user selects on the load test start screen as the **Max Loops per User**.

During the load test, inner loops execute within the "outer", normal loops (repetitions of the web surfing session per user); for example, if you run a load test with 10 users and 3 loops (with an unlimited test duration), each user will execute the recorded web surfing session 3 times. Within each repetition (outer loop), the inner loop(s) will be executed.\\

* **Max. Loops per User**: limits the number of web surfing session repetitions (loops) per simulated user. The load test stops if the limit has reached for each simulated user. Note: this parameter can be combined with the parameter "Load Test Duration": the limitation which first occurs will stop the load test.
* **Pacing**: Minimum Loop duration per User. Enabling this option sets a minimum time for all in the iteration executed page breaks and URL calls which must be elapsed before the next iteration starts.\
  If the iteration completes earlier than the pacing time, the user will be inactive until the pacing time has been reached.

Inner loops are marked by black bars on the left side of the Web Admin GUI main menu. **Nested inner loops are also supported**.
