local M = {}
function M.setup(client, buffer)
  local keymap = vim.keymap.set
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })

  local bufopts = { noremap = true, silent = true, buffer = buffer }
  keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
  keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
  keymap("n", "gd", vim.lsp.buf.definition, bufopts)
  keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  keymap("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  keymap("n", "gr", vim.lsp.buf.references, bufopts)
  keymap("n", "<space>f", function(bufnr)
    vim.lsp.buf.format {
      async = true,
      bufnr = bufnr,
      filter = function(client)
        return client.name == "null-ls"
      end,
    }
  end, bufopts)
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  --keymap("n", "K", vim.lsp.buf.hover, bufopts)
end

return M
