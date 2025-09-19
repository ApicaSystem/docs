---
description: This page describes how to  integrate systems that output data in syslog
---

# Syslog

#### Syslog

Syslog is a standard protocol used for message logging, allowing devices and applications to send log data to a central server. It provides a central repository for monitoring and analyzing logs, crucial for system management, security auditing, and troubleshooting.

#### Syslog RFCs

* **RFC 3164**: Defines the original BSD syslog protocol, outlining the format for syslog messages and the communication between devices.
* **RFC 5424**: Updates and extends RFC 3164 by providing a more robust message format and allowing for structured data elements.
* **RFC 5425**: Specifies the use of Transport Layer Security (TLS) to provide a secure transport for syslog messages.
* **RFC 5426**: Defines the transmission of syslog messages over UDP, maintaining compatibility with the traditional syslog transport mechanism.
* **RFC 6587**: Clarifies transmission of syslog messages over TCP, addressing issues with message framing and reliability.

Apica supports ingesting data from syslog senders but only via TCP as UDP is susceptible to data loss. The different syslog ports that are supported can be found below

1. 514 / 7514 (TLS) - [RFC 5424 documentation](https://datatracker.ietf.org/doc/html/rfc5424) / [Read RFC 3164 Document](https://tools.ietf.org/html/rfc3164)
2. 515 / 7515 (TLS) - Syslog [CEF](https://www.google.com/url?sa=t\&source=web\&rct=j\&opi=89978449\&url=https://www.microfocus.com/documentation/arcsight/arcsight-smartconnectors-8.4/pdfdoc/cef-implementation-standard/cef-implementation-standard.pdf\&ved=2ahUKEwj9xsPjifyGAxXHNzQIHez9CvgQFnoECAcQAQ\&usg=AOvVaw2GqKSwtNa2YT5C_JV-Y5ax)
3. 516 / 7516 (TLS) - Syslog Fortinet / [RFC 6587](https://tools.ietf.org/html/rfc6587)
4. 517 - Raw RCP / catch-all for non-compliant syslog / Debug

