local keymap = vim.keymap.set
require("silicon").setup {}
keymap("v", "<Leader>li", function()
  require("silicon").visualise_api {}
end)
