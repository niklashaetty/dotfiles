#------------------------------------------------------------
# POLYBAR - Status bar
#
# Polybar launch program
#
# accent color for polybar is set in 
# * /etc/init.d/accent_color.sh
# * /bin/accent (present in git repo dotfiles)
#
# Move this file to $HOME/.config/polybar/config
#------------------------------------------------------------
# Author:       Adrien CARBONARO
# Dotfiles :    www.github.com/adriencarbonaro/dotfiles.git
#------------------------------------------------------------

# Terminate already runnning bars
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#TODO FIX
source ~/repositories/dotfiles/tre.sh

# Launch carbo bar
polybar -r carbo1 &
