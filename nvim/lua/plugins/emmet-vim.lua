return {
  "mattn/emmet-vim",
  ft = "html",
  init = function()
    vim.g.user_emmet_settings = {
      variables = {
        lang = "ja",
      },
    }
    vim.g.user_emmet_leader_key = "<C-e>"
  end,
}
