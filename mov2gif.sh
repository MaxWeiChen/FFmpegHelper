#!/bin/bash

read -p "Please input .mov file path:" movPath
if [[ -z $movPath ]]; then
	echo "movPath is Empty"
	exit 0
fi

read -p "target weight(640): " iweight #640
weight=${iweight:-"640"}
read -p "target frame(12):" iframe #12 less faster
frame=${iframe:-"12"}

gifPath=${movPath%.*}".gif"

echo "GIF:" $gifPath

ffmpeg -i $movPath -vf scale=$weight:-1 -r $frame -f image2pipe -vcodec ppm - | convert -delay 5 -layers Optimize -loop 0 - $gifPath