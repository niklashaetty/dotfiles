#!/bin/sh


##  Author: Niklas Hätty
##  Dotfiles: https://github.com/niklashaetty/dotfiles.git
## 
##  Bootstrap i3 with my personal dotfiles. Use freely.
## 
##  To use this: 
##    1) Install the following packages:
##         * picom
##         * polybar
##         * xfce4-terminal
##         * rofi
##         * sublime-text (optional)
##         * dunst
##         * fontawesome
##         * feh
##    2) git clone https://github.com/niklashaetty/dotfiles.git ~/repositories/dotfiles
##    3) cd ~repositories/dotfiles
##    4) chmod +x bootstrap.sh
##    5) sh bootstrap.sh
##
##  This will create a lot of backups if you run it
##  several times. To clean all backups, run:
##  $ sh bootstrap.sh clean
##
## 

##
#  Global vars
##

DOTFILES_DIR=$HOME/repositories/dotfiles
source $DOTFILES_DIR/tre.sh


##
#  Cleanup backup files. .20* to match .2019- etc.
#  To clean: sh bootstrap.sh clean
##
if [ $1 = '--clean' ]
  then
     echo "Cleaning up old backup files"
     rm $HOME/mimeapps.list.20*
     rm $HOME/.config/polybar/*.20*
     rm $HOME/.config/dunst/*.20*
     rm $HOME/.config/rofi/*.20*
     rm $HOME/.config/picom.conf.20*
     rm $HOME/.config/chrome-flags.conf.20*
     rm $HOME/.bashrc.20*
     rm $HOME/.gitconfig.20*
     rm $HOME/.i3/config.20*
     rm $HOME/.profile.20*
     rm $HOME/.Xmodmap.20*
     rm $HOME/.XResources.20*
     rm $HOME/.vimrc.20*
     rm $HOME/.gtkrc-2.0.20*
     rm $HOME/.vim/colors/nord.vim.20*
     rm $HOME/.config/xfce4/terminal/terminalrc.20*
     rm $HOME/.local/share/xfce4/terminal/colorschemes/Nord.theme.20*
     rm -r $HOME/.config/sublime-text-3-*
     exit
  fi

if [ $1 = '--blue' ]
  then
    POLYBARCONFIG="$DOTFILES_DIR/polybar/config.blue"
    WALLPAPER="$DOTFILES_DIR/img/blue.jpg"

  else
    POLYBARCONFIG="$DOTFILES_DIR/polybar/config"
    WALLPAPER="$DOTFILES_DIR/img/red.jpg"
    LOCKSCREEN="$DOTFILES_DIR/img/lockscreen.jpg"
fi


##
#  If config already exist, create backup with timestamp
##
backup_old_file_if_exists () {
  postfix=".$(date +'%Y-%m-%d-%T')"
  input_file=$1
  if [ -f $input_file ] 
  then
      mv $input_file $input_file$postfix 
      echo "backed up file $input_file"
  fi
} 

##
#  If dir already exists, create backup with timestamp
##
backup_old_dir_if_exists () {
  postfix="-$(date +'%Y-%m-%d-%T')"
  input_dir=$1
  if [ -d $input_dir ] 
  then
      mkdir $input_dir$postfix
      mv $input_dir $input_dir$postfix
      echo "backed up directory $input_dir"
  fi
}

## 
#  Make dirs
## 
mkdir -p $HOME/Pictures
mkdir -p $HOME/.config/polybar
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.config/dunst
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/sublime-text-3
mkdir -p $HOME/.themes
mkdir -p $HOME/.local/share/icons
mkdir -p $HOME/.dotfiles # For extra stuff e.g. i3lock blur
mkdir -p $HOME/.vim/colors
mkdir -p $HOME/.local/share/xfce4/terminal/colorschemes
mkdir -p $HOME/.config/xfce4/terminal


##
#  i3 config
##
backup_old_file_if_exists "$HOME/.i3/config"
cp $DOTFILES_DIR/i3/config $HOME/.i3/config

##
# .config files
##
  # git config
  backup_old_file_if_exists "$HOME/.gitconfig"
  cp $DOTFILES_DIR/config/.gitconfig $HOME/.gitconfig

  # default apps
  backup_old_file_if_exists "$HOME/mimeapps.list"
  cp $DOTFILES_DIR/config/mimeapps.list $HOME/mimeapps.list

  # bash config
  backup_old_file_if_exists "$HOME/.bashrc"
  cp $DOTFILES_DIR/config/.bashrc $HOME/.bashrc

  # .profile
  backup_old_file_if_exists "$HOME/.profile"
  cp $DOTFILES_DIR/config/.profile $HOME/.profile

  # .Xmodmap
  backup_old_file_if_exists "$HOME/.Xmodmap"
  cp $DOTFILES_DIR/config/.Xmodmap $HOME/.Xmodmap

  # .XResources
  backup_old_file_if_exists "$HOME/.XResources"
  cp $DOTFILES_DIR/config/.XResources $HOME/.XResources

  # .chrome-flags
  backup_old_file_if_exists "$HOME/.config/chrome-flags.conf"
  cp $DOTFILES_DIR/config/chrome-flags.conf $HOME/.config/chrome-flags.conf

##
#  Wallpapers
##
cp $WALLPAPER $HOME/Pictures/wallpaper.jpg
cp $LOCKSCREEN $HOME/Pictures/lockscreen.jpg

##
#  polybar
##
backup_old_file_if_exists "$HOME/.config/polybar/config"
backup_old_file_if_exists "$HOME/.config/polybar/launch.sh"
cp $POLYBARCONFIG $HOME/.config/polybar/config
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
backup_old_dir_if_exists "$HOME/.config/sublime-text-3"
cp -a $DOTFILES_DIR/sublime-text-3/. $HOME/.config/sublime-text-3/

##
#  picom
##
backup_old_file_if_exists "$HOME/.config/picom.conf"
cp $DOTFILES_DIR/picom/picom.conf $HOME/.config/picom.conf

##
#  dunst
##
backup_old_file_if_exists "$HOME/.config/dunst/dunstrc"
cp $DOTFILES_DIR/dunst/dunstrc $HOME/.config/dunst/dunstrc

##
#  vim
##
backup_old_file_if_exists "$HOME/.vim/colors/nord.vim"
backup_old_file_if_exists "$HOME/.vimrc"
cp $DOTFILES_DIR/vim/nord.vim $HOME/.vim/colors/
cp $DOTFILES_DIR/vim/.vimrc $HOME/

##
#  xfce4-terminal
##
backup_old_file_if_exists "$HOME/.config/xfce4/terminal/terminalrc"
backup_old_file_if_exists "$HOME/.local/share/xfce4/terminal/colorschemes/Nord.theme"

# Do some magic to replace the font with the one specified in the config file
cp $DOTFILES_DIR/xfce4-terminal/terminalrc $DOTFILES_DIR/xfce4-terminal/terminalrctmp
sed -i "2s/.*/$dotfiles_terminal_font/" $DOTFILES_DIR/xfce4-terminal/terminalrctmp
cp $DOTFILES_DIR/xfce4-terminal/terminalrctmp $HOME/.config/xfce4/terminal/terminalrc
rm $DOTFILES_DIR/xfce4-terminal/terminalrctmp
cp $DOTFILES_DIR/xfce4-terminal/Nord.theme $HOME/.local/share/xfce4/terminal/colorschemes/

##
#  gtk
backup_old_file_if_exists "$HOME/.gtkrc-2.0"
cp -a -n $DOTFILES_DIR/gtk/themes/. $HOME/.themes/
cp -a -n $DOTFILES_DIR/gtk/icons/. $HOME/.local/share/icons/
cp $DOTFILES_DIR/gtk/.gtkrc-2.0 $HOME/

##
#  betterlockscreen
## 
sudo cp $DOTFILES_DIR/betterlockscreen/betterlockscreen /usr/bin/

##
#  Restart i3
## 
i3-msg restart
