#!/bin/bash

# 处理 dotfiles 目录中的隐藏文件（除了 . 和 ..）
files=$(ls -a $1 | grep -E '^.[^.]+')
for file in `echo $files`; do
    if [ -f "$1/$file" ]; then
        echo "Creating symlink for $file"
        ln -sf "$(realpath "$1/$file")" ~/"$file"
    fi
done

# 处理 .config 目录
if [ -d "$1/.config" ]; then
    echo "Processing .config directory..."
    # 确保 ~/.config 目录存在
    mkdir -p ~/.config
    
    # 遍历 .config 目录中的所有内容
    find "$1/.config" -type f | while read -r src_file; do
        # 计算相对路径
        rel_path="${src_file#$1/.config/}"
        dest_file="$HOME/.config/$rel_path"
        
        # 确保目标目录存在
        mkdir -p "$(dirname "$dest_file")"
        
        echo "Creating symlink for .config/$rel_path"
        ln -sf "$(realpath "$src_file")" "$dest_file"
    done
fi

echo "Configuration complete!"
