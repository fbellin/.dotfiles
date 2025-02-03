local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify("Error while loading nvim-tree configuration")
end

nvim_tree.setup()

local api_status_ok, nvim_tree_api = pcall(require, "nvim-tree.api")
if not api_status_ok then
	vim.notify("Error while loading nvim-tree.api configuration")
end

local function open_nvim_tree()
	-- open the tree
	nvim_tree_api.tree.open()
end

-- open_nvim_tree()

-- Toggles NvimTree
local keymap, opts = require "utils".setup()
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-r>", ":NvimTreeRefresh<CR>", opts)
