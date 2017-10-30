#!/bin/sh
# Simple while loop to get log rotate working

/usr/sbin/logrotate -v -f /etc/logrotate.d/logrotate

while true
do
  sleep 1h
  /usr/sbin/logrotate -v -f /etc/logrotate.d/logrotate
done
