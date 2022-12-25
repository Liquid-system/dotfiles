local M = {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons"
}
function M.config()
  require("bufferline").setup({
    options = {
      diagnostics = "nvim_lsp",
    },
  })
end

return M