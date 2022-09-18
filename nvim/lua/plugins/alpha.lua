local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	"                                                     ",
	"                                                     ",
	"                                                     ",
	"                                                     ",
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  > Find file", "<cmd>lua require('telescope.builtin').find_files()<cr>"),
	dashboard.button("t", "  Find Text", ":Telescope live_grep <CR>"),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

--footer
local function footer()
	local v = vim.version()
	local datetime = os.date " %Y-%m-%d   %H:%M:%S"
	local platform = vim.fn.has "win32" == 1 and "" or ""
	return string.format("%s v%d.%d.%d %s", datetime, v.major, v.minor, v.patch, platform)
end

dashboard.section.footer.val = footer()
-- Send config to alpha
alpha.setup(dashboard.opts)

vim.cmd([[
	autocmd FileType alpha setlocal nofoldenable
]])
