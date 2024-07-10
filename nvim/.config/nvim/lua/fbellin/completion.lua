local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
	vim.notify("Error while loading cmp plugin")
end

cmp.setup({
  sources = {
    { name = 'nvim_lsp' }, -- For nvim-lsp
    { name = 'nvim_lua' }, -- for nvim lua function
    { name = 'path' }, -- for path completion
    { name = 'buffer', keyword_length = 4 }, -- for buffer word completion
  },
  completion = {
    keyword_length = 1,
    completeopt = "menu,noselect"
  },
  view = {
    entries = 'custom',
  },
	mapping = cmp.mapping.preset.insert({
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
	})
})
