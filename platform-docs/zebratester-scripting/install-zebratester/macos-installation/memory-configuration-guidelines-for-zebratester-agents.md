# Memory Configuration Guidelines for ZebraTester Agents

When installing ALT or ASM ZT agents, please refer to the following Guidelines for initial memory allotments.

* ZT controller Memory - Xmx **2048** MB
* ZT Exec Agent memory - Xmx **2048** MB
* Memory per Job by default - Xmx **1536** MB

As you can see, the allotted memory per job defaults to **1536** MB but may not be enough for additional Virtual Users. So, for example, if there were 400 VUs for a single job, it's possible to override the memory per job by passing a larger Xmx parameter (marked in red) below.

_**cldemomodularscript -u 300 -d 1200 -t 60 -sdelay 200 -maxloops 0 -sampling 15 -percpage 100 -percurl 20 -maxerrmem 10 -nolog -Xmx3072**_&#x20;

The advantage here is that we can run more jobs per agent, both for ALT and ASM, if we increase the Xmx parameter above the initial recommended settings.

Apica’s minimum recommendation for a ZT Agent machine is **8GB RAM** and **2 core CPUs**. Also for ASM agents memory per job can be small , like 256 to 512 MB

***

### Memory per Job recommendations for High-throughput tests <a href="#memoryconfigurationguidelinesforzebratesteragents-memoryperjobrecommendationsforhigh-throughputtests" id="memoryconfigurationguidelinesforzebratesteragents-memoryperjobrecommendationsforhigh-throughputtests"></a>

* The basic offset of memory assigned to all load test jobs, in megabytes - **100 MB**
* Additional memory assigned per simulated user, in megabytes. - **5MB to 10MB&#x20;**_**that means for 1000 users high-throughput tests, the minimum heap size per job should be 5 GB**_
* Also sometimes the test may be need a bit more memory than mentioned above if the high throughput tests also have big resources , like big java script files for example.

#### **For high-throughput and long duration tests, Apica recommends using the following options to the low number.** <a href="#memoryconfigurationguidelinesforzebratesteragents-forhigh-throughputandlongdurationtests-apicarecomm" id="memoryconfigurationguidelinesforzebratesteragents-forhigh-throughputandlongdurationtests-apicarecomm"></a>

* **Max. Error-Snapshots**: limits the maximum number of error snapshots taken during load test execution. The maximum memory used to store error snapshots can be configured (recommended - for cluster jobs: value overall cluster members). The maximum number of error snapshots per URL can be configured (not recommended for cluster jobs: value per Exec Agent).  **-&#x20;**_**maxerrmem**_
* **Additional Sampling Rate per Page Call**: captures the measured response time of a web page each time when a simulated user calls a web page (event-based sampling). Used to display the response time diagrams in real-time and in the Analyse Load Test Details menu. For endurance tests over several hours, it is strongly recommended that the sampling rate for web pages is set between 1% and 5%. For shorter tests, a 100% sampling rate is recommended - _**percpage**_
* **Additional Sampling Rate per URL Call**: captures the URL's measured response time each time when a simulated user calls a URL (event-based sampling). Used to display the response time diagrams in real-time and in the Analyse Load Test Details menu. For endurance tests over several hours, it is strongly recommended that the sampling rate for URL calls is disabled or set to 1% or 2%. For shorter tests, a 100% sampling rate is recommended - _**percurl**_

Example _**cldemomodularscript -u 50 -d 28800 -t 60 -sdelay 5000 -maxloops 0 -sampling 600 -percpage 5 -percurl 2 -maxerrmem 2 -nolog**_&#x20;

Also for high throughput tests please try to set  **Max. Stored Content Size** value less than 5 MB like the below screenshot for the Java scripts and CSS resources

