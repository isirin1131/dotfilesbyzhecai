return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("pyright", {})
      vim.lsp.config("ts_ls", {})
      -- vim.lsp.config("gopls", {})
      -- vim.lsp.config("clangd", {})
      -- vim.lsp.config("rust_analyzer", {})

      vim.lsp.enable("pyright", true)
      vim.lsp.enable("ts_ls", true)
      -- vim.lsp.enable("gopls", true)
      -- vim.lsp.enable("clangd", true)
      -- vim.lsp.enable("rust_analyzer", true)

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end,
      })
    end,
  },
}
