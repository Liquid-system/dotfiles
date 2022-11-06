local config = {}

function config.bufferline()
    require("bufferline").setup({
        options = {
            diagnostics = "nvim_lsp",
        },
    })
end

function config.dashboard()
    local db = require("dashboard")
    --footer
    local function footer()
        local v = vim.version()
        local datetime = os.date("     %Y-%m-%d   %H:%M:%S")
        local platform = vim.fn.has("win32") == 1 and "" or ""
        return string.format("%s v%d.%d.%d %s", datetime, v.major, v.minor, v.patch, platform)
    end

    db.custom_header = {
        "",
        "",
        "",
        " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
        " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
        " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
        " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
        " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        "",
        "",
        "",
        footer(),
        "",
    }
    --db.preview_command = "ueberzug"
    --db.preview_file_path = "/home/liquid_system/.dotfile/nvim/static/neovim.cat"
    db.preview_file_height = 11
    db.preview_file_width = 70
    db.preview_file_height = 11
    db.preview_file_width = 70
    db.custom_center = {
        --[[ {
    icon = "  ",
    desc = "New file                                    ",
    action = "e",
  }, ]]
        {
            icon = "  ",
            desc = "Quit NVIM                 ",
            action = "qa",
        },
        {
            icon = "  ",
            desc = "Recently opened files  ",
            action = "Telescope oldfiles",
            shortcut = "   ",
        },
        {
            icon = "  ",
            desc = "Find File              ",
            action = "Telescope find_files find_command=rg,--hidden,--files",
            shortcut = "   ",
        },
        {
            icon = "  ",
            desc = "Update Plugins          ",
            shortcut = "  ",
            action = "PackerUpdate",
        },
    }
end

function config.lualine()
    require("lualine").setup({
        options = {
            theme = "dracula",
            component_separators = "｜",
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = {
                { "mode", separator = { left = "" }, right_padding = 2 },
            },
            lualine_x = { "encoding", "filetype", "fileformat" },
            lualine_z = {
                { "location", separator = { right = "" }, left_padding = 2 },
            },
        },
    })
end

function config.trouble()
    require("trouble").setup({})
end

return config
