return {
  "glepnir/dashboard-nvim",
  config = function()
    local db = require "dashboard"
    --footer
    local function footer()
      local v = vim.version()
      local datetime = os.date "     %Y-%m-%d   %H:%M:%S"
      local platform = vim.fn.has "win32" == 1 and "" or ""
      return string.format("%s v%d.%d.%d %s", datetime, v.major, v.minor, v.patch, platform)
    end

    db.custom_header = {
      "",
      "",
      "",
      "",
      "  ██╗     ██╗ ██████╗ ██╗   ██╗██╗██████╗ ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗",
      "  ██║     ██║██╔═══██╗██║   ██║██║██╔══██╗██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║",
      "  ██║     ██║██║   ██║██║   ██║██║██║  ██║███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║",
      "  ██║     ██║██║▄▄ ██║██║   ██║██║██║  ██║╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║",
      "  ███████╗██║╚██████╔╝╚██████╔╝██║██████╔╝███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║",
      "  ╚══════╝╚═╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚═════╝ ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝",
      "",
      "",
      footer(),
      "",
    }
    db.preview_file_height = 11
    db.preview_file_width = 70
    db.preview_file_height = 11
    db.preview_file_width = 70
    db.custom_center = {
      --[[{
        icon = "  ",
        desc = "New file                                    ",
        action = "e",
      },]]
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
        action = "Lazy",
      },
    }
  end,
}
