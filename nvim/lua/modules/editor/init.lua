M = {}

function M.indent_blankline()
	require("modules.editor.indent_blankline")
end

function M.telescope()
	require("modules.editor.telescope")
end

function M.treesitter()
	require("modules.editor.treesitter")
end

function M.better_escape()
	require("modules.editor.better_escape")
end

function M.winresizer()
	require("modules.editor.winresizer")
end

function M.silicon()
	require("modules.editor.silicon")
end

function M.auto_save()
	require("modules.editor.auto-save")
end

function M.surround()
	require("modules.editor.surround")
end

function M.colorizer()
	require("modules.editor.colorizer")
end

return M
