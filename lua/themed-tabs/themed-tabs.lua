local config = require("themed-tabs.config")

function Plugin()
	local State = {}

	local function id()
		return vim.api.nvim_get_current_tabpage()
	end

	local function next_scheme()
		local colors = config.config.colorschemes
		for _, color in ipairs(colors) do
			local matched = false
			for _, value in pairs(State) do
				if value.colorscheme == color then
					matched = true
					break
				end
			end
			if not matched then
				return color
			end
		end
		return config.config.fallback_colorscheme
	end

	local function on_enter()
		local tab_id = id()
		if next(State) == nil then
			State[tab_id] = { colorscheme = vim.g.colors_name }
			return
		end

		if State[tab_id] then
			vim.cmd("colorscheme " .. State[tab_id].colorscheme)
			return
		end

		local new_colorscheme = next_scheme()
		vim.cmd("colorscheme " .. new_colorscheme)
		State[tab_id] = { colorscheme = new_colorscheme }
	end

	local function on_leave()
		local tab_id = id()
		State[tab_id] = { colorscheme = vim.g.colors_name }
	end

	local function on_tab_closed()
		local current_tabs = vim.api.nvim_list_tabpages()

		local live_tabs = {}
		for _, tab in ipairs(current_tabs) do
			live_tabs[tab] = true
		end

		for tab_id, _ in pairs(State) do
			if not live_tabs[tab_id] then
				State[tab_id] = nil
			end
		end
	end

	return {
		on_enter = on_enter,
		on_leave = on_leave,
		on_tab_closed = on_tab_closed,
	}
end

local plugin = Plugin()
vim.api.nvim_create_autocmd("TabEnter", { callback = plugin.on_enter })
vim.api.nvim_create_autocmd("TabLeave", { callback = plugin.on_leave })
vim.api.nvim_create_autocmd("TabClosed", { callback = plugin.on_tab_closed })

local M = {}
M.setup = config.setup
return M
