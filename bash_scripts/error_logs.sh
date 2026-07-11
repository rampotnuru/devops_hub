#!/bin/bash

echo "Enter log file path:"
read LOGFILE

tail -f "$LOGFILE" | grep --line-buffered "ERROR"
