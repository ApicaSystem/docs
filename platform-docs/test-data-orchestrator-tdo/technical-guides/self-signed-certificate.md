# Self-Signed Certificate

## Orson TDO Install Guide

### Self-signed HTTPS certificate &#x20;

The following instructions apply to both Windows and Linux installations. &#x20;

If your organization will provide a certificate, you do not need to follow these steps.

To generate the certificate, use the keytool distributed with JDK.  This is done at the command line in Linux and in a command / shell window in Windows.  Ensure that you are in the directory where JDK is installed before running the following command:&#x20;

$ keytool -genkey -keyalg RSA -alias \<selfsigned> -keystore keystore.jks -storepass orsonkeystore -validity 360 -keysize 2048

Enter your key password in place of \<selfsigned> in the command above.

(RETURN if same as keystore password):&#x20;

For this question use IP (hostname) of server:&#x20;

\[Unknown]: 72.112.132.121&#x20;

Place generated keystore.jks file in appdir/api on the Orson TDO server.&#x20;
