return {
  "nvim-cmp",
  opts = function(_, opts)
    table.insert(opts.sources, 1, { name = "nvim_lsp", priority = 1000 })
    table.insert(opts.sources, 1, { name = "buffer", priority = 750 })
    table.insert(opts.sources, 1, { name = "path", priority = 500 })
    table.insert(opts.sources, { name = "copilot", priority = 250 })
    print(vim.inspect(opts.sources))
  end,
}
