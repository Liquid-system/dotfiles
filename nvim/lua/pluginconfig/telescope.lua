require("telescope").setup {
defaults = {
  -- ....
},
pickers = {
  find_files = {
	mappings = {
	  n = {
		["cd"] = function(prompt_bufnr)
		  local selection = require("telescope.actions.state").get_selected_entry()
		  local dir = vim.fn.fnamemodify(selection.path, ":p:h")
		  require("telescope.actions").close(prompt_bufnr)
		  -- Depending on what you want put `cd`, `lcd`, `tcd`
		  vim.cmd(string.format("silent lcd %s", dir))
		end
	  }
	}
  },
}
}
