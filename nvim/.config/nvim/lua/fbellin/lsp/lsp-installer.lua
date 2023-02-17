local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	vim.notify("There was an error during nvim-lsp-installer call in lsp-installer.lua")
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)

	local opts = {
		on_attach = require("fbellin.lsp.handlers").on_attach,
		capabilities = require("fbellin.lsp.handlers").capabilities,
	}

	-- if server.name == "jsonls" then
	--	local jsonls_opts = require("fbellin.lsp.settings.jsonls")
	--	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	-- end

	if server.name == "luals_lua_lua" then
		local luals_opts = require("fbellin.lsp.settings.luals_lua")
		opts = vim.tbl_deep_extend("force", luals_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require("fbellin.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server.name == "rust_analyzer" then
		local rust_opts = require("fbellin.lsp.settings.rust_analyzer")
		opts = vim.tbl_deep_extend("force", rust_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configuration.md
	server:setup(opts)
end)
