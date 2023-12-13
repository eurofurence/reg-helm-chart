# reg-helm-chart

<img src="https://github.com/eurofurence/reg-helm-chart/actions/workflows/helm-unit-tests.yml/badge.svg" alt="test status"/>
<img src="https://github.com/eurofurence/reg-helm-chart/actions/workflows/helm-chart-release.yml/badge.svg" alt="release status"/>

## Overview

A helm chart that can deploy the Eurofurence Registration System.

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
