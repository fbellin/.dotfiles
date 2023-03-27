local fn = vim.fn

-- Packer installation
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugin.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup(function(use)

	-- Base plugins here
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"		-- An implementation of the popup API from vim in Neovim
	use "nvim-lua/plenary.nvim"		-- Useful lua functions used in lots of plugins
	use "stevearc/dressing.nvim"	-- Window visual rendering

	-- Themes and color scheme management
	use "fenetikm/falcon"

	-- Airline
	use "vim-airline/vim-airline"     -- used for falcon theme

	-- Nvim tree
	use {
		'nvim-tree/nvim-tree.lua',
  		requires = {
    		'nvim-tree/nvim-web-devicons', -- optional
  		},
		}
	

	-- Automatically set up your configuration after cloning packer.nvim
	-- Keep this at the end afeter all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
