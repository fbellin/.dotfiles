local globals = {

	gitgutter_sign_added 		= "►",
	gitgutter_sign_modified = "►",
	gitgutter_sign_removed	= "►"

}

for k, v in pairs(globals) do 
	vim.g[k] = v
end
