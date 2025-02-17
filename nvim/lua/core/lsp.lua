vim.diagnostic.config({
  virtual_lines = false,
  virtual_text = {
    prefix = "󰐂",
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  signs = {
    text = { "", "", "", "" },
    numhl = {
      "DiagnosticSignError",
      "DiagnosticSignWarn",
      "DiagnosticSignInfo",
      "DiagnosticSignHint",
    },
    linehl = {
      "DiagnosticSignError",
      "DiagnosticSignWarn",
      "DiagnosticSignInfo",
      "DiagnosticSignHint",
    },
  },
  float = {
    focusable = false,
    border = "rounded",
    source = "always",
  },
})
