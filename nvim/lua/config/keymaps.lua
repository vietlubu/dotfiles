-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>gd", function()
  Util.float_term(
    { "lazydocker", "-f", Util.get_root() .. "docker-compose.yml" },
    { cwd = Util.get_root(), esc_esc = false }
  )
end, { desc = "LazyDocker (root dir)" })

map("n", "<leader>pd", ":Telescope neovim-project discover<CR>", { desc = "Open Project List. Based on patterns" })
map("n", "<leader>ph", ":Telescope neovim-project history<CR>", { desc = "Open Project History" })
map("n", "<leader>ps", ":NeovimProjectLoadHist<CR>", { desc = "Open the previous session" })

map("n", "<C-S-h>", ":vertical resize -10<CR>", { desc = "Resize window left" })
map("n", "<C-S-l>", ":vertical resize +10<CR>", { desc = "Resize window right" })
map("n", "<C-S-k>", ":resize -10<CR>", { desc = "Resize window up" })
map("n", "<C-S-j>", ":resize +10<CR>", { desc = "Resize window down" })
