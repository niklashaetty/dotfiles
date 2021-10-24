#!/bin/sh

# set if this is a high dpi screen. WIll be used in individual configs later.
export dotfiles_highdpi_monitor=true

# monitor check with xrandr
export dotfiles_monitor="eDP-1"
export dotfiles_resolution="3840x2160"

# bar height
export dotfiles_bar_height="55"

# Font for icon in the polybat
export dotfiles_icon_font="Font Awesome 5 Free:style=Solid:pixelsize=20;2"

# Font for text in the polybar
export dotfiles_text_font="DejavVuSans:size=20;2"

# Will replace 2nd line in terminalrc
export dotfiles_terminal_font="FontName=Source Code Pro 20"

# Will replace 1st line in rofi config.
export dotfiles_rofi_font="font: \"Source Code Pro 20\";"
