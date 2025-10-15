return {
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig]
		config = function()
			require('render-markdown').setup({
				checkbox = {
					enabled = true,
					render_modes = false,
					bullet = false,
					right_pad = 1,
					custom = {
						todo = { raw = '[>]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
						notdone = { raw = '[~]', rendered = '󰰱 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
						imp = { raw = '[!]', rendered = '📌 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
						cancelled = { raw = '[-]', rendered = '🚫 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
					},
				},
				heading = {
					enabled = true,
					sign = false,
				},
			})
		end,
		opts = {},
	}
}
