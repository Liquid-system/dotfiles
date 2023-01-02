local M = {
	"folke/trouble.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "LspAttach",
}
function M.config()
	require("trouble").setup({})
end

return M
