#!/bin/bash

#
# Minimal Powermenu for Rofi
# 
#  Author: Shubham Vishwakarma
#  Github: @fchwpo
#  LinkedIn: @shubham1997
#

# Options as characters
# Copied from decoded unicodes (Please Install linearicons provided)
shutdown=""; # "\uE83E"
reboot=""; # "\uE862"
sleep=""; # "\uE808"
logout=""; # "\uE820"
lock=""; # "\uE80F"
options="$shutdown\n$reboot\n$sleep\n$logout\n$lock"

# Get Font size according to screen dimensions
DEFAULT_WIDTH=1920
WIDTH=$(xdpyinfo | grep dimensions | awk '{print $2}' | cut -d 'x' -f 1 )
DEFAULT_FONTSIZE=60
FONTSIZE=$(echo "$WIDTH/$DEFAULT_WIDTH*$DEFAULT_FONTSIZE" | bc -l)

while getopts "lp" OPT; do
    case "$OPT" in
        p) PRESELECTION=0 ;;
        l) PRESELECTION=3 ;;
        *) PRESELECTION=4 ;;
    esac
done
if (( $OPTIND == 1 )); then
   PRESELECTION=4
fi

selected="$(echo -e "$options" | 
            rofi -show-icons -theme ~/.config/rofi-powermenu/powermenu_theme.rasi \
                 -fake-transparency \
                 -font "FantasqueSansMono, $FONTSIZE" \
                 -p "" -dmenu -selected-row ${PRESELECTION})"

case $selected in

    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $sleep)
        systemctl suspend
        exec ~/bin/lockscreen # Add script to lockscreen
        ;;
    $lock)
        exec ~/bin/lockscreen # Add script to lockscreen
        ;;
    $logout)
        pkill -KILL -u vshubham # Kill all user process
        ;;
esac

