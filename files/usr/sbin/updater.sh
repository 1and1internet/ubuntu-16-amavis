#!/bin/bash

while true ; do
   freshclam || echo "Failed to get clamav update, I'll try again later."
   su -c sa-update debian-spamd && echo "Updated spamassassin" || echo "Failed to get spamassassin update, I'll try again later."
   sleep 12h
done
