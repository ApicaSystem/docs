# Domain Delegation Check

The **delegation** check verifies that the delegation information is consistent between the parent name servers and the child name servers.

#### Check info section <a href="#domaindelegationcheck-checkinfosection" id="domaindelegationcheck-checkinfosection"></a>



#### Check Configuration <a href="#domaindelegationcheck-checkconfiguration" id="domaindelegationcheck-checkconfiguration"></a>



#### Check Result <a href="#domaindelegationcheck-checkresult" id="domaindelegationcheck-checkresult"></a>



#### Usage <a href="#domaindelegationcheck-usage" id="domaindelegationcheck-usage"></a>

The delegation information (known as NS resource records) is needed for the DNS system to keep track of its closest downstream domain neighbors. This is how the domain name tree works.

The delegation information needs to be consistent in order to direct traffic and distribute load across name servers.

If this information should differ one of these failures will apply:

* If the parent domain has registered name servers that are not present in the child, timeouts will occur when the resolver tries to reach a name server that might not exist. This causes intermittent failures (timeouts) which can go unnoticed, or unreported for months. Who sits around and waits for the DNS protocol to direct the question to the next name server in line?
* If the child has more name servers than the parent, the name servers not listed in the parent domain will receive much less traffic than the listed ones, which may affect the overall performance of name lookup in that domain.
