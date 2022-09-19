#!/bin/bash

read -p "Please input .mov file path:" srcPath
if [[ -z $srcPath ]]; then
	echo "srcPath is Empty"
	exit 0
fi

read -p "target weight(640): " iweight #640
weight=${iweight:-"640"}

read -p "target frame(24):" iframe #12 less faster
frame=${iframe:-"24"}

dstPath=${srcPath%.*}".gif"

echo "GIF:" $dstPath

ffmpeg -i $srcPath -vf scale=$weight:-1 -r $frame $dstPath

//ffmpeg -i $srcPath -vf scale=$weight:-1 -r $frame -f image2pipe -vcodec ppm - | convert -delay 10 -loop 0 - $dstPath