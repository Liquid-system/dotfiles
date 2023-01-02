local M = {
  "williamboman/mason.nvim",
}
function M.config()
  require("mason").setup()
end

return M
