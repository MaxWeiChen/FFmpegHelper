# 剛才選的videoIndex,可以選那抓那個camera(screen)
ffmpeg -f avfoundation -list_devices true -i ''
read -p "Input video index(1):" videoIdx
videoIdx=${videoIdx:-"1"}
echo $videoIdx

# 每1秒抓n張, 0.2 = 1/5 每5秒抓1張
read -p "Input 1 second fetch N screenshot(0.2):" screenshotOfOneSec
screenshotOfOneSec=${screenshotOfOneSec:-"0.2"}
echo $screenshotOfOneSec

# 解析度
read -p "Input resolution(1152x720):" resolution
resolution=${resolution:-"1152x720"}
echo $resolution

# 輸出位置
BASEDIR=$( dirname $0)
read -p "Please input the [outputPath]:" outputPath
outputPath=${outputPath:-$BASEDIR}
echo $outputPath

# 開始執行Screen Record
ffmpeg -f avfoundation\
 -i $videoIdx\
 -r $screenshotOfOneSec\
 -s $resolution\
 $outputPath/%06d.jpg
