return {
  "numToStr/Comment.nvim",
  event = "UIEnter",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  opts = {
    enable_autocmd = false,
    toggler = {
      line = "<Leader>/",
    },
    extra = {
      eol = "<Leader>a",
    },
    pre_hook = function()
      require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
    end,
  },
}
