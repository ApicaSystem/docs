# Sending Email And Alerts

The Exec Agents can be configured so that Email and SMS Alert Notifications are released during the execution of a load test job.

### Sending Email and SMS Alert Notifications during Test Execution <a href="#sendingemailandalerts-sendingemailandsmsalertnotificationsduringtestexecution" id="sendingemailandalerts-sendingemailandsmsalertnotificationsduringtestexecution"></a>

The corresponding **Alert Configuration Menu** can be called from the **Personal Settings Menu**. The **Alert Configuration Menu** will create a file named `AlertConfig.xml,` located in the ZebraTester installation directory and contains the configuration data for all alert devices and all alert notifications. If no `AlertConfig.xml file` exists on an Exec Agent, no alerts are released from this Exec Agent ¹. When a job is started on an Exec Agent, the Exec Agent tries to read this file, which means that the file can be created, updated, or deleted without the need to restart the corresponding Exec Agent.



¹ As a further option, it is also supported to use a specific alert configuration for a particular load test program. In such a case, you have first to place a copy of the file `AlertConfig.xml`inside the Project Navigator directory where the load test program is stored. After that, you can manually edit the copied `AlertConfig.xml`file; you have to ZIP it together with the load test program's compiled class (similar to the procedure required for using input files or using Plugins). This effect that the program-specific alert configuration is automatically transmitted to the Exec Agent(s) and that it overrides the Exec Agent's default behavior (s). **Note:** the copy of the `AlertConfig.xml`file is stored in such a case inside the job-specific directory on the Exec Agent.

#### Alert Conditions <a href="#sendingemailandalerts-alertconditions" id="sendingemailandalerts-alertconditions"></a>



The following Alert Conditions are supported:

* If a Job cannot be started
* At the start of a Job (information)
* If an Internal Error occurs during the Execution of a Job
* During the Execution of a Job in Periodically Intervals (configurable interval time in minutes)
* At Every Interval (information)
* If the Session Failure Rate is greater than a threshold in percent ¹
* If the Average Response Time per Page is greater than a threshold in seconds ¹
* If the Average Response Time of the Slowest Page is greater than a threshold in seconds ¹
* At the End of a Job (information)
* At the End of a Job: If the Session Failure Rate is greater than a threshold in percent
* At the End of a Job: If the Average Response Time per Page is greater than a threshold in seconds
* At the End of a Job: If the Average Response Time of the Slowest Page is greater than a threshold in seconds

¹ = The values for periodically checked alert conditions are calculated from the measurements collected within one interval. Repeated alerts are suppressed. A cancel notification is released if the measurement is later less than the threshold.

#### Message Headlines <a href="#sendingemailandalerts-messageheadlines" id="sendingemailandalerts-messageheadlines"></a>

The Message Headlines for all Alert Notifications can be configured and support placeholders. The values of the placeholders are calculated at runtime and are replaced within the message headlines.

#### Generic Placeholders <a href="#sendingemailandalerts-genericplaceholders" id="sendingemailandalerts-genericplaceholders"></a>

Generic Placeholders that can be used in every type of alert notification are:

* **{$timestamp}**: The current date and time when the alert notification was created. Example: "01 Jun 2010 13:45:38 ECT"
* **{$generator}**: The name of the Exec Agent (load generator) releases the alert notification.
* **{$jobId}**: The job ID of the Exec Agent job.
* **{$programName}**: The program name of the Exec Agent job.

#### Specific Placeholders <a href="#sendingemailandalerts-specificplaceholders" id="sendingemailandalerts-specificplaceholders"></a>

* **During the Execution of a Job (Information at Every Interval) and at the End of a Job (Information)**:
  * **{$sessionFailureRate}**: The measured session failure rate in percent.
  * **{$avResponseTimePerPage}**: The measured average response time per page in seconds.
* **During the Execution of a Job and at the End of a Job: if the Session Failure Rate is greater than %**
  * **{$sessionFailureRate}**: The measured session failure rate in percent.
  * **{$sessionFailureRateLimit}**: The configured threshold for the session failure rate in percent.
* **During the Execution of a Job and at the End of a Job: if the Average Response Time per Page is greater than seconds**
  * {$avResponseTimePerPage}: The measured average response time per page in seconds.
  * {$avResponseTimePerPageLimit}: The configured threshold for the average response time per page in seconds.\
