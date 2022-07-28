img1=`shuf -n 1 /home/robin/Bilder/Wallpaper/Anime/list.txt`
img2=$img1
while [[ "$img1" == "$img2" ]]
do 
	img2=`shuf -n 1 /home/robin/Bilder/Wallpaper/Anime/list.txt`
done
ogurictl output HDMI-A-1 --image "/home/robin/Bilder/Wallpaper/Anime/"$img1
ogurictl output DP-1 --image "/home/robin/Bilder/Wallpaper/Anime/"$img2
