#!/bin/bash

echo "===== TOP CPU ====="
ps -eo pid,cmd,%cpu --sort=-%cpu | head -6

echo ""
echo "===== TOP MEMORY ====="
ps -eo pid,cmd,%mem --sort=-%mem | head -6
