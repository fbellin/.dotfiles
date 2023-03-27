local status_ok, treesiter_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("Error while loading treesitter configuration")
end

treesiter_config.setup({

	auto_install = true,
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "help", "query", "html", "svelte" },

})
