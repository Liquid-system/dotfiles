return {
  "monaqa/dial.nvim",
  keys = {
    {
      "<C-a>",
      function()
        require("dial.map").manipulate("increment", "normal")
      end,
      { noremap = true },
    },
    {
      "<C-x>",
      function()
        require("dial.map").manipulate("decrement", "normal")
      end,
      { noremap = true },
    },
    {
      "g<C-a>",
      function()
        require("dial.map").manipulate("increment", "gnormal")
      end,
    },
    {
      "g<C-x>",
      function()
        require("dial.map").manipulate("decrement", "gnormal")
      end,
    },
    {
      "<C-a>",
      function()
        require("dial.map").manipulate("increment", "visual")
      end,
      "v",
      { noremap = true },
    },
    {
      "<C-x>",
      function()
        require("dial.map").manipulate("decrement", "visual")
      end,
      "v",
      { noremap = true },
    },
    {
      "g<C-a>",
      function()
        require("dial.map").manipulate("increment", "gvisual")
      end,
      "v",
      { noremap = true },
    },
    {
      "g<C-x>",
      function()
        require("dial.map").manipulate("decrement", "gvisual")
      end,
      "v",
      { noremap = true },
    },
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
  end,
}
