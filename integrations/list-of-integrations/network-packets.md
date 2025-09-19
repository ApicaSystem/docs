# Network Packets

### Tcpdump

Tcpdump is a common packet analyzer that runs on most Unix-like operating systems. It allows users to capture and analyze network traffic in real time. tcpdump can be used to troubleshoot network issues, security concerns, and performance problems.

Tcpdump output can be piped into another program for further analysis. For example, the output of tcpdump can be piped into the Apica Ascent Platform

```
tcpdump | nc <apica ascent endpoint> 514/517
```

<figure><img src="../../.gitbook/assets/Screen Shot 2022-09-09 at 2.16.21 PM.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screen Shot 2022-09-09 at 2.15.55 PM.png" alt=""><figcaption></figcaption></figure>
