local options = {

	number = true,

	tabstop = 4,
	shiftwidth = 4,

	splitright = true,
	splitbelow = true,

	clipboard = "unnamedplus",
	mouse = "a",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
