if vim.fn.has("persistent_undo") then
  local target_path = vim.fn.expand("~/.undo/nvim")
  if not vim.fn.isdirectory(target_path) then
    vim.fn.mkdir(target_path, "p", 700)
  end
  vim.opt.undodir = target_path
  vim.opt.undofile = true
end

require("core.mappings")
require("core.options")
require("core.autocmd")
require("core.config")
require("modules")
