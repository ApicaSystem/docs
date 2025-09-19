# Configuring Apica DNS Check Types

The purpose of this article is to provide helpful information regarding the DNS check types which Apica offers.

The domain name system (DNS) was designed to be both resilient and cheap on bandwidth using the user datagram protocol and the use of the cache to prevent unnecessary query traffic. These benefits have the downside that the domain name system becomes difficult to troubleshoot if you don’t know exactly what to look for and where. Apica’s DNS checks are designed to make the difficult process of troubleshooting DNS easier. Setting up DNS checks correctly will allow for complete performance, availability and data integrity monitoring within your company's DNS environment.

Due to the complex structure of the DNS and the fact that very few DNS infrastructures look the same, Apica DNS checks were designed to be a collection of tools that monitor specific areas of DNS. Refer to the individual check documentation for descriptions on each check type.

We strongly encourage you to use our DNS check packets to build the basis of your DNS monitoring environment and to use the stand-alone DNS checks to tailor the monitoring environment to suit your specific needs. Apica will also be able to analyze your DNS infrastructure and help you set up the monitoring that is required. For more assistance with setting up a DNS monitoring solution customized to your environment, contact your Sales agent, your TAM, or [Support](mailto:support@apica.io).

## Suggested Intervals for DNS Checks <a href="#configuringapicadnschecktypes-suggestedintervalsfordnschecks" id="configuringapicadnschecktypes-suggestedintervalsfordnschecks"></a>

Since different aspects of a DNS environment are likely to change at different rates, some checks can be run less frequently than others. The following table provides suggestions for DNS check intervals by check type.

These are only sample intervals. When selecting an appropriate interval for your check, take into account your specific environment.

| Check                         | Interval |
| ----------------------------- | -------- |
|  DNS security check           |  1 hour  |
|  Domain availability check    |  5 min   |
|  Domain delegation check      |  1 hour  |
|  Domain expiration date check |  24 hour |
|  Hostname integrity check     |  10 min  |
|  Mail (MX) record check       |  10 min  |
|  Resolver check               |  5 min   |
|  Response time check          |  5 min   |
