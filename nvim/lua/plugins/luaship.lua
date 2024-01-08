return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      require("luasnip").jump(1)
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-h>", function()
      require("luasnip").jump(-1)
    end, { silent = true })
  end,
}
