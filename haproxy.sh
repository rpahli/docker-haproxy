#!/bin/bash

nl-qdisc-add --dev=lo --parent=1:4 --id=40: --update plug --buffer
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -D -p /var/run/haproxy.pid -sf $( cat /var/run/haproxy.pid )
nl-qdisc-add --dev=lo --parent=1:4 --id=40: --update plug --release-indefinite
