#!/usr/bin/env sh

# Terminate already running bar instances
killall -q lemonbuddy

sleep 2
# Launch bar1 and bar2
lemonbuddy top &
#lemonbuddy bar2 &

echo "Bars launched..."
