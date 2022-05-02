#!/bin/bash
if [ -z $1 ]; then
	swaymsg output DP-1 pos 1920 0 res 1920x1080@60Hz bg /home/robin/Bilder/Wallpaper/grain.png fill
else
	swaymsg output DP-1 pos 1920 0 res 1920x1080@60Hz bg /home/robin/Bilder/Wallpaper/church_girl.jpg fill
fi
