#!/bin/bash

PIDFILE="/tmp/live-server.pid"

# If PID file exists, try stopping the live-server
if [ -f "$PIDFILE" ]; then
	PID=$(cat "$PIDFILE")

	if kill -0 $PID >/dev/null 2>&1; then
		echo "Stopping live-server..."
		kill $PID
		rm "$PIDFILE"
	else
		echo "live-server process not found, removing stale PID file."
		rm "$PIDFILE"
	fi
else
	echo "Starting live-server..."
	nohup live-server --browser="google-chrome" >/dev/null 2>&1 &
	echo $! >"$PIDFILE"
fi
