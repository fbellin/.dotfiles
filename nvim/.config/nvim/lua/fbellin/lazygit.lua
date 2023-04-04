-- local status_ok, lazygit = pcall(require, 'lazygit.nvim')
-- if not status_ok then
-- 	vim.notify("Error while loading lazygit plugin")
-- end

-- lazygit.setup()

-- Keymaps 
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>lg", ":LazyGit<CR>", opts)
