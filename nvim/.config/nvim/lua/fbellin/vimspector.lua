vim.g["vimspector_enable_mappings"] = "HUMAN"

vim.api.nvim_set_keymap('n', '<F2>', ":VimspectorReset<CR>", { noremap = true, silent = true });
