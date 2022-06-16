require("trouble").setup {
}
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>TroubleToggle<cr>",
{silent = true, noremap = true}
)
local signs = {
Error = " ",
warn = " ",
Hint = " ",
Info = " "
}

--icons
for type, icon in pairs(signs) do
local hl = "DiagnosticSign" .. type
vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
