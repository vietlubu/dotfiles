return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "actionlint",
      "ansible-language-server",
      "ansible-lint",
      "antlers-language-server",
      "black",
      "bash-language-server",
      "blade-formatter",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "dot-language-server",
      "emmet-ls",
      "eslint_d",
      "flake8",
      "hadolint",
      "html-lsp",
      "intelephense",
      "nginx-language-server",
      "php-debug-adapter",
      "phpstan",
      "pint",
      "prettierd",
      "pyright",
      "rustywind",
      "shellcheck",
      "shfmt",
      "stylua",
      "tailwindcss-language-server",
    },
    setup = function()
      -- Disable diagnostics for .env files
      vim.api.nvim_create_autocmd("BufRead", {
        pattern = ".env*",
        callback = function()
          vim.diagnostic.enable(false) -- Disable diagnostics for the current buffer
        end,
      })

      -- Ensure syntax highlighting for .env files
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = ".env*",
        command = "set filetype=dotenv",
      })
    end,
  },
}
