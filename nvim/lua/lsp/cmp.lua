-- Completion Setup--
local lspkind = require('lspkind')
local cmp = require 'cmp'
cmp.setup {
	snippet = { expand = function() end },
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol',
			maxwidth = 50,
			before = function(entry, vim_item)
				return vim_item
			end
		})
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			select = true,
		},
		['<C-j>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		['<C-k>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lua' },
	}
}
