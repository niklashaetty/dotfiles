if [ -z "$1" ]
  then 
    echo "You need to set config file as 2nd argument"
    echo "Valid configs are (without .sh):"
    echo $(ls ./workstation_configs/)
    echo "Example: sh bootstrap.sh blue highdpi"
    exit
fi

DOTFILES_DIR=$HOME/repositories/dotfiles
CONFIG_DIR=$DOTFILES_DIR/workstation_configs/$1.sh
source $CONFIG_DIR

echo "sourced config"
echo "Running xrandr --output $dotfiles_monitor --mode $dotfiles_resolution"
xrandr --output $dotfiles_monitor --mode $dotfiles_resolution
if [ "$dotfiles_monitor" != "eDP-1" ]; then
  echo "Turning off eDP1"
  xrandr --output eDP-1 --off
fi

if [ "$dotfiles_monitor" = "eDP-1" ]; then
  echo "Found laptop monitor setting, will turn on eDP1"
  xrandr --output eDP-1 --auto
fi

