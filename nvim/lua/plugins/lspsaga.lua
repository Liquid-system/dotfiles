return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    lightbulb = {
      enable = false,
    },
    symbol_in_winbar = {
      separator = "",
    },
  },
  init = function()
    -- Lsp finder find the symbol definition implement reference
    vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
    vim.keymap.set("n", "rn", "<cmd>Lspsaga rename<CR>", { silent = true })
    --vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
    vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
    vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
    vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
    vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
    -- Only jump to error
    vim.keymap.set("n", "[E", function()
      require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, { silent = true })
    vim.keymap.set("n", "]E", function()
      require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, { silent = true })
    -- Callhierarchy
    vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", { silent = true })
    -- Float terminal
    vim.keymap.set({ "n", "t" }, "<leader>i", "<cmd>Lspsaga term_toggle<CR>")
  end,
}
