local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
	vim.notify("Error while loading dashboard configuration")
end

dashboard.setup({
	theme = "doom",
	config = {
		header = {
'                                       ',
'              ██ █████ ██              ',
'              ██ █████ ██              ',
'             ▐██ █████ ██▌             ',
'             ▐██ █████ ██▌             ',
'             ███ █████ ███             ',
'             ███ █████ ███             ',
'            ▐███ █████ ███▌            ',
'           ▐████ █████ ████▌           ',
'          ▐████▌ █████ ▐████▌          ',
'         ▐█████  █████  █████▌         ',
'        ██████▌  █████  ▐██████        ',
'      ███████▌   █████   ▐███████      ',
'   ████████▌     █████     ▐████████   ',
'█████████▌       █████       ▐█████████',
'██████▌          █████          ▐██████',
'                                       ',
'                                       ',
		},
	}
})

