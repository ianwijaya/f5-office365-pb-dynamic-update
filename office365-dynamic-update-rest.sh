#!/bin/bash
/usr/bin/curl -s https://endpoints.office.com/endpoints/worldwide?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7 | jq '.[].urls[]' 2> /dev/null  | sed '$!s/$/,/' | sed 's/\"//g'  | sed 's/^*//g' | tr '[:upper:]' '[:lower:]' > /tmp/office365-dg.txt
tmsh modify ltm data-group external O365 source-path file:///tmp/office365-dg.txt
