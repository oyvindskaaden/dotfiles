#! /bin/bash
REM='cat /sys/class/power_supply/BAT0/capacity'
STAT='cat /sys/class/power_supply/BAT0/status'

if $STAT "Charging"
then
	if [$REM != 100]
	then
		echo -n "B0AC: $REM%"
	else
		echo -n "B0AC"
	fi
else
	echo -n "B0 $REM%"
