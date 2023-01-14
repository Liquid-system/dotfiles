return {
  keys = function(client, buffer)
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })

    local bufopts = { noremap = true, silent = true, buffer = buffer }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>f", function(bufnr)
      vim.lsp.buf.format {
        async = true,
        bufnr = bufnr,
        filter = function(client)
          return client.name == "null-ls"
        end,
      }
    end, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  end,
}
