local M = {}
--[[
function M.gen_func(path, modules)
  local files = vim.fn.readdir(path)
  for key, filename in pairs(files) do
    modules[key] = function()
      require(path .. filename)
    end
  end
  return modules
end
return M
]]
M.nightfox = function()
  require "modules.colorScheme.nightfox"
end
return M
