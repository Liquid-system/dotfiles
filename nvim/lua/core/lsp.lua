vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = {
    { "┏", "FloatBorder" }, -- upper left
    { "━", "FloatBorder" }, -- upper
    { "┓", "FloatBorder" }, -- upper right
    { "┃", "FloatBorder" }, -- right
    { "┛", "FloatBorder" }, -- lower right
    { "━", "FloatBorder" }, -- lower
    { "┗", "FloatBorder" }, -- lower left
    { "┃", "FloatBorder" }, -- left
  }
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
  focusable = false,
})

vim.diagnostic.config({
  virtual_line = true,
  update_in_insert = true,
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
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
