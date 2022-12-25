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

function M.init()
  local keymap = vim.keymap.set
  -- Lsp finder find the symbol definition implement reference
  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
  keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
  keymap("n", "rn", "<cmd>Lspsaga rename<CR>", { silent = true })
  --keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
  keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
  keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
  keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
  keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
  -- Only jump to error
  keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.ERROR }
  end, { silent = true })
  keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.ERROR }
  end, { silent = true })
  keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

  -- Float terminal
  keymap("n", "<leader>i", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
  -- if you want pass somc cli command into terminal you can do like this
  -- close floaterm
  keymap("t", "<leader>i", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
end

return M
