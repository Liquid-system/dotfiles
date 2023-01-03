local M = {
  "EdenEast/nightfox.nvim",
}
function M.config()
  require("nightfox").setup {}
  vim.cmd "colorscheme nightfox"
end

return M
