return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").init_lsp_saga {
      code_action_lightbulb = { enable = false },
      symbol_in_winbar = {
        in_custom = true,
      },
    }
  end,
  init = function()
    -- Lsp finder find the symbol definition implement reference
    vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
    vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
    vim.keymap.set("n", "rn", "<cmd>Lspsaga rename<CR>", { silent = true })
    --vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
    vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
    vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
    vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
    vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
    -- Only jump to error
    vim.keymap.set("n", "[E", function()
      require("lspsaga.diagnostic").goto_prev { severity = vim.diagnostic.severity.ERROR }
    end, { silent = true })
    vim.keymap.set("n", "]E", function()
      require("lspsaga.diagnostic").goto_next { severity = vim.diagnostic.severity.ERROR }
    end, { silent = true })
    vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
    -- Float terminal
    vim.keymap.set("n", "<leader>i", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
    -- if you want pass somc cli command into terminal you can do like this
    -- close floaterm
    vim.keymap.set("t", "<leader>i", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
  end,
}
