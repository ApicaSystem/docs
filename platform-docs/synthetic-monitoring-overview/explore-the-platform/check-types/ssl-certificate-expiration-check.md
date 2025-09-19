# SSL Certificate Expiration Check

#### Certificate <a href="#sslcertificateexpirationcheck-certificate" id="sslcertificateexpirationcheck-certificate"></a>

SSL Certificate Expiration checks if the SSL certificate for the domain is about to expire.

**View**

Some sample views:

Check info section



Check Configuration



Check Result



#### Usage <a href="#sslcertificateexpirationcheck-usage" id="sslcertificateexpirationcheck-usage"></a>

The check collects the number of days before expiration at moment of check.

\##

If several domains are specified, the value will be recorded only for the first domain.

Sample results

`Domain www.youdomain.com will expire in N day(s) after YYYY/MM/DD`

`Domain www.youdomain.com expired N day(s) ago`
