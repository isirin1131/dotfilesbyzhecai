return {
  "ibhagwan/fzf-lua",
  config = function()
    require("fzf-lua").setup()
    vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
    vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<CR>")
    vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>")
    vim.keymap.set("n", "<leader>fs", ":FzfLua lsp_document_symbols<CR>")
    vim.keymap.set("n", "<leader>gf", ":FzfLua git_status<CR>")
  end,
}
