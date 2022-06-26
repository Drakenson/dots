#/bin/bash

#img="eoan.png"
img=$1
swaymsg output "HDMI-A-1" bg "/home/robin/Bilder/Wallpaper/$img" fill
swaymsg output "DP-1" bg "/home/robin/Bilder/Wallpaper/$img" fill

#img=`shuf -n 1 /home/robin/Bilder/Wallpaper/Single/list.txt`
#swaymsg output "HDMI-A-1" bg "/home/robin/Bilder/Wallpaper/Single/$img-0.png" fill
#swaymsg output "DP-1" bg "/home/robin/Bilder/Wallpaper/Single/$img-1.png" fill
