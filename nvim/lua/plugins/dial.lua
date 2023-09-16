return {
  "monaqa/dial.nvim",
  keys = {
    { "<C-a>", mode = { "n", "v" } },
    { "<C-x>", mode = { "n", "v" } },
    { "g<C-a>", mode = "v" },
    { "g<C-x>", mode = "v" },
  },
  config = function()
    local augend = require "dial.augend"
    require("dial.config").augends:register_group {
      default = {
        augend.constant.alias.bool,
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
        augend.hexcolor.new {
          case = "lower",
        },
        augend.constant.new {
          elements = { "and", "or" },
          word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
          cyclic = true, -- "or" is incremented into "and".
        },
        augend.constant.new {
          elements = { "&&", "||" },
          word = false,
          cyclic = true,
        },
      },
      visual = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
      },
    }
    require("dial.config").augends:on_filetype {
      typescript = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.new {
          elements = { "let", "const" },
          word = true,
          cyclic = true,
        },
      },
    }
    vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
    vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
    vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
    vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
    vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
    vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
  end,
}
