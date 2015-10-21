#!/bin/bash
set -e

if [ -n "$NEW_RELIC_LICENSE_KEY" ]; then
	nrsysmond-config -c ${NEW_RELIC_SYSMOND_CONFIG:-/etc/newrelic/nrsysmond.cfg} --set license_key=$NEW_RELIC_LICENSE_KEY
elif [ -d "/etc/kube-newrelic/" ]; then
  nrsysmond-config -c ${NEW_RELIC_SYSMOND_CONFIG:-/etc/newrelic/nrsysmond.cfg} --set license_key=$(cat /etc/kube-newrelic/licensekey)
fi

if [ -n "$NEW_RELIC_SYSMOND_LOGLEVEL" ]; then
	nrsysmond-config -c ${NEW_RELIC_SYSMOND_CONFIG:-/etc/newrelic/nrsysmond.cfg} --set loglevel=$NEW_RELIC_SYSMOND_LOGLEVEL
fi

nrsysmond -c ${NEW_RELIC_SYSMOND_CONFIG:-/etc/newrelic/nrsysmond.cfg} -f
