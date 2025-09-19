# FAQ - Frequently Asked Questions

The following are some commonly asked questions regarding the overall use of the Apica platform:

**Q: Does Apica have a password policy that I must follow when implementing a password?**

A: Yes. See https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2177269761/ASM+Platform+Overview#Apica-Password-and-Login-Policy for more information.

**Q: How do I setup checks that can perform REST?**

A possible workaround we looked at is running the REST call on chrome and using the debugger to save it as a HAR file. You can upload the HAR file into proxy sniffer.

**Q: Can warnings and errors also affect my SLA?**

Only Errors and Fatals affect SLA percentage. Use this link: SLA Calculations

**Q: How do I upload ZT checks in ASM?**

Add the prxdat file when creating a check, this should give you the option on how to compile the scenario. Be sure to choose the right version of ZT.

**Q: How can other users see the checks on my dashboard?**

In manage checks, select "Edit Users", you'll be able to control which users can be a part of your group.

**Q: How long is the period of data retention for a check?**

The details and statistic differs for each type of check. (PRX checks - 7d, FPR checks 14d, URLv2 24h)

**Q: Is there a list of IP's that need to be whitelisted?**

You can find a complete list of all Apica Synthetic Monitoring (ASM) IP's here: ASM Public Agent IP addresses

**Q: Why should I use Severity Mapping instead of Blocking URLs?**

Blocking URLS is a good solution for third party URLS, Severity Mapting can be used to map result errors to non-default severities. This is useful to customise differnet checks and how they should alert.

**Q: What are the differences between Tier 1+, 1, 2, 3?**

Here are the basic tier levels:

Tier 1+ - Apica Certified High Availability Cluster Setup - World-wide main locations where scalability, performance and high-availability are guaranteed

Tier 1 - Apica Certified Multi-Server Setup - Multi-server site with on-site failover capability

Tier 2 - Apica Generic Setup - Site with off-site failover capability

Tier 3 - Apica Basic Performance Setup - The setup is in a location which can have variable performance

**Q: Can I create more than one check for multiple locations?**

Each check must be executed from a specific location.

**Q: The checks on my dashboard keep disappearing, how can I keep my current layout?**

Dashboard - Top right corner, you can select save layout.

**Q: Is there a way to be continually alerted when my check is fatal?**

Yes, it is possible to achieve this through integrations with PagerDuty. Note that Apica alerts will only notify you when the status of the check has been changed.

**Q: What is the difference between Max Attempts and Failover for a check?**

**Q: I'm not receiving any results on the check I created?**

**Q: What are the best practices to troubleshoot a fatal check?**

**Q: How often are browser versions updated?**

A: The high frequency of browser releases make it impractical to implement every single release of every browser. But the goal is to proactively keep up with all major changes (protocols, performance updates, and standards) in all supported browsers. This usually means the implementation of new browsers every 6-12 months.

**Q: Why is the total response time different from the waterfall chart?**

A: The total response time shows the combined time it takes for the browser to load the sites different elements in parallel. The waterfall chart shows how long time each URL takes to load. If you add those times together you get the time it takes to load the entire site sequentially, which is why the times differ.

**Q: How do I perform maintenance on a single check?**

A: In Tools -> Maintenance ([http://wpm.apicasystem.com/Maintenance](http://wpm.apicasystem.com/Maintenance)) you can remove or update your check result severity. You can sort/filter the checks by type, severity, time periods or directly select a specific check from the drop-down menu.

**Q: I’m doing a call to the API for a check but I’m not receiving any data**

A: In Tools - > API you will find basic documentation on how to authenticate users to the API. You will also find links to more in-depth documentation ([http://api-wpm.apicasystem.com/v3/help](http://api-wpm.apicasystem.com/v3/help) ).

It’s worth noting that the user you authenticate must have permission to see the checks in Apica Synthetic (formerly WPM) for them to return any values to the API.

**Q: I don´t see any checks on my newly created user?**

A: Make sure that your user has the right permissions. To add a user to groups go to ([http://wpm.apicasystem.com/ManageChecksNew](http://wpm.apicasystem.com/ManageChecksNew)) and click Edit users and add the desired users to the desired group.

**Q: How do I schedule Exclusion periods for checks?**

A: There is a field on the checks settings page named Schedule. In this field, you define your Exclusions periods using the syntax described below. You will also find this description for the syntax if you click the question mark next to the field.

Exclusion period syntax

Syntax: PERIOD \[ ; PERIOD ]

where

PERIOD ::= ( WEEK-DAY-LIST | MONTH-DAY-LIST | DATE-LIST ) : TIME-RANGE

WEEK-DAY-LIST ::= WEEK-DAY-SPEC \[ , WEEK-DAY-LIST ]\*

WEEK-DAY-SPEC ::= ( WEEK-DAY | WEEK-DAY-RANGE )

WEEK-DAY-RANGE ::= WEEK-DAY - WEEK-DAY

WEEK-DAY ::= ( mon | tue | wed | thu | fri | sat | sun )

MONTH-DAY-LIST ::= MONTH-DAY-SPEC \[ , MONTH-DAY-LIST ]\*

MONTH-DAY-SPEC ::= ( MONTH-DAY | MONTH-DAY-RANGE )

MONTH-DAY-RANGE::= MONTH-DAY - MONTH-DAY

MONTH-DAY ::= 0-31 (Note: Month day 0 means the last day of the month)

DATE-LIST ::= DATE-SPEC \[ , DATE-LIST ]\*

DATE-SPEC ::= ( DATE | DATE-RANGE )

DATE-RANGE ::= DATE - DATE

DATE ::= yyyy-mm-dd

TIME-RANGE ::= TIME-SPEC - TIME-SPEC

TIME-SPEC ::= hh\[:mmss]

Example:\
mon-fri : 21:30-22; sun:15-17; 0-1:12-18; 2012-04-01-2012-04-30:18-23\
which specifies four periods:

The 1st means "every monday to friday between 21:30 and 22:00".

The 2nd means "Sundays between 15:00 and 17:00".

The 3rd means "the last and first day of each month, between noon and 18".

The 4th means "between 18:00 and 23:00 on each day of April 2012".

**Q: What is the meaning of the different levels of alerts in APM/WPM?**

A: There are multiple levels:

Informational: This means that the check is working as intended. You will get this alert if a check has had another state and returned to normal.

Warning/Error: These alerts are set manually in the settings and are latency alerts; if the response time for the checks exceeds the set values, they will trigger.

Fatal: The check fails.

**Q: Why am I not getting an alert saying the check has returned to the normal state, I got an error/warning/fatal alert, but I can see in the control panel that the check has returned to a normal state?**

A: If you haven’t set up in you alert that you should get informational alerts, you will not get at an alert saying that the check has returned to normal.

**Q: Where do I setup checks?**

A: You setup checks through the wizard “New Check”.

**Q: How do I setup alerts?**

A: Go to “Manage Alerts” and click the bullseye next to the check you wish to have alerts for. Select the severity that should trigger the alert and the user that should receive the alerts.

**Q: How do I create a new user?**

A: Go to “Users” and click “New user”.

**Q: Is it possible to get alerts only on certain time periods?**

A: No. But you can set the check to run only on certain time periods.

**Q: How is SLA calculated?**

A: More information about SLA calculation can be found Result Value SLA.

**Q: Can you explain how a browser renders a page?**

A: For more information, please read this [article](https://developers.google.com/web/fundamentals/performance/critical-rendering-path/analyzing-crp?hl=en).
