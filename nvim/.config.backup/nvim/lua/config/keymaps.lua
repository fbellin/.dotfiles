
-- Remap space as leader key
vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Open netrw
keymap("n", "<leader><ESC>", ":Ex<CR>", { desc = "Opens netrw" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Resize window to the top" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Resize window to the bottom" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window to the left" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window to the right" })

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Navigate to buffer on the right" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Navigate to buffer on the left" })

-- Indent text
keymap("v", "<", "<gv", { desc = "Indent to the left" })
keymap("v", ">", ">gv", { desc = "Indent to the right" })

-- Improves yank/paste handling
-- keymap("v", "p", '"_dP', { desc = "Paste text in visual mode" })
