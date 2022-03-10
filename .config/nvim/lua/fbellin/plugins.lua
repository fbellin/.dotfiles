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

	-- Themes and color scheme management
	use "fenetikm/falcon"

	-- Completion plugins
	use "hrsh7th/nvim-cmp"			-- The completion plugin
	use "hrsh7th/cmp-buffer"		-- buffer commpletions
	use "hrsh7th/cmp-path"			-- path completions
	use "hrsh7th/cmp-cmdline"		-- command line completions
	use "hrsh7th/cmp-nvim-lsp"		-- completion from lsp
	use "hrsh7th/cmp-nvim-lua"		-- completion from nvim api in lua (ie: get vim.* in completion)
	use "saadparwaiz1/cmp_luasnip"  -- snippet completions

	-- Snippets plugins
	use "L3MON4D3/LuaSnip"				-- Snippet engine plugin
	use "rafamadriz/friendly-snippets"	-- a bunch of snippets

	-- Language Server Protocol (LSP) plugins
	use "neovim/nvim-lspconfig"				-- Main neovim LSP plugin
	use "williamboman/nvim-lsp-installer"	-- User-friendly language installer for LSP

	-- Telescop fuzzy fnder
	use "nvim-telescope/telescope.nvim"

	-- Tree sitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}

	-- Airline
	use "vim-airline/vim-airline"     -- used for falcon theme

	-- Git
	use "lewis6991/gitsigns.nvim"

	-- Comments and autopairs
	use "numToStr/Comment.nvim"
	use "windwp/nvim-autopairs"

	-- Tabs and buffer line
	use "kyazdani42/nvim-web-devicons"
	use "akinsho/bufferline.nvim"

	-- File explorer
	use "kyazdani42/nvim-tree.lua"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Keep this at the end afeter all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
