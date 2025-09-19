---
description: Monitoring spring boot applications using Apica Ascent
---

# Spring Boot

### Spring Boot Actuator and Micrometer

[Spring Boot Actuator](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#production-ready) is a subproject of Spring Boot that adds several production-grade services to your application with little effort on your part. It exposes various operational information about the running application - health, metrics, audit entries, scheduled tasks, env settings, etc. You can query the data via several HTTP endpoints. In this guide, we discuss how to enable API and other metrics using Actuator and micrometer.

[Micrometer](https://micrometer.io/) provides a simple facade over the instrumentation clients for the most popular monitoring systems, allowing you to instrument your JVM-based application code without vendor lock-in. Think SLF4J, but for metrics.

### Enabling Actuator and Micrometer dependencies

In Spring Boot's pom.xml file, add the Spring Boot Actuator and Micrometer dependencies to enable Prometheus monitoring, as shown below.

```
// Enable Actuator dependency
<dependency>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>

// Enable Micrometer Prometheus dependency
<dependency>
  <groupId>io.micrometer</groupId>
  <artifactId>micrometer-registry-prometheus</artifactId>
  <scope>runtime</scope>
</dependency>
```

Next, in Spring Boot's `application.properties` file, add the following line.

```
// Enable Actuator Endpoints in application.properties
management.endpoints.web.exposure.include=health,info,prometheus
```

Restart the server and navigate to `http://localhost:<port>/actuator/` to verify if the Actuator endpoints are enabled.

![Actuator Endpoints](<../../../.gitbook/assets/image (319).png>)

Navigate to `http://localhost:<port>/actuator/prometheus` and verify if your Prometheus metrics are being displayed.

![](<../../../.gitbook/assets/image (265).png>)

### Enable API Timings

Micrometer comes with a [timed annotation](https://micrometer.io/docs/concepts#_the_timed_annotation). Annotate Spring Controller methods with the`@Timed`annotation, as shown below.

![](<../../../.gitbook/assets/image (201).png>)

Restart the server, invoke your APIs a few times and navigate to `http://localhost:<port>/actuator/prometheus`. You will now see the API stats being displayed along with other metrics.

![](<../../../.gitbook/assets/image (346).png>)

Once these metrics are available, you can use Apica Ascent to visualize them and set up alerts for important events. The following image depicts an example of Spring Boot monitoring dashboard built by visualizing metrics ingested into Apica Ascent via Prometheus.

![](../../../.gitbook/assets/Spring-boot.png)
