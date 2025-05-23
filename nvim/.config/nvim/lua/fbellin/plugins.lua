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

	-- Splashscreen
	use { 'nvimdev/dashboard-nvim' }

	-- Airline
	use "vim-airline/vim-airline"     -- used for falcon theme

	-- Nvim tree
	use {
		'nvim-tree/nvim-tree.lua',
  		requires = {
    		'nvim-tree/nvim-web-devicons', -- optional
  		},
		}

	-- Buffer switcher
	use "matbme/JABS.nvim"

	-- Auto pairs plugin
	use { "windwp/nvim-autopairs" }

	-- Comments plugin
	use { "terrortylor/nvim-comment" }

	-- Git
	use "airblade/vim-gitgutter"
	use 'sindrets/diffview.nvim'

	-- Telescope
	use {
	  'nvim-telescope/telescope.nvim'
	}

	-- LSP and related plugins
	use { "neovim/nvim-lspconfig" }
	use { "mason-org/mason.nvim" }
	use { "mason-org/mason-lspconfig.nvim" }
	use { "jose-elias-alvarez/null-ls.nvim" }
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-cmdline" }

	-- Snippets
	use { "SirVer/ultisnips" }
	use { "honza/vim-snippets" }

	-- Plugins for Svelte
	use { "othree/html5.vim" }
	use { "pangloss/vim-javascript" }
	use { "evanleck/vim-svelte" }

	-- Markdown
	use ('nvim-treesitter/nvim-treesitter')
	use({
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    --requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
    -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function()
        require('render-markdown').setup({})
    end,
	})

	-- CSV
	use('mechatroner/rainbow_csv')

	-- YAML
	use {
  	"cuducos/yaml.nvim",
  	ft = { "yaml" }, -- optional
  	requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim" -- optional
 		},
	}

	-- Debugging features
	use { "puremourning/vimspector" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Keep this at the end afeter all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
