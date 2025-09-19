# FORWARD

Forward rules are applied when the logs are routed to downstream destinations. In a nutshell, these are similar to Filter rules, but filter rules are applied when Apica Ascent receives the data. Forward rules are useful in case organizations want to retain all the generated logs in InstaStore but want to selectively forward the data to other destinations by ensuring total compliance.

Multiple forward rules can be configured for a log stream. The data get forwarded only if all the rules are satisfied. Forward rules can be configured to forward selective fields, which also helps in reducing the data volumes to the downstream system.

Select a log line to create a forward rule, click on the ellipsis available on the logline and click on the "create rule".

![](../../../.gitbook/assets/search-create-rule-dropdown.png)

In the modal that opens, select FORWARD and enter the details. In this case, logs only get forwarded if the given condition is satisfied.

![](../../../.gitbook/assets/forward-rule-demo.png)

Optionally toggle "Forward Labels" and select the fields that need to be forwarded. In this case, if the condition is satisfied, only the selected fields get forwarded.

![](../../../.gitbook/assets/forward-rule-labels.png)
