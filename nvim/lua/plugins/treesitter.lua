return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      highlight = { enable = true },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      auto_install = false,
      ensure_installed = "all",
    }
  end,
}
