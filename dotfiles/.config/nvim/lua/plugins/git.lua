return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
    })
    vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>")
    vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_buffer<CR>")
  end,
}
