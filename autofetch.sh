#!/bin/bash

# 脚本名称: fetch_all_git_repos.sh
# 功能: 扫描主目录下所有子文件夹，如果是 git 存储库就执行 git fetch

# 设置起始目录（默认当前用户主目录）
START_DIR="$HOME"

# 颜色输出（可选）
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "开始扫描目录: $START_DIR"
echo "查找 git 存储库并执行 fetch 操作..."
echo ""

# 计数器
count=0
success_count=0
fail_count=0

# 使用 find 命令查找所有 .git 文件夹
while IFS= read -r -d '' git_dir; do
    # 获取存储库的父目录
    repo_dir=$(dirname "$git_dir")

    echo -e "${YELLOW}处理存储库:${NC} $repo_dir"

    # 进入存储库目录
    cd "$repo_dir" || continue

    # 检查是否是 git 存储库（双重检查）
    if git rev-parse --git-dir > /dev/null 2>&1; then
        ((count++))

        # 显示当前分支
        current_branch=$(git branch --show-current 2>/dev/null || echo "未知分支")
        echo "  分支: $current_branch"

        # 执行 git fetch
        echo "  执行 git fetch..."
        if git fetch --all --prune; then
            echo -e "  ${GREEN}✓ fetch 成功${NC}"
            ((success_count++))
        else
            echo -e "  ${RED}✗ fetch 失败${NC}"
            ((fail_count++))
        fi

        # 显示远程更新信息（可选）
        echo "  远程分支状态:"
        git remote show origin 2>/dev/null | grep -E "(本地分支|远程分支|最新)" || echo "    无法获取远程信息"
    else
        echo -e "${RED}警告: 不是有效的 git 存储库${NC}"
    fi

    echo ""
done < <(find "$START_DIR" -mindepth 2 -maxdepth 2 -type d -name ".git" -print0 2>/dev/null)

# 输出总结
echo "========== 扫描完成 =========="
echo "找到的 git 存储库总数: $count"
echo -e "${GREEN}成功 fetch 的数量: $success_count${NC}"
if [ $fail_count -gt 0 ]; then
    echo -e "${RED}fetch 失败的数量: $fail_count${NC}"
fi
