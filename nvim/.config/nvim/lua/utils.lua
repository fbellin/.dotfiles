local function setup()

	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_set_keymap

	return keymap, opts

end

return { setup = setup }
