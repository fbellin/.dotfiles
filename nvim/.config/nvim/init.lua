require "fbellin.options"
require "fbellin.plugins"
require "fbellin.keymaps"
require "fbellin.colorschemes"
require "fbellin.nvim-tree"
require "fbellin.gitgutter"
require "fbellin.autopairs"
require "fbellin.mason"
require "fbellin.telescope"
require "fbellin.diffview"
require "fbellin.completion"
require "fbellin.comment"
require "fbellin.vimspector"
require "fbellin.buffers"
require "fbellin.snippets"
require "fbellin.dashboard"

vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = "powershell.exe Get-Clipboard | tr -d '\r'",
    ["*"] = "powershell.exe Get-Clipboard | tr -d '\r'",
  },
}
