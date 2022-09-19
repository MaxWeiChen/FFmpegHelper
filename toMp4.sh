#gif to mp4 縮小檔案
#!/bin/bash

read -p "Please input .gif file path:" srcPath
if [[ -z $srcPath ]]; then
	echo "srcPath is Empty"
	exit 0
fi

dstPath=${srcPath%.*}".mp4"

echo "OUT:" $dstPath

ffmpeg -i $srcPath -vcodec libx264 -pix_fmt yuv420p -strict -2 -acodec aac $dstPath
#ffmpeg -i $srcPath -framerate 10 -c:v h264_qsv -b:v 5M $dstPath

#hqx
#super2xsai
#xbr