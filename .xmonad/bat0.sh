#! /bin/bash
REM=$(cat /sys/class/power_supply/BAT0/capacity | tr -dc "0-9")
STAT=$(cat /sys/class/power_supply/BAT0/status | tr -dc "A-z")
AC=$(cat /sys/class/power_supply/AC/online | tr -dc "0-9")

if [ "$STAT" = "Charging" ]
then
	if [ $REM != "100" ]
	then
		echo -n "B0AC:$REM%"
	else
		echo -n "B0:AC"
	fi

elif [ "$STAT" = "Unknown" ] && [ "$AC" = "1" ]
then	
	echo -n "B0:AC"

else
	echo -n "B0:$REM%"
fi

echo ''
