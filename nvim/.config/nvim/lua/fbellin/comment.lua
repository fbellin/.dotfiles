local status_ok, comment = pcall(require, 'nvim_comment')
if not status_ok then
	vim.notify('Error while loading nvim-comment plugin')
end

comment.setup({
	line_mapping = "<leader>cl"
})
