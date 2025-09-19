# Domain Availability Check

#### Availability <a href="#domainavailabilitycheck-availability" id="domainavailabilitycheck-availability"></a>

The Domain Availability check queries each Authoritative DNS for the specified domain to provide the Start Of Authority (SOA) information. SOA is a [Resource Record](https://apica-kb.atlassian.net/wiki/spaces/GLOS/pages/4631946) containing administrative information about the zone, especially regarding zone transfers.

#### Check Info <a href="#domainavailabilitycheck-checkinfo" id="domainavailabilitycheck-checkinfo"></a>



#### Check Configuration <a href="#domainavailabilitycheck-checkconfiguration" id="domainavailabilitycheck-checkconfiguration"></a>



#### Check Result <a href="#domainavailabilitycheck-checkresult" id="domainavailabilitycheck-checkresult"></a>



#### Usage <a href="#domainavailabilitycheck-usage" id="domainavailabilitycheck-usage"></a>

The Availability check queries all authoritative name serves (optionally including Stealth Name Server) for their SOA information.

They will determine if the domain is available on all name servers. It will then compare the SOA serial numbers to verify that all name servers operate with the same zone data (DNS uses serial numbers to keep track of zone versions).

The check will then compare the SOA Master name records to verify that the different name servers have picked up the zone data from the same source of origin.

This allows you to know that your domain is active where needed and that the zone data is the same across the name servers. This provides detailed information on servers that are down or out of sync.
