local status_ok, jabs = pcall(require, 'jabs')
if not status_ok then
	vim.notify('Error while loading jabs plugin')
end

jabs.setup()
