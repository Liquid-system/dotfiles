local M = {}

M.bufferline = function()
  require("modules.ui.bufferline")
end

M.dashboard = function()
  require("modules.ui.dashboard")
end

M.lualine = function()
  require("modules.ui.lualine")
end

M.trouble = function()
  require("modules.ui.trouble")
end

M.finget = function()
  require("modules.ui.finget")
end

return M
