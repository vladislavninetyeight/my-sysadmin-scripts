#!/bin/bash
set -euo pipefail

INTERVAL=5
LOG=monitor.log

if ! touch "$LOG" 2>/dev/null; then
  echo "не могу писать в $LOG" >&2
  exit 1
fi

while true; do
  {
    echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---"
    free -h
    df -h
    uptime
    echo
  } >> "$LOG"
  sleep "$INTERVAL"
done
