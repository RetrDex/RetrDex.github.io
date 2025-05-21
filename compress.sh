#!/bin/bash

# 直接指定视频文件目录
VIDEO_DIR="/Users/changfeng/LocalFile/ObjectRetrieval/RetrDex/static/videos/real"

# 进入指定目录
cd "$VIDEO_DIR" || {
    echo "错误: 无法进入目录 $VIDEO_DIR"
    exit 1
}

echo "开始处理目录: $VIDEO_DIR"

# 遍历目录下的所有 mp4 文件
for file in *.mp4; do
    # 检查文件是否存在
    if [ -f "$file" ]; then
        # 构建新文件名（原名称+1.mp4）
        filename="${file%.*}"
        output="${filename}11.mp4"
        
        echo "压缩: $file -> $output"
        
        # 执行压缩命令
        ffmpeg -i "$file" -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 128k "$output"
    fi
done

echo "处理完成"
