return {
  "numToStr/Comment.nvim",
  event = "UIEnter",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  keys = {
    {
      "<Leader>/",
      function()
        return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)" or "<Plug>(comment_toggle_linewise_count)"
      end,
      { expr = true },
    },
    { "<Leader>/", "<Plug>(comment_toggle_blockwise_visual)", "x" },
  },
  opts = {
    enable_autocmd = false,
    extra = {
      eol = "<leader>a",
    },
    pre_hook = function()
      require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
    end,
  },
}
