#!/bin/bash
#
# Minimal Powermenu for Rofi
#
#
#
# 
#  Author: Shubham Vishwakarma
#  Github: @fchwpo
#  LinkedIn: @shubham1997
#
#
#
#
#
# Install dependencies
sudo apt-get install rofi dmenu -y

# Copy only the neccesary files
cp -r ./powermenu.sh ~/.config/rofi-powermenu
cp -r ./powermenu_theme.rasi ~/.config/rofi-powermenu
sudo cp -r ./fonts/* /usr/share/fonts/


