local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify("Error while loading nvim-tree.lua")
end

nvim_tree.setup()
