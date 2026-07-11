#!/bin/bash

REPORT="system_health_report.txt"

echo "==================================" > $REPORT
echo "      SYSTEM HEALTH REPORT        " >> $REPORT
echo "==================================" >> $REPORT

echo "" >> $REPORT

echo "Hostname:" >> $REPORT
hostname >> $REPORT

echo "" >> $REPORT

echo "Uptime:" >> $REPORT
uptime >> $REPORT

echo "" >> $REPORT

echo "Disk Usage:" >> $REPORT
df -h >> $REPORT

echo "" >> $REPORT

echo "Memory Usage:" >> $REPORT
free -h >> $REPORT

echo "" >> $REPORT

echo "CPU Load:" >> $REPORT
uptime | awk -F'load average:' '{print $2}' >> $REPORT

echo "" >> $REPORT

echo "Report Generated Successfully."
cat $REPORT
