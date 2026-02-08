return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc", "query",
        "markdown", "markdown_inline",
        "python", "go", "c", "cpp",
        "javascript", "typescript", "html", "css",
        "rust", "java", "bash",
        "typst",
      },
      sync_install = false,
      auto_install = false,
      highlight = { enable = true },
    })
  end,
}
