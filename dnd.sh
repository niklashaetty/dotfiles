echo "Toggling dnd mode"
echo "Currently paused?: $(dunstctl is-paused)" 
dunstctl set-paused toggle
echo "Currently paused: $(dunstctl is-paused)"
