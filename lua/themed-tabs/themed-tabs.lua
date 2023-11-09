config = require('themed-tabs.config')

function on_enter()
    local pagenr = vim.fn.tabpagenr()
    local schemes = config.config.colorschemes
    local length = table.getn(schemes)
    local index = math.fmod(pagenr - 1, length) + 1
    vim.cmd("colorscheme " .. schemes[index])
end

vim.api.nvim_create_autocmd("TabEnter", { callback = on_enter})

local M = {}
function M.sayHelloWorld()
    print('Hello!!') 
end
M.setup = config.setup

return M
    
