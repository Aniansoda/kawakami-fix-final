#!/system/bin/sh
RES=$(sh poc_scan.sh)
echo "{\"result\":\"$RES\"}" > report.json
