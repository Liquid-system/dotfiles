local parser_install_dir = vim.fn.stdpath "data" .. "/treesitter"
vim.opt.runtimepath:append(parser_install_dir)
require("nvim-treesitter.configs").setup {
  parser_install_dir = parser_install_dir,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  ensure_installed = "all",
}
