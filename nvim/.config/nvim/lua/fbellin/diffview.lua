-- Keymaps 
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>gv", ":DiffviewOpen<CR>", opts)
keymap("n", "<leader>gc", ":DiffviewClose<CR>", opts)
