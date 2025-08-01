#!/bin/bash

folder="/home/lenovo/acm_mm_dataset/MM_SurgPT_AAAI/static/video"  # 替换为你的文件夹名
find "$folder" -type f \( -iname "*.mp4" -o -iname "*.mov" -o -iname "*.mkv" \) | while read -r file; do
    codec=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of csv=p=0 "$file")
    if [ "$codec" == "h264" ]; then
        echo "[OK] $file is H.264"
    else
        echo "[WARN] $file is NOT H.264 (codec: $codec)"
    fi
done
