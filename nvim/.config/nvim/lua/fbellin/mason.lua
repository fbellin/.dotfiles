local status_ok, mason = pcall(require, "mason")
if not status_ok then
	vim.notify("Error while loading mason configuration")
end

mason.setup()
