return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    opts.highlights = {
      buffer_selected = {
        fg = "#ecf0f1",
        italic = true,
        bold = true,
      },
      warning_selected = {
        fg = "#ecf0f1",
      },
      error_selected = {
        fg = "#ecf0f1",
      },
    }
  end,
}
