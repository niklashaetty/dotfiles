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
* picom
* polybar
* rofi
* sublime-text (optional)
* fontawesome
* dunst
* xfce4-terminal
* feh
* betterlockscreen

## Get started

#### Using Manjaro i3 stock:

1) (Optional) Nifty post-install Manjaro commands

* This will update your download mirrors and then update the list from primary mirrors as well as updating all packages

    ```
    sudo pacman-mirrors --fasttrack && sudo pacman -Syyu
    ```

* This will install power management tools for optimized battery life.

    ```
    sudo pacman -S tlp
    systemctl enable tlp
    systemctl enable tlp-sleep.service
    ```

2) Install the dependencies available in pacman
    
    ```
    sudo pacman -S git compton polybar rofi dunst ttf-font-awesome-4 feh bash-completion
    ```

3) Install dependencies available in AUR

    ```
    pamac build sublime-text-dev xfce4-terminal-git betterlockscreen slack-desktop
    ```

4) git clone https://github.com/niklashaetty/dotfiles.git ~/repositories/dotfiles
5) cd ~/repositories/dotfiles
6) chmod +x bootstrap.sh
7) sh bootstrap.sh <red/blue> <config> . Example: `sh bootstrap.sh blue highdpi`
8) Lock once to set and cache the lockscreen background
    ```
    betterlockscreen -u "$HOME/Pictures/lockscreen.jpg" -l
    ```
9) (optional) Cleanup old backup files that are created: sh bootstrap.sh clean

