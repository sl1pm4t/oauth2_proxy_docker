Docker image for bitly's oauth2 proxy
=====================================

This is a minimal docker image for bitly's oauth2 proxy.

Usage
=====

Example usage within docker compose:

```
version: "2"

services:
  web:
    image: <my_web_service>

  oauth2proxy:
    image: frankh/oauth2_proxy
    command:
      - -upstream=http://web:5000
      - -http-address=0.0.0.0:4080
      - -redirect-url=http://my-service:4080/oauth2/callback
      - -email-domain=example.com
      - -client-id=<oauth id>
      - -client-secret=<oauth secret>
      - -cookie-secret=<cookie secret>
      - -cookie-httponly=false
```