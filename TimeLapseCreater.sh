
# 輸入位置
BASEDIR=$( dirname $0)
read -p "Please input the [sourcePath]:" sourcePath
sourcePath=${sourcePath:-$BASEDIR}
echo $sourcePath

# 輸出位置
read -p "Please input the [outputPath]:" outputPath
outputPath=${outputPath:-$BASEDIR}
echo $outputPath

# 解析度
read -p "Input resolution(1152x720):" resolution
resolution=${resolution:-"1152x720"}
echo $resolution

ffmpeg\
 -framerate 30\
 -i $sourcePath/%06d.jpg\
 -s $resolution\
 -c:v libx264\
 -pix_fmt yuv420p\
 $outputPath/output.mov


