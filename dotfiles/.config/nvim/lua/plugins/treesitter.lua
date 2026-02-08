local parser_dir = vim.fn.stdpath("data") .. "/treesitter-parsers"
vim.opt.runtimepath:prepend(parser_dir)

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      parser_install_dir = parser_dir,
      ensure_installed = {
        "lua", "vim", "vimdoc", "query",
        "markdown", "markdown_inline",
        "python", "go", "c", "cpp",
        "javascript", "typescript", "html", "css",
        "rust", "java", "bash",
        "typst",
      },
    })
    -- Enable treesitter highlighting for all filetypes that have a parser installed
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
