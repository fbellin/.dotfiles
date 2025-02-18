local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
	vim.notify("Error while loading dashboard configuration")
end

vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#99a4bc", bold = true })
vim.api.nvim_set_hl(0, "DashboardCenterIcon", { fg = "#ff761a", bold = true })
vim.api.nvim_set_hl(0, "DashboardCenterText", { fg = "#ffc552", bold = true })

local menu = {
    { "󰆧", "Update Packages", "u", ":PackerUpdate" },
    { "", "New file", "n", ":ene | startinsert" },
    { "", "Find files", "f", ":Telescope find_files"},
    { "", "Live Grep", "g", ":Telescope live_grep" },
		{ "", "Git log", "s", ":Telescope git_status" },
    { "", "Recently used files", "r", ":Telescope oldfiles" },
    { "", "Quit Neovim", "q", ":qa" }


}

local function transform(entries)
	local transformed = {}
	for _, entry in ipairs(entries) do
		table.insert(transformed, {
			icon = entry[1] .. "  ",
			icon_hl = "DashboardCenterText",
			desc = entry[2],
			desc_hl = "DashboardHeader",
			key = entry[3],
			key_hl = "DashboardCenterIcon",
			action = entry[4]
		})
	end
  return transformed
end

dashboard.setup({
	theme = "doom",
	config = {
		header = {
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
		},
		center = transform(menu)
	}
})



