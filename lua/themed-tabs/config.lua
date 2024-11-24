local M = {}

M.config = {
	colorschemes = { "blue" },
}

function M.setup(user_config)
	M.config = vim.tbl_deep_extend("force", M.config, user_config)
end

return M
