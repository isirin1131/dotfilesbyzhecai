return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "gruvbox" },
        sections = { lualine_c = { { 'filename', path = 3, } }
      }
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
        overrides = {
          CursorLine = { bg = "#3c3836" },
          Cursor = { bg = "#ffffff", fg = "#1d2021" },
          ColorColumn = { bg = "#3c3836" },
          NormalFloat = { bg = "NONE" },
        },
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
