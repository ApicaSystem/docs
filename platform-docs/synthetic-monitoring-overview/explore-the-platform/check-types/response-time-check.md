# Response Time Check

By using the **Response Time** you can verify the response times from the check agent to the DNS Server.

**Check Info**



#### Check Result <a href="#responsetimecheck-checkresult" id="responsetimecheck-checkresult"></a>



#### Usage <a href="#responsetimecheck-usage" id="responsetimecheck-usage"></a>

The Response Time check queries the defined name server or a default resolver five times in a row and calculates the average response time for the calls.

The check can use a specified query (A Record, [AAAA](https://apica-kb.atlassian.net/wiki/spaces/GLOS/pages/4632287/Aaaa), [CNAME](https://apica-kb.atlassian.net/wiki/spaces/GLOS/pages/4632152/Cname), or [SOA](https://apica-kb.atlassian.net/wiki/spaces/GLOS/pages/4632125/Soa)) in the request, or be allowed to select automatically.

**Alerts**

The check will also keep track of timeouts and create test results based on the number of occurrences.

|     | Time Outs | Result |
| --- | --------- | ------ |
| 1-2 | Warning   |        |
| 3-4 | Error     |        |
| 5   | Fatal     |        |
