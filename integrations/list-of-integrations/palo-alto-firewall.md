# Palo Alto Firewall

You can integrate Apica Ascent with your Palo Alto Firewall to forward either all or selected logs to Apica Ascent and trigger an action on an external HTTP-based service when an event occurs.

You need to create an HTTP server profile to forward logs to an HTTP(S) destination. The HTTP server profile allows you to specify how to access the server and define the format in which to forward logs to the HTTP(S) destination. By default, the Palo Alto firewall uses the management port to forward logs. However, you can also assign a different source interface and IP address in the `DeviceSetupServicesService` route configuration.

To create an HTTP server profile and set up log forwarding, do the following.

1. Select **Device** > **Server Profiles** > **HTTP**.
2. Name the server profile and select the **Location**. The profile you create can be shared across all virtual systems or can belong to a specific virtual system.
3. Click **Add** to provide details for each server. Each profile you create can have a maximum of 4 servers.
4. Enter a Name and IP Address.
5. Select **TCP** from the **Transport** dropdown. Apica Ascent supports log forwarding over TCP.
6. Enter the port as `514/2514`.
7. From the **Format** dropdown, choose **IETF**.
8. Select the **Protocol** as either **HTTP** or **HTTPS**. The default port is `80` for **HTTP** and `443` for **HTTPS**. You can modify the port number to match the port on which your HTTP server listens.
9. Select the **HTTP Method** supported by the third-party service. You can choose from `PUT`, `POST` (default), `GET`, and `DELETE`.
10. Select **Test Server Connection** to verify network connectivity between the firewall and the HTTP(S) server.

You will now see a new entry under the **Device** section.

Now that we've defined the Syslog server profile, we need to create and configure the Log Forwarding profile. In this step, we define the match criteria for when the firewall will forward logs to the HTTP server and attach the HTTP server profile to be used for log forwarding.

To create and configure the Log Forwarding profile, do the following.

1. Under **Objects**, click **Add** at the bottom of the page.
2. Name the log forwarding profile.
3. Select the log types for which you'd like to trigger a workflow
