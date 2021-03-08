#!/bin/sh

# set if this is a high dpi screen. WIll be used in individual configs later.
export dotfiles_highdpi_monitor=false

# monitor check with xrandr
export dotfiles_monitor="HDMI1"
export dotfiles_resolution="3440x1440"

# bar height
export dotfiles_bar_height="35"

# Font for icon in the polybat
export dotfiles_icon_font="Font Awesome 5 Free:style=Solid:pixelsize=11;1"

# Font for text in the polybar
export dotfiles_text_font="DejavVuSans:size=11;2"

# Will replace 2nd line in terminalrc
export dotfiles_terminal_font="FontName=Source Code Pro 11"

# Will replace 1st line in rofi config.
export dotfiles_rofi_font="rofi.font: Source Code Pro 11"
