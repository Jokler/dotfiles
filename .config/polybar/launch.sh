#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

monitors=$(polybar --list-monitors)

left="HDMI-0"
#left="HDMI1"
center=$(printf "%s" "$monitors" | grep primary | cut -d":" -f1)
right="DP-5"
#right="HDMI2"

# Launch Polybar, using default config location ~/.config/polybar/config
MONITOR="$left"   polybar --reload left &
MONITOR="$center" polybar --reload center &
MONITOR="$right"  polybar --reload right &

echo "Polybars launched..."
