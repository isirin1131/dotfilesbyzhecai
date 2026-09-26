return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("pyright", {})
      vim.lsp.config("ts_ls", {})
      vim.lsp.config("jdtls", {})

      -- Typst：tinymist 提供语言服务、格式化、导出与 Web 预览命令。
      -- 只在装了 tinymist 的机器上启用，缺了不报错。
      if vim.fn.executable("tinymist") == 1 then
        vim.lsp.config("tinymist", {
          settings = {
            formatterMode = "typstyle",
          },
        })
        vim.lsp.enable("tinymist", true)
      end
      -- vim.lsp.config("gopls", {})
      -- vim.lsp.config("clangd", {})
      -- vim.lsp.config("rust_analyzer", {})

      vim.lsp.enable("pyright", true)
      vim.lsp.enable("ts_ls", true)
      vim.lsp.enable("jdtls", true)
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

          -- Typst 浏览器预览：直接调用 tinymist 自带的预览服务
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "tinymist" then
            -- 预览实例挂在 tinymist 进程上，开关状态也按 client 记
            vim.keymap.set("n", "<leader>tp", function()
              local on = client.typst_preview_on
              -- startDefaultPreview 的任务 id 固定为 default_preview；kill 不传参数会报错
              local command = on and "tinymist.doKillPreview" or "tinymist.startDefaultPreview"
              local arguments = on and { "default_preview" } or {}
              client:exec_cmd({ title = "Typst 预览", command = command, arguments = arguments }, { bufnr = args.buf }, function(err)
                if err then
                  vim.notify("Typst 预览失败：" .. err.message, vim.log.levels.ERROR)
                  return
                end
                client.typst_preview_on = not on
                vim.notify(on and "Typst 预览已关闭" or "Typst 预览已开启")
              end)
            end, { buffer = args.buf, desc = "切换 Typst 预览" })
          end
        end,
      })
    end,
  },
}
