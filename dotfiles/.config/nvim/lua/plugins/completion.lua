return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = {
        function(cmp)
          -- Inside a snippet: Tab only jumps to the next placeholder,
          -- it never accepts a completion item.
          if cmp.snippet_active() then
            return cmp.snippet_forward() or true
          end
          -- Otherwise: accept the first (preselected) completion item.
          return cmp.select_and_accept()
        end,
        "fallback",
      },
      ["<S-Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.snippet_backward() or true
          end
          return cmp.select_prev()
        end,
        "fallback",
      },
    },
    sources = { default = { "lsp", "path", "buffer" } },
  },
}
