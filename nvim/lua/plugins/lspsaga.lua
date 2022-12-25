local M = {
  "glepnir/lspsaga.nvim",
  event = "LspAttach"
}
function M.config()
  local saga = require("lspsaga")
  saga.init_lsp_saga({
    code_action_lightbulb = { enable = false },
  })
end

return M
