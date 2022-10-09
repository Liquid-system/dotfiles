pcall(require, "impatient")
require("core")
require("plugins")
vim.api.nvim_exec("runtime! configs/*.vim", false)
