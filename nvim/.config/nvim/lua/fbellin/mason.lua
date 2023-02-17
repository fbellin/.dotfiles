local status_ok, mason = pcall(require, "mason")
if not status_ok then
	vim.notify("Error while loading mason.nvim in mason.lua")
	return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	vim.notify("Error while loading mason-lspconfig in mason.lua")
	return
end

mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"tsserver",
		"svelte-language-server"
	}
})

