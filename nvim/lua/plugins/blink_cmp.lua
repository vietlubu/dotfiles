return {
  "saghen/blink.cmp",
  optional = true,
  dependencies = { "giuxtaposition/blink-cmp-copilot" },
  opts = {
    sources = {
      default = { "lsp" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          kind = "Copilot",
          score_offset = -1000,
          async = true,
        },
      },
    },
    keymap = {
      preset = "default", -- Keep the default preset keymaps
      ["<Tab>"] = {
        "select_next", -- Navigate to the next item when the menu is visible
        "fallback", -- Fallback to the default action when the menu is not visible
      },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
  },
}
