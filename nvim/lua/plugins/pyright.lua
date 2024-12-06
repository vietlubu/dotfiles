return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
        pyright = {
          settings = {
            python = {
              pythonPath = "/opt/homebrew/bin/python3.11", -- Replace with the path to your Python interpreter
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    },
  },
}
