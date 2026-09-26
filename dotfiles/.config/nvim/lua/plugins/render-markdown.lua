-- Markdown 在 buffer 内渲染：render-markdown.nvim
-- 纯 Lua，只依赖 treesitter 的 markdown / markdown_inline parser。
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>mp", "<cmd>RenderMarkdown toggle<cr>", ft = "markdown", desc = "切换 Markdown 渲染" },
    },
    opts = {},
  },
}
