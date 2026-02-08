-- Neovim config directory structure:
--   init.lua                    <- this file (settings + lazy.nvim bootstrap)
--   lua/plugins/*.lua           <- each file returns a plugin spec table
--   lazy.nvim auto-imports all files in lua/plugins/

-- Leader key: used as a prefix for custom keybindings (<leader>e, etc.)
-- Must be set BEFORE loading lazy.nvim so plugins pick it up.
vim.g.mapleader = " "

-- Disable netrw (Vim's built-in file explorer) so nvim-tree can replace it
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab / indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0       -- 0 means "follow tabstop"
vim.opt.expandtab = true
vim.opt.smartindent = true

-- File handling
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
local undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.fn.mkdir(undodir, "p")
vim.opt.undodir = undodir

-- Search
vim.opt.incsearch = true

-- UI
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"


-- Plugin management with lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },  -- auto-imports every lua/plugins/*.lua file
  },
})
