#!/usr/bin/env bash

umask 002

exec /usr/bin/tsocks /usr/bin/transmission-daemon -f --no-portmap -g /etc/transmission-daemon
