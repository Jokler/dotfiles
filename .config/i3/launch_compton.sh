#!/bin/bash

# Terminate already running bar instances
killall -q compton

# Wait until the processes have been shut down
while pgrep -u $UID -x compton >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
compton &

echo "compton launched..."
