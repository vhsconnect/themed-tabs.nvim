local M = {}

M.config = {
	colorschemes = {
		"desert",
		"evening",
		"industry",
		"murphy",
		"blue",
		"pablo",
		"ron",
		"shine",
		"torte",
	},
	fallback_colorscheme = "default",
}

function M.setup(user_config)
	M.config = vim.tbl_deep_extend("force", M.config, user_config)
end

return M
