local function tree_keys(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  -- custom mappings
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    { "<Leader>n", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "NvimTreeToggle" } },
  },
  opts = {
    on_attach = tree_keys,
  },
}
