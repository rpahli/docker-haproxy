#!/bin/bash

nl-qdisc-add --dev=lo --parent=1:4 --id=40: --update plug --buffer
./haproxy -f /tmp/haproxy.cfg -p /tmp/haproxy.pid -sf $(cat /tmp/haproxy.pid)
nl-qdisc-add --dev=lo --parent=1:4 --id=40: --update plug--release-indefinite