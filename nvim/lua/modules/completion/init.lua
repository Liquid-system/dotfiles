local M = {}

M.cmp = function()
    require("modules.completion.cmp")
end

M.lspconfig = function()
    require("modules.completion.lspconfig")
end

M.null_ls = function()
    require("modules.completion.null-ls")
end

M.lspsaga = function()
    require("modules.completion.lspsaga")
end

M.mason = function()
    require("modules.completion.mason")
end

M.luaship = function()
    require("modules.completion.luasnip")
end

return M
