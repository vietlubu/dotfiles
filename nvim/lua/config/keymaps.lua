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

local default_opts = { noremap = true }

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
map("n", "<C-M-k>", ":resize -10<CR>", { desc = "Resize window up" })
map("n", "<C-M-j>", ":resize +10<CR>", { desc = "Resize window down" })

map("n", "<C-S-k>", ":m -2<CR>", { desc = "Move line up" })
map("n", "<C-S-j>", ":m +1<CR>", { desc = "Move line down" })

-- vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {noremap = true, silent = true})
map(
  "n",
  "<Leader>ff",
  ':lua require"telescope.builtin".find_files({ hidden = true })<CR>',
  { noremap = true, silent = true }
)

map("n", "<leader>fC", ':let @+ = expand("%")<CR>', { desc = "Copy relative path" })

vim.keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").find_files({
    hidden = true,
    no_ignore = true, -- This ensures ignored files (from .gitignore) are also shown
  })
end, { desc = "Find Files (Hidden)" })

-- remap `d` to `"_d`
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "<D-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<D-s>", "<ESC>:w<CR>", { noremap = true, silent = true })
