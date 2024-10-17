# reg-helm-chart

<img src="https://github.com/eurofurence/reg-helm-chart/actions/workflows/helm-unit-tests.yml/badge.svg" alt="test status"/>
<img src="https://github.com/eurofurence/reg-helm-chart/actions/workflows/helm-chart-release.yml/badge.svg" alt="release status"/>

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

## Installation

To use, you just need helm in your path.

To run the unittests, use the [helm-unittest/helm-unittest](https://github.com/helm-unittest/helm-unittest) helm plugin or docker container.

If you have the plugin installed, `helm unittest .` runs all unit tests on the command line.
Your current directory must be `charts/eurofurence-registration-system`.

## Configuring IntelliJ

You will need the Kubernetes and Go Template plugins. 

You may also wish to turn off the display of default values instead of
your actual template code. 
Settings -> Editor -> General -> Code Folding, then it's under Kubernetes.
