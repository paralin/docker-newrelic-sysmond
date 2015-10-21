# paralin/newrelic-sysmond

Run the New Relic server monitor daemon. Intended for Kubernetes clusters, running under a daemonset.

[See New Relic's Getting started](https://docs.newrelic.com/docs/server/new-relic-servers)

## Dockerfile

This Docker image is based on the [phusion/baseimage](https://hub.docker.com/r/phusion/baseimage/) base image.

## Usage

### Stand Alone Usage

* Set env var ```NEW_RELIC_LICENSE_KEY``` to your newrelic license key. [See here](https://docs.newrelic.com/docs/accounts-partnerships/accounts/account-setup/license-key)
* Set hostname using ```-h HOSTNAME``` or using env var ```NEW_RELIC_SYSMOND_HOST```.

```bash
docker run -d -e HOSTNAME=$(hostname) -e NEW_RELIC_LICENSE_KEY=0000000000111111111122222222223333333333 -v /var/run/docker.sock:/var/run/docker.sock -v /proc:/proc -v /dev:/dev -v /sys:/sys --privileged paralin/newrelic-sysmond:v1
```

### With Kubernetes

* Follow the tutorial in the example. [See here](https://github.com/paralin/kubernetes/tree/master/examples/newrelic).
