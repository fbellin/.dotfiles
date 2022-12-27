-- Vim mode reminder
-- 	n : noemal mode
-- 	i : insert mode
-- 	v : visual mode
-- 	x : visual block mode
-- 	t : terminal mode
-- 	c : command mode

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>b", ":BufferSwitcher<CR>", opts)

-- Indent text
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- .. also in visual block mode
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Improves yank/paste handling
keymap("v", "p", '"_dP', opts)

-- Telescope keymaps
-- keymap("n", "<c-f>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = 10 }))<cr>", opts)
keymap("n", "<C-f>", "<cmd>Telescope find_files hidden=true<cr>", opts)
keymap("n", "<C-g>", "<cmd>Telescope live_grep<cr>", opts)

-- nvim tree file explorer
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-r>", ":NvimTreeRefresh<CR>", opts)

-- Git
keymap("n", "<leader>d", ":DiffviewOpen<CR>", opts)
keymap("n", "<leader>h", ":DiffviewFileHistory<CR>", opts)
keymap("n", "<leader>c", ":DiffviewClose<CR>", opts)

-- Debugging
keymap("n", "<leader>dd", ":call vimspector#Launch()<CR>", opts)
keymap("n", "<leader>de", ":call vimspector#Reset()<CR>", opts)
keymap("n", "<leader>dc", ":call vimspector#Continue()<CR>", opts)

keymap("n", "<leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opts)
keymap("n", "<leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opts)

keymap("n", "<leader>dk", ":call vimspector#Restart()<CR>", opts)
keymap("n", "<leader>dh", ":call vimspector#StepOut()<CR>", opts)
keymap("n", "<leader>dl", ":call vimspector#StepInto()<CR>", opts)
keymap("n", "<leader>dj", ":call vimspector#StepOver()<CR>", opts)
