local status_ok, lsp = pcall(require, 'lspconfig')
if not status_ok then
	vim.notify("Error while loading lspconfig plugin")
end

-- Fix Undefined global 'vim'
lsp.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
