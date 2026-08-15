return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
        desc = "Buffer diagnostics (Trouble)",
      },
      {
        "<leader>XX",
        "<cmd>Trouble diagnostics toggle<CR>",
        desc = "All diagnostics (Trouble)",
      },
    },
  },
}
