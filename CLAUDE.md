# CLAUDE.md

本文件为 Claude Code (claude.ai/code) 在此仓库中工作时提供指引。

## 概述

个人 dotfiles 仓库，管理 Neovim、Git 和 Vim 的配置文件。通过符号链接脚本安装（非 GNU Stow）。

## 安装

```bash
./autoconfig.sh ./dotfiles
```

将 `dotfiles/` 中的文件递归地符号链接到 `$HOME`，自动处理 `.config/` 子目录结构。

## Neovim 配置

- **插件管理器：** lazy.nvim（在 `dotfiles/.config/nvim/init.lua` 中引导启动）
- **Leader 键：** 空格
- **插件定义：** 从 `dotfiles/.config/nvim/lua/plugins/` 自动导入，每个文件返回一个 lazy.nvim 插件 spec 表
- **配色方案：** gruvbox（ellisonleao fork），启用透明模式
- **文件浏览器：** nvim-tree（`<leader>e` 切换）

添加新插件时，在 `lua/plugins/` 下新建文件，或添加到已有的主题文件中（如 UI 相关插件放入 `ui.lua`）。

## Git 规范

提交信息遵循 `dotfiles/.gitmessage` 中定义的约定式提交格式：
`feat:`、`fix:`、`hotfix:`、`refactor:`、`docs:`、`chore:`
