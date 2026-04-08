return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc", "query",
        "markdown", "markdown_inline",
        "python", "go", "c", "cpp",
        "javascript", "typescript", "html", "css",
        "rust", "java", "bash",
        "typst", "svelte"
      },
      sync_install = false,
      auto_install = false,
      highlight = { enable = true },
    })
  end,
}
