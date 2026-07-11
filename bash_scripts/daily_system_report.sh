#!/bin/bash

REPORT="daily_report_$(date +%Y%m%d).txt"

{
echo "===================================="
echo "       DAILY SYSTEM REPORT"
echo "===================================="

echo ""
echo "Date & Time:"
date

echo ""
echo "Hostname:"
hostname

echo ""
echo "IP Address:"
hostname -I

echo ""
echo "Logged-in Users:"
who

echo ""
echo "Disk Usage:"
df -h

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "CPU Load:"
uptime

echo ""
echo "Running Services:"
systemctl list-units --type=service --state=running

echo ""
echo "System Uptime:"
uptime -p

} > "$REPORT"

echo "Report generated: $REPORT"
