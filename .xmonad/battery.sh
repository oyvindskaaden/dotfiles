#!/bin/bash
REM=`cat /proc/acpi/battery/BAT1/state | grep remaining | sed 's/^.*: *\(.*\) mAh/\1/g'`
FULL=`cat /proc/acpi/battery/BAT1/info | grep last  | sed 's/^.*: *\(.*\) mAh/\1/g'`
PERCENT=`expr $REM \* 100 / $FULL`

if cat /proc/acpi/battery/BAT1/state | grep -q " charging"
then
    if [ $PERCENT != 100 ]
    then
    	echo -n "AC $PERCENT%"
    else
    	echo -n "AC"
    fi
else
    TIME=`cat /proc/acpi/battery/BAT*/state | awk '{if ($0 ~ "present rate:"){rate = $3} if($0 ~ "remaining capacity:"){cap = $3}} END {printf "(%d:%02d)\n" ,(cap / rate), (((cap % rate) / rate) * 60)}'`
    echo -n "$PERCENT% $TIME"
fi

echo ""
