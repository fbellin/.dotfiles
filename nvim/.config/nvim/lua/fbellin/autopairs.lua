local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	vim.notify("Error while loading autopairs configuration")
end

autopairs.setup()
