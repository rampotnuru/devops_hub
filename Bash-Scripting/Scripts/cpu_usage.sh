#!/bin/bash

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

echo "Current CPU Usage: $CPU_USAGE%"
