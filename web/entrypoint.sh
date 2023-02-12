#!/bin/sh

PORT="${1}"
API_HOST="${2}"

# If no port or apiHost is passed, run the command without the flags
# If only one is passed, run the command with the flag
# If both are passed, run the command with both flags
if [ - z "$PORT" ] && [ - z "$API_HOST" ]; then
  yarn rw serve web
elif [ - z "$PORT" ]; then
  yarn rw serve web --apiHost $API_HOST
elif [ - z "$API_HOST" ]; then
  yarn rw serve web --port $PORT
else
  yarn rw serve web --port $PORT --apiHost $API_HOST
fi
