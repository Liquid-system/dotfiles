local M = {}
function M.indent_blankline()
	require("modules.editor.indent_blankline")
end

function M.telescope()
	require("modules.editor.telescope")
end

function M.treesitter()
	require("modules.editor.treesitter")
end

return M
