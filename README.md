# dotfilesbyzhecai

个人 dotfiles 仓库，管理 Neovim、Git 和 Vim 的配置，通过符号链接脚本安装。

## 安装

```bash
./autoconfig.sh ./dotfiles
```

将 `dotfiles/` 中的文件递归地符号链接到 `$HOME`，自动处理 `.config/` 子目录结构。
注意：新增配置文件后需要重新运行一次该脚本，新文件才会被链接。

## 目录结构

```
dotfiles/
├── .config/nvim/      # Neovim 配置（lazy.nvim）
├── .gitconfig         # Git 用户、别名、编辑器、全局 ignore、提交模板
├── .gitignore_global
├── .gitmessage        # 约定式提交模板
└── .vimrc             # Vim 配置
```

## Neovim 配置

- **插件管理器：** lazy.nvim（在 `init.lua` 中引导启动）
- **Leader 键：** 空格
- **插件定义：** `lua/plugins/` 下每个文件返回一个 lazy.nvim spec，自动导入

| 文件 | 内容 |
| --- | --- |
| `ui.lua` | nvim-tree、lualine、gruvbox（透明模式） |
| `fzf.lua` | fzf-lua 模糊搜索 |
| `git.lua` | gitsigns（行内 blame、diff） |
| `lsp.lua` | nvim-lspconfig（pyright / ts_ls / jdtls） |
| `trouble.lua` | Trouble（诊断列表） |
| `completion.lua` | blink.cmp 自动补全 |
| `treesitter.lua` | nvim-treesitter 语法高亮 |

### 常用快捷键

Leader 键为空格，以下为全部自定义键位：

**通用**

- `<leader>z` — 跳回上一个位置（等同 `<C-o>`）
- `<leader>e` — 切换文件树（nvim-tree）

**fzf-lua 模糊搜索**

- `<leader>ff` — 找文件
- `<leader>fg` — 全局搜索（live grep）
- `<leader>fb` — buffer 列表（`alt-x` 关闭选中 buffer）
- `<leader>ls` — 当前文件 LSP 符号
- `<leader>gf` — git status 文件列表

**Git（gitsigns）**

- `<leader>gd` — 查看当前文件 diff
- `<leader>gr` — 还原当前文件的改动

**LSP**（attach 后生效）

- `gd` — 跳转定义
- `gr` — 查找引用
- `K` — 悬浮文档
- `<leader>rn` — 重命名符号
- `<leader>xx` — 当前 buffer 的诊断列表（Trouble）
- `<leader>XX` — 全部诊断列表（Trouble）

**补全（blink.cmp 默认键位）**

- `<C-n>` / `<C-p>` — 选择下 / 上一项
- `<C-y>` — 确认
- `<C-e>` — 关闭菜单
- `<C-space>` — 手动唤起 / 切换文档浮窗

## 其他脚本

- `autofetch.sh` — 扫描 `$HOME` 一级子目录下的 git 仓库，批量 `git fetch --all --prune`

## Git 提交规范

提交信息遵循约定式提交（见 `dotfiles/.gitmessage`）：
`feat:`、`fix:`、`hotfix:`、`refactor:`、`docs:`、`chore:`
