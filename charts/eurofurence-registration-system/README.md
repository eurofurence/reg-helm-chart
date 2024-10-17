# eurofurence-registration-system

## Overview

A helm chart that can deploy the Eurofurence Registration System.

The Eurofurence Registration System is Open Source software,
all major components are [MIT licensed](https://github.com/eurofurence/reg-helm-chart/blob/main/LICENSE).

| Component                                                                                                                             | Description                                                                               |
|---------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| [Helm Chart](https://github.com/eurofurence/reg-helm-chart)                                                                           | helm chart used to deploy the registration system                                         |
|                                                                                                                                       |                                                                                           |
| [Attendee Service](https://github.com/eurofurence/reg-attendee-service)                                                               | backend micro-service providing a central attendee-related REST API                       |
| [Auth Service](https://github.com/eurofurence/reg-auth-service)                                                                       | backend micro-service that bridges registration and the identity provider                 |
| [Mail Service](https://github.com/eurofurence/reg-mail-service)                                                                       | backend micro-service for rendering mails based on templates and sending them             |
| [Payment Service](https://github.com/eurofurence/reg-payment-service)                                                                 | backend micro-service for dues and payments booking and accounting                        |
| [Room Service](https://github.com/eurofurence/reg-payment-service)                                                                    | backend micro-service for rooms, roomgroups, and hotel booking                            |
|                                                                                                                                       |                                                                                           |
| [Concardis Adapter](https://github.com/eurofurence/reg-payment-cncrd-adapter)                                                         | backend micro-service that interfaces between the registration system and the Paylink API |
|                                                                                                                                       |                                                                                           |
| [Frontend](https://github.com/eurofurence/reg-frontend) and [Component Library](https://github.com/eurofurence/reg-component-library) | Frontend and component library for end user registration                                  |
| [Onsite UI](https://github.com/eurofurence/reg-onsite-ui)                                                                             | UI used by the onsite registration team                                                   |
| [Regsys Classic](https://github.com/eurofurence/reg-regsys-classic)                                                                   | Admin UI (and what's left of the regsys we used in the years 2001-2019)                   |

The Eurofurence Registration System depends on the [Eurofurence Identity Provider](https://github.com/Thiritin/identity),
which is also Open Source software (Apache 2.0).

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
