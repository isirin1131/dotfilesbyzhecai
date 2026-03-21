return {
  "ibhagwan/fzf-lua",
  config = function()
    local actions = require("fzf-lua.actions")
    require("fzf-lua").setup({
      buffers = {
        actions = {
          ["alt-x"] = { fn = actions.buf_del, reload = true },
          ["ctrl-x"] = false,
        },
      },
    })
    vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
    vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<CR>")
    vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>")
    vim.keymap.set("n", "<leader>fs", ":FzfLua lsp_document_symbols<CR>")
    vim.keymap.set("n", "<leader>gf", ":FzfLua git_status<CR>")
  end,
}
