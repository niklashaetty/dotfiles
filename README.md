# dotfiles
Personal dotfiles setup

## Description
Most of the dotfiles are copied from their original authors and modified to my liking.
Credit is given in files where applicable. All credit to the original authors :)

**Window manager:** i3-gaps  
**shell:** bash  
**terminal:** xfce4-terminal  
**bar:** polybar  
**launcher:** rofi  
**notifications:** dunst  
**extras:** compton, sublime, themes and icons in gtk/

## Dependencies  

My setup builds from Manjaro i3, which apperantly comes bundled with gap support now. However, the dotfiles *should* work fine with any i3-gaps setup as long as the dependencies are installed.

Dependencies that I know of:
    * compton
    * polybar
    * rofi
    * sublime-text (optional)
    * fontawesome
    * dunst
    * xfce4-terminal
    * feh

## Get started

# Manjaro i3 stock:

1) Install the dependencies available in pacman
    
    ```
    sudo pacman -S compton polybar rofi dunst ttf-font-awesome feh
    ```

2) Install dependencies available in AUR

    ```
    pamac build sublime-text-dev xfce4-terminal-git
    ```
2) git clone https://github.com/niklashaetty/dotfiles.git ~/repositories/dotfiles
3) cd ~repositories/dotfiles
4) chmod +x bootstrap.sh
5) sh bootstrap.sh
6) (optional) Cleanup old backup files that are created: sh bootstrap.sh clean
