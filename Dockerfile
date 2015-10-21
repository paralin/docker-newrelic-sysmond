FROM phusion/baseimage:0.9.17

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && \
    apt-get install -y ca-certificates wget && \
    echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list && \
    wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -&& \
    apt-get update && \
    apt-get install -y newrelic-sysmond && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /etc/service/newrelic
ADD newrelic.sh /etc/service/newrelic/run
RUN chmod +x /etc/services/newrelic/run/newrelic.sh
