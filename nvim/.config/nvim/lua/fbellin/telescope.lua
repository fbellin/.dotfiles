local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
	vim.notify("Error while loading telescope configuration")
end

local status_ok, builtin = pcall(require, 'telescope.builtin')
if not status_ok then
	vim.notify("Error while loading telescope.builtin configuration")
end

telescope.setup()

-- Keymaps for find and grep
local keymap, opts = require "utils".setup()
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>gg", ":Telescope live_grep<CR>", opts)
