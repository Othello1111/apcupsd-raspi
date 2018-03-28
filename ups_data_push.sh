#!/bin/bash
/etc/init.d/apcupsd start

sleep 5

pi_id=$PIID
date=$(/sbin/apcaccess | egrep -w 'DATE' | cut -d ":" -f2,3 | xargs)
upsname=$(/sbin/apcaccess | egrep -w 'UPSNAME' | cut -d ":" -f2 | xargs)
model=$(/sbin/apcaccess | egrep -w 'MODEL' | cut -d ":" -f2 | xargs)
status=$(/sbin/apcaccess | egrep -w 'STATUS' | cut -d ":" -f2 | xargs)
linev=$(/sbin/apcaccess | egrep -w 'LINEV' | cut -d ":" -f2 | xargs | cut -d "." -f1)
loadpct=$(/sbin/apcaccess | egrep -w 'LOADPCT' | cut -d ":" -f2 | xargs | cut -d "." -f1)
bcharge=$(/sbin/apcaccess | egrep -w 'BCHARGE' | cut -d ":" -f2 | xargs | cut -d "." -f1)
timeleft=$(/sbin/apcaccess | egrep -w 'TIMELEFT' | cut -d ":" -f2 | xargs)
battv=$(/sbin/apcaccess | egrep -w 'BATTV' | cut -d ":" -f2 | xargs | cut -d "V" -f1)
lastxfer=$(/sbin/apcaccess | egrep -w 'LASTXFER' | cut -d ":" -f2 | xargs)

curl --data "pi_id=$pi_id&upsname=$upsname&date=$date&model=$model&status=$status&linev=$linev&loadpct=$loadpct&bcharge=$bcharge&timeleft=$timeleft&battv=$battv&lastxfer=$lastxfer" $APIURL

