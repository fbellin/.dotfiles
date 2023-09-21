local globals = {

	-- disable netrw at the very start of your init.lua (strongly advised in nvim-tree documentation)
	loaded_netrw = 1,
	loaded_netrwPlugin = 1

}

local options = {

	number = true,

	termguicolors = true,

	tabstop = 2,
	shiftwidth = 2,
	signcolumn = "yes:2",
	numberwidth = 1,

	swapfile = false,

	splitright = true,
	splitbelow = true,

	clipboard = "unnamed",
	mouse = "a",

	updatetime = 500
}

for k, v in pairs(globals) do 
	vim.g[k] = v
end

for k, v in pairs(options) do
	vim.opt[k] = v
end

