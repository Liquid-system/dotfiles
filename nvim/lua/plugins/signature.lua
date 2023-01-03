local M = {
  "ray-x/lsp_signature.nvim",
  config = function()
    require "lsp_signature".setup {
      bind = true,
      hint_enable = false,
      handler_opts = {
        border = "rounded"
      },
      toggle_key = "<C-s>",
      select_signature_key = "<C-l>"
    }
  end
}

return M
