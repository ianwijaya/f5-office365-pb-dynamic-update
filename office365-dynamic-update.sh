#!/bin/bash
/usr/bin/curl -s https://support.content.office.net/en-us/static/O365IPAddresses.xml  | grep "<address>" | sed "s/<address>//g" | sed "s/<\/address>//g" | grep -v "\/"  |awk '{$1=$1};1' | tr -d '\15\32' | sed '$!s/$/,/' > /tmp/office365-dg.txt
tmsh modify ltm data-group external O365 source-path file:///tmp/office365-dg.txt
