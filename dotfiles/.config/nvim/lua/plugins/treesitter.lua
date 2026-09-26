-- nvim-treesitter main 分支：只负责装 parser 和提供 queries，高亮由 nvim 自带的 vim.treesitter 启用。
-- 依赖 tree-sitter CLI（brew install tree-sitter-cli）和 C 编译器；该分支不支持懒加载。
local parsers = {
  "lua", "vim", "vimdoc", "query",
  "markdown", "markdown_inline",
  "python", "go", "c", "cpp",
  "javascript", "typescript", "html", "css",
  "rust", "java", "bash",
  "typst", "svelte",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- 已装的会跳过，异步执行不阻塞启动
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        -- 没有对应 parser 的 filetype 静默跳过
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
