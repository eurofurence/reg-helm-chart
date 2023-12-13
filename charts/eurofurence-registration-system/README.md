# eurofurence-registration-system

## Overview

A helm chart that can deploy the Eurofurence Registration System.

## Configuration

TODO add documentation here.

## Manual secret configuration

Using kubectl, create a secret (not managed by argocd):

```
apiVersion: v1
kind: Secret
metadata:
  name: regsys-secret
  namespace: <PUT_YOUR_NAMESPACE_HERE>
data:
  # these are example values, they all say "demo". Edit and then manually create the secret using kubectl,
  # or use something like vault or the external-secrets-operator.
  REG_SECRET_API_TOKEN: ZGVtbw==
  REG_SECRET_DB_PASSWORD: ZGVtbw==
  REG_SECRET_DD_TOKEN: ZGVtbw==
  REG_SECRET_ARTSHOW_TOKEN: ZGVtbw==
  REG_SECRET_BOAT_TOKEN: ZGVtbw==
  REG_SECRET_CONCARDIS_API_SECRET: ZGVtbw==
  REG_SECRET_CONCARDIS_INCOMING_WEBHOOK_SECRET: ZGVtbw==
  REG_SECRET_NOSECOUNTER_TOKEN: ZGVtbw==
  REG_SECRET_OIDC_CLIENT_ID: ZGVtbw==
  REG_SECRET_OIDC_CLIENT_SECRET: ZGVtbw==
  REG_SECRET_SECU_TOKEN: ZGVtbw==
  REG_SECRET_SECU_SECRET: ZGVtbw==
  REG_SECRET_SMTP_PASSWORD: ZGVtbw==
```

The values can be base64 encoded using `echo -n 'some secret value' | base64`.
