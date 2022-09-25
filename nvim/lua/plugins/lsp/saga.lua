local saga = require 'lspsaga'
-- use default config
saga.init_lsp_saga({
	code_action_lightbulb = {
		enable = false,
		enable_in_insert = true,
		cache_code_action = true,
		sign = true,
		update_time = 150,
		sign_priority = 20,
		virtual_text = true,
	},
})
