#!/usr/bin/env bash

# Script to start all Lux HUD conky widgets.
# As you can see below all conky processes gets killed
# first before running since this is a collection that takes
# up the whole desktop. Feel free to modify this for you needs.
# Author: Mikael Luxwarp Carlsson mikael.m.carlsson@gmail.com https://codeiolo.org
# License: ISC.

# MONITOR_COUNT=$(xrandr | grep -sw 'connected' | wc -l)
# MONITOR_INDEX=$(( MONITOR_COUNT - 1 ))

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

MONITOR_INDEX=0

echo "MONITOR_COUNT = ${MONITOR_COUNT} | MONITOR_INDEX = ${MONITOR_INDEX}"

# Let the desktop load for a few seconds before running
sleep 5

# Kill all current conky processes.
killall conky

echo "Please, stand by..."
sleep 5

# Starting all lux-hud conky widgets.
conky -c ${DIR}/lux-sysinfo.conf -m ${MONITOR_INDEX} &
conky -c ${DIR}/lux-cpu.conf -m ${MONITOR_INDEX} &
# conky -c ~/.config/conky/lux-hud/lux-memory.conf -m ${MONITOR_INDEX} &
# conky -c ~/.config/conky/lux-hud/lux-disks.conf -m ${MONITOR_INDEX} &
# conky -c ~/.config/conky/lux-hud/lux-network.conf -m ${MONITOR_INDEX} &
conky -c ${DIR}/lux-right.conf -m ${MONITOR_INDEX} &
conky -c ${DIR}/lux-processes.conf -m ${MONITOR_INDEX} &
#conky -c ~/.config/conky/lux-hud/lux-log.conf &
# conky -c ~/.config/conky/lux-hud/lux-clock.conf &
