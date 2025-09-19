# Log rotation settings for ZebraTester Processes

From 7.0-B version , ZT support multiple loggers and also support logs rotations

Below is an example that shows how you configure the log rotation in ZT for a Windows Execution Agent Process

After installing the latest version of ZebraTester 7.0B, follow the below steps:

1. Edit the file NSSM\_ExecAgentServiceWin64.bat and append the jars log4j-core-2.17.1.jar and log4j-api-2.17.1.jar to the classpath like below

```
"%INSTALL_DIR%\jre\bin\java.exe" -Xmx2048m -Dfile.encoding=UTF8 -classpath ".;%INSTALL_DIR%;%INSTALL_DIR%\prxsniff.jar;%INSTALL_DIR%\iaik_jce_full.jar;%INSTALL_DIR%\iaik_ssl.jar;%INSTALL_DIR%\iaik_eccelerate_ssl.jar;%INSTALL_DIR%\iaik_eccelerate.jar;%INSTALL_DIR%\iaikPkcs11Provider.jar;%INSTALL_DIR%\iaikPkcs11Wrapper.jar;%INSTALL_DIR%\log4j-core-2.17.1.jar;%INSTALL_DIR%\log4j-api-2.17.1.jar" ExecAgent -jobdir "%INSTALL_DIR%\ExecAgentJobs" -tz %TIME_ZONE% -dgs %NUMBER_FORMAT% -enableJobOverrideJavaMemory -log4j
```

2\. As you can see in the above start command also add the -log4j parameter to the ExecAgent java process.

3\. Edit the log4j2.xml and configure the log rotation based on your need ; here I am configuring based on size, also you can see the below configuration supports 2 loggers one for ZT controller and other for Agent.

```
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="warn" monitorInterval="30">
<Appenders>
<Console name="Console" target="SYSTEM_OUT">
<PatternLayout pattern="%d{dd MMM yyyy HH:mm:ss} %logger{36} [%t] %-5level %msg%n"/>
</Console>
<RollingFile name="ztservLog" filename="ZebraTesterService.log" filePattern="ZebraTesterService-%d{yyyy-MM-dd}-%i.log">
<PatternLayout pattern="%d{dd MMM yyyy HH:mm:ss} %logger{36} [%t] %-5level %msg%n"/>
<Policies>
<OnStartupTriggeringPolicy />
<SizeBasedTriggeringPolicy size="10 MB" />
</Policies>
<DefaultRolloverStrategy max="20"/>
</RollingFile>
<RollingFile name="ztexecagentLog" filename="ZebraTesterExecAgent.log" filePattern="ZebraTesterExecAgent-%d{yyyy-MM-dd}-%i.log">
<PatternLayout pattern="%d{dd MMM yyyy HH:mm:ss} %logger{36} [%t] %-5level %msg%n"/>
<Policies>
<OnStartupTriggeringPolicy />
<SizeBasedTriggeringPolicy size="10 MB" />
</Policies>
<DefaultRolloverStrategy max="20"/>
</RollingFile>
</Appenders>
<Loggers>
<Logger name="ZBA" level="info" additivity="false">
<AppenderRef ref="ztservLog"/>
<AppenderRef ref="Console"/>
</Logger>
<Logger name="ExecAgent" level="info" additivity="false">
<AppenderRef ref="ztexecagentLog"/>
<AppenderRef ref="Console"/>
</Logger>
<Root level="error">
<AppenderRef ref="Console"/>
</Root>
</Loggers>
</Configuration>
```

4\. Now Install ZT Execution Agent Process as as Service (using InstallExecAgentServiceWin64.bat) or Restart the already installed service
