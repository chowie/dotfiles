#!/bin/bash

export RECORD_NOTIFICATION_CACHE=${HOME}/.cache/record_notification_history

dbus-monitor "interface='org.freedesktop.Notifications'" | grep --line-buffered  "member=Notify\|string" >> ${RECORD_NOTIFICATION_CACHE}
