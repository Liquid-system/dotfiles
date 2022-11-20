local util = {}
function util.gen_func(path, modules)
  local files = vim.fn.readdir(path)
  for key, filename in pairs(files) do
    modules[filename] = function ()
      require(path .. filename)
    end
  end
  return modules
end

return util