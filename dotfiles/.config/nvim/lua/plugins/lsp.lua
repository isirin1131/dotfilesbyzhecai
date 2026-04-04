return {
  {
    "echasnovski/mini.completion",
    config = function()
      require("mini.completion").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    tag = "v2.1.0",
  config = function()
    local lspconfig = require("lspconfig")
    -- 按需启用，前提是系统已安装对应语言服务器
    lspconfig.pyright.setup({})
    lspconfig.ts_ls.setup({})
    -- lspconfig.gopls.setup({})
    -- lspconfig.clangd.setup({})
    -- lspconfig.rust_analyzer.setup({})

    -- 快捷键（打开任何有 LSP 的文件自动生效）
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
