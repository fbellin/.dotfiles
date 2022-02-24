local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("There was a problem while loading lspconfig in lsp/init.lua")
	return
end

require("fbellin.lsp.lsp-installer")
require("fbellin.lsp.handlers").setup()
