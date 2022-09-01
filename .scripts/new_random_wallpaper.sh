imgpath=~/Bilder/Wallpaper/Anime
img1=`ls $imgpath | shuf -n 1`
img2=$img1
while [[ "$img1" == "$img2" ]]
do 
	img2=`ls $imgpath | shuf -n 1`
done
ogurictl output HDMI-A-1 --image $imgpath"/"$img1
ogurictl output DP-1 --image $imgpath"/"$img2
