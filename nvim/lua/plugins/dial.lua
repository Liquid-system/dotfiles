return {
  "monaqa/dial.nvim",
  keys = {
    { "+", mode = { "n", "v" }, desc = "dial Up" },
    { "-", mode = { "n", "v" }, desc = "dial Down" },
    { "g+", mode = "v", desc = "dial Up" },
    { "g-", mode = "v", desc = "dial Down" },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.constant.alias.bool,
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
        augend.hexcolor.new({
          case = "lower",
        }),
        augend.constant.new({
          elements = { "and", "or" },
          word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
          cyclic = true, -- "or" is incremented into "and".
        }),
        augend.constant.new({
          elements = { "&&", "||" },
          word = false,
          cyclic = true,
        }),
      },
      visual = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
      },
    })
    require("dial.config").augends:on_filetype({
      typescript = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.new({
          elements = { "let", "const" },
          word = true,
          cyclic = true,
        }),
      },
    })
    vim.keymap.set("n", "+", function()
      require("dial.map").manipulate("increment", "normal")
    end)
    vim.keymap.set("n", "-", function()
      require("dial.map").manipulate("decrement", "normal")
    end)
    vim.keymap.set("n", "g+", function()
      require("dial.map").manipulate("increment", "gnormal")
    end)
    vim.keymap.set("n", "g-", function()
      require("dial.map").manipulate("decrement", "gnormal")
    end)
    vim.keymap.set("v", "+", function()
      require("dial.map").manipulate("increment", "visual")
    end)
    vim.keymap.set("v", "-", function()
      require("dial.map").manipulate("decrement", "visual")
    end)
    vim.keymap.set("v", "g+", function()
      require("dial.map").manipulate("increment", "gvisual")
    end)
    vim.keymap.set("v", "g-", function()
      require("dial.map").manipulate("decrement", "gvisual")
    end)
  end,
}
