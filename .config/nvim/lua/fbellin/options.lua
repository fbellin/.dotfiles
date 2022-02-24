local options = {

	number = true,

	termguicolors = true,
	
	tabstop = 4,
	shiftwidth = 4,

	swapfile = false,

	splitright = true,
	splitbelow = true,

	clipboard = "unnamedplus",
	mouse = "a",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

