#!/bin/sh

##  Author: Niklas Hätty
##  Dotfiles: https://github.com/niklashaetty/dotfiles.git
## 
##  Bootstrap i3 with my personal dotfiles. Use freely.
## 
##  To use this: 
##    1) Install the following packages:
##         * compton
##         * polybar
##         * rxvt-unicode (URxvt)
##         * rofi
##         * sublime-text
##         * dunst
##    2) git clone https://github.com/niklashaetty/dotfiles.git ~/repositories/dotfiles
##    3) cd ~repositories/dotfiles
##    4) chmod +x bootstrap.sh
##    5) sh bootstrap.sh
## 

##
#  Global vars
##
DOTFILES_DIR=$HOME/repositories/dotfiles

##
#  If config already exist, create backup with timestamp
##
backup_old_file_if_exists () {
  postfix=".$(date +'%Y-%m-%d-%T')"
  input_file=$1
  if [ -f $input_file ] 
  then
      mv $input_file $input_file$postfix 
      echo "$input_file already exists, backed it up before overwriting"
  fi
} 

##
#  If dir already exists, create backup with timestamp
##
backup_old_dir_if_exists () {
  postfix=".$(date +'%Y-%m-%d-%T')"
  input_dir=$1
  if [ -d $input_dir ] 
  then
      mkdir $input_dir$postfix
      mv -r $input_dir/. $input_dir$postfix/
      echo "$input_dir already exists, backed it up before overwriting"
  fi
}

$DOTFILES_DIR/i3/config $HOME/.i3/config

## 
#  Make dirs
## 
mkdir -p $HOME/.config/polybar
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/sublime-text
mkdir -p $HOME/.themes

##
#  i3 config
##
backup_old_file_if_exists "$HOME/.i3/config"
cp $DOTFILES_DIR/i3/config $HOME/.i3/config

##
#  polybar
##
backup_old_file_if_exists "$HOME/.config/polybar/config"
backup_old_file_if_exists "$HOME/.config/polybar/launch.sh"
cp $DOTFILES_DIR/polybar/config $HOME/.config/polybar/
cp $DOTFILES_DIR/polybar/launch.sh $HOME/.config/polybar/
chmod +x $HOME/.config/polybar/launch.sh

##
#  rofi
##
backup_old_file_if_exists "$HOME/.config/rofi/config"
backup_old_file_if_exists "$HOME/.config/rofi/carbo.rasi"
cp $DOTFILES_DIR/rofi/config $HOME/.config/rofi/
cp $DOTFILES_DIR/rofi/carbo.rasi $HOME/.config/rofi/

##
#  sublime-text
##
backup_old_dir_if_exists "$HOME/.config/sublime-text/"
cp -a $DOTFILES_DIR/sublime-text/. $HOME/.config/sublime-text/

##
#  compton
##
backup_old_file_if_exists "$HOME/.config/compton.conf"
cp $DOTFILES_DIR/compton/compton.conf $HOME/.config/compton.conf

##
#  dunst
##
backup_old_file_if_exists "$HOME/.config/dunst/dunstrc"
cp $DOTFILES_DIR/dunst/dunstrc $HOME/.config/dunst/dunstrc

##
#  gtk
##
cp -a $DOTFILES_DIR/gtk/themes/. $HOME/.themes/
cp -a $DOTFILES_DIR/gtk/icons/. /usr/share/icons/

##
#  Restart i3
## 
i3-msg restart