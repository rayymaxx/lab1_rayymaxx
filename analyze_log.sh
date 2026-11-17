#!/bin/bash

LOG_FILE="${1:-transit_session.log}"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: log file '$LOG_FILE' not found. Run road_simulation.py first." >&2
    exit 1
fi

sessions=$(grep -c "New session started" "$LOG_FILE")
zebras=$(grep -c "Zebra crossing!" "$LOG_FILE")
lane_changes=$(grep -c "Changing lane:" "$LOG_FILE")

start_line=$(grep -n "New session started" "$LOG_FILE" | tail -1 | cut -d: -f1)
if [ -z "$start_line" ]; then
    start_line=1
fi
latest=$(tail -n +"$start_line" "$LOG_FILE")

driver=$(echo "$latest" | grep "\] Driver *:" | tail -1 | sed 's/.*Driver *: *//')
top_speed=$(echo "$latest" | grep "\] Top speed *:" | tail -1 | sed 's/.*Top speed *: *//')

echo "===== LOG ANALYSIS: $LOG_FILE ====="
echo "Sessions (runs)       : $sessions"
echo "Zebra crossing stops  : $zebras"
echo "Lane changes          : $lane_changes"
echo "----- Latest trip -----"
if [ -z "$driver" ] || [ -z "$top_speed" ]; then
    echo "The latest session has no finished trip report yet."
else
    echo "Driver                : $driver"
    echo "Top speed             : $top_speed"
fi