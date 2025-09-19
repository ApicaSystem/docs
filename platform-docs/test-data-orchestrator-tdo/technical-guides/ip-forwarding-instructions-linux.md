# IP Forwarding Instructions (Linux)

ORSON - Test Data Orchestrator

## Linux/Unix Port Configuration Guide

Test Data Orchestrator (TDO) runs on port 8080/8443. The typical http/https server configuration for Linux/Unix (\*nix) servers is port 80/443.

&#x20;These ports are considered privileged on Unix/Linux systems and processes using them must be owned by the root; i.e., they must have root privileges.

&#x20;Running TDO as root is not recommended. It should be run as its own user on the Unix/Linux server.

There are two solutions that will allow for forwarding traffic from port 80/443 to 8080/8443:

·       Use iptables in Linux to forward traffic from port 80/443 to 8080/8443.

·       Use a proxy server (such as Apache) to act as the front-end server for TDO and forward proxy requests.

&#x20;While we generally recommend the first option as being lower cost and requiring less maintenance overhead, the option you select should align with your organization’s security policy and enterprise architecture standards.

## Running TDO on port 80 or 443 using iptables port forwarding (\*nix systems only)

### Prerequisites to forwarding

The information provided below is generic; if you are not familiar with using the iptables command in your version of Unix/Linux you should refer to the appropriate documentation for further information. \[For example, for RHEL you would refer to [Sysadmin tools: How to use iptables | Enable Sysadmin (redhat.com)](https://www.redhat.com/sysadmin/iptables)]

&#x20;The first step is to confirm that traffic is enabled on all four of these ports using the command below to view your current iptables configuration.

<mark style="color:red;">iptables -L -n</mark>&#x20;

This command will return the full iptables configuration.  In the output you should see rules for all four ports (80, 8080, 443, and 8443) in the ‘ACCEPT’ section.  A sample output is shown below.

| <p></p><p>Chain INPUT  (policy ACCEPT) target prot opt source destination </p><p>ACCEPT tcp -- 0.0.0.0/0 0.0.0.0/0 tcp dpt:443 </p><p>ACCEPT tcp -- 0.0.0.0/0 0.0.0.0/0 tcp dpt:80 </p><p>ACCEPT tcp -- 0.0.0.0/0 0.0.0.0/0 tcp dpt:8080 </p><p>ACCEPT tcp -- 0.0.0.0/0 0.0.0.0/0 tcp dpt:8443 </p><p>ACCEPT all -- 0.0.0.0/0 0.0.0.0/0 state RELATED, ESTABLISHED </p><p>ACCEPT icmp -- 0.0.0.0/0 0.0.0.0/0 </p><p>ACCEPT all -- 0.0.0.0/0 0.0.0.0/0 </p><p>ACCEPT tcp -- 0.0.0.0/0 0.0.0.0/0 state NEW tcp dpt:22 </p><p>REJECT all -- 0.0.0.0/0 0.0.0.0/0 reject-with icmp-host-prohibited </p><p>Chain FORWARD (policy ACCEPT) target prot opt source destination </p><p>REJECT all -- 0.0.0.0/0 0.0.0.0/0 reject-with icmp-host-prohibited </p><p>Chain OUTPUT (policy ACCEPT) target prot opt source destination target prot opt source </p> |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

&#x20;

If you don't see entries for all four ports, then you need to run commands (as root or with sudo) to add those ports. The following commands would be used to add all four ports using sudo; only run commands for the ports you need to enable.

&#x20;

<mark style="color:red;">sudo iptables -I INPUT 1 -p tcp --dport 8443 -j ACCEPT</mark>

<mark style="color:red;">sudo iptables -I INPUT 1 -p tcp --dport 8080 -j ACCEPT</mark> &#x20;

<mark style="color:red;">sudo iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT</mark> &#x20;

<mark style="color:red;">sudo iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT</mark>&#x20;

&#x20;

The command to add the ports to the table can be used with the -I or -A option before the INPUT statement.  It is recommended that you use ‘-I INPUT 1’ instead of ‘-A INPUT’.  The -I option will insert the new rule as the first entry in the iptables file, while the -A option will append the new rule to the end of the table.  Having heavily used rules at the top of the table is more efficient.

&#x20;Run _<mark style="color:red;">iptables -L -n</mark>_ again and you should now see entries for these 4 ports.

### Forwarding to 8080/8443

With traffic on the ports allowed, you can run the command to forward port 80 traffic to 8080, and port 443 traffic to 8443. The commands are shown below.

&#x20;

<mark style="color:red;">sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT -to-port 8080</mark>&#x20;

<mark style="color:red;">sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT -to-port 8443</mark>&#x20;



Verify the forwarding rules by running the _<mark style="color:red;">iptables -L -n</mark>_ command again.

### Saving iptables configuration

The commands shown above only changed current, in-memory configuration. It does not persist between restarts of the iptables service. To make the changes permanent you will need to update the _iptables_ configuration.

&#x20;Saving the configuration is slightly different between RedHat-based and Debian-based systems. On a RedHat-based system (Fedora, CentOS, RHEL, etc), issue the following command:

&#x20;<mark style="color:red;">sudo iptables-save > /etc/sysconfig/iptables</mark>&#x20;

On a Debian-based system (Debian, Ubuntu, Mint, etc), issue the following command:

&#x20;<mark style="color:red;">sudo sh -c "iptables-save > /etc/iptables.rules"</mark>&#x20;

The final action you will need to take will be to configure your server to automatically run the ‘iptables-restore’ command on system reboot. If you do not take this step, you will need to run the command manually after each reboot and TDO will not run until this is done. This command may vary depending on your specific Unix/Linux software; you should confirm against your system manuals to ensure that you configure this correctly.

### Validating the forwarding changes

Once TDO is installed, attempt to access your TDO instance on port 80. Your URL should stay on port 80, and forward in the background. The fact that the server is forwarding from 80 to 8080 (or 443 to 8443) should remain hidden from the end user.
