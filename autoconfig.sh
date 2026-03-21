#!/bin/bash

# 处理 dotfiles 目录中的隐藏文件（除了 . 和 ..）
for file in "$1"/.[!.]*; do
    if [ -f "$file" ]; then
      name=$(basename "$file")
        echo "Creating symlink for $name"
        ln -sf "$(realpath "$file")" ~/"$name"
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
