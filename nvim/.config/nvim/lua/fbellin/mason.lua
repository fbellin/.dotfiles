
-- https://miikanissi.com/blog/how-to-setup-nvim-lsp-for-code-analysis-autocompletion-and-linting/

-- Hook autocompletion plugin to get LSP completion suggestions
local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	vim.notify("Error while loading mason configuration: cmp_nvim_lsp")
end
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Defines key mappings to interact with the LSP server
local on_attach = function(_, bufnr)
	
	-- Replaces standrad nmap function ? 
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- Thene, colors and gui
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	-- nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	-- nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	-- nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymb
	
	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })

end

-- Language servers configuration
local servers = {
	denols = {},
	svelte = {}
}

-- Glues everything in mason configuration

-- Loads Mason
local status_ok, mason = pcall(require, "mason")
if not status_ok then
	vim.notify("Error while loading Mason configuration")
end
mason.setup()

-- Loads Mason LSP config
local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	vim.notify("Error while loading mason-lspconfig configuration")
end
mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers)
})
mason_lspconfig.setup_handlers({
	function(server_name)
		local status_ok, plugin = pcall(require, "lspconfig")
		if not status_ok then
			vim.notify("Error while loadin lspconfig configuration: " .. server_name)
		end
		plugin[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name]
		})
	end
})
