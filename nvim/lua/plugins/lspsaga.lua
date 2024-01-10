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
  keys = {
    { "<leader>ca", "<cmd>Lspsaga code_action<CR>", { mode = { "n", "v" }, silent = true } },
    { "rn", "<cmd>Lspsaga rename<CR>", { silent = true } },
    { "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true } },
    { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true } },
    { "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true } },
    { "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true } },
    { "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true } },
    -- Only jump to error
    {
      "[E",
      function()
        require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end,
      { silent = true },
    },
    {
      "]E",
      function()
        require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
      end,
      { silent = true },
    },
    -- Callhierarchy
    { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", { silent = true } },
    { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", { silent = true } },
    -- Float terminal
    { "<leader>i", "<cmd>Lspsaga term_toggle<CR>", { mode = { "n", "t" }, silent = true } },
  },
}
