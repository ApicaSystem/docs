---
description: >-
  This page describes port numbers that are supported in the Apica Ascent
  Platform. Note all ports numbers are enabled by default but can be enabled
  based on use case.
---

# Data Ingest Ports

### Syslog

1. 514 / 7514 (TLS) - [RFC 5424 documentation](https://datatracker.ietf.org/doc/html/rfc5424)  / [Read RFC 3164 Document](https://tools.ietf.org/html/rfc3164)
2. 515 / 7515 (TLS) - Syslog [CEF](https://www.google.com/url?sa=t\&source=web\&rct=j\&opi=89978449\&url=https://www.microfocus.com/documentation/arcsight/arcsight-smartconnectors-8.4/pdfdoc/cef-implementation-standard/cef-implementation-standard.pdf\&ved=2ahUKEwj9xsPjifyGAxXHNzQIHez9CvgQFnoECAcQAQ\&usg=AOvVaw2GqKSwtNa2YT5C_JV-Y5ax)
3. 516 / 7516 (TLS) - Syslog Fortinet / [RFC 6587](https://tools.ietf.org/html/rfc6587)
4. 517 - Raw RCP / catch-all for non-compliant syslog / Debug

### RELP

1. 2514 / 20514 (TLS) - [https://en.wikipedia.org/wiki/Reliable\_Event\_Logging\_Protocol](https://en.wikipedia.org/wiki/Reliable_Event_Logging_Protocol)

### Http/Https

1. 80/443 (TLS)

### Logstash

1. 25224/ 25225 (TLS) - [Logstash Protocol](https://www.elastic.co/guide/en/logstash/current/index.html)

### Fluent Protocol

1. 24224/24225 (TLS) - [Fluent Protocol Documentation](https://www.fluentprotocol.org/docs)







