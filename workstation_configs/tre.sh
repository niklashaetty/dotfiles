#!/bin/sh

# set if this is a high dpi screen. WIll be used in individual configs later.
export dotfiles_highdpi_monitor=false

# monitor check with xrandr
export dotfiles_monitor="VGA-1"
export dotfiles_resolution="1920x1080"

# bar height
export dotfiles_bar_height="35"

# Font for icon in the polybat
export dotfiles_icon_font="Font Awesome 5 Free:style=Solid:pixelsize=10;2"

# Font for text in the polybar
export dotfiles_text_font="DejavVuSans:size=10;2"

# Will replace 2nd line in terminalrc
export dotfiles_terminal_font="FontName=Source Code Pro 10"

# Will replace 1st line in rofi config.
export dotfiles_rofi_font="rofi.font: DejaVuSans 8"
