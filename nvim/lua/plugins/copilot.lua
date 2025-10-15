return {
	{
		"github/copilot.vim",
		config = function()
			-- Disable default Tab mapping
			vim.g.copilot_no_tab_map = true

			-- Use Shift+Tab to accept
			vim.api.nvim_set_keymap("i", "<C-S-space>", 'copilot#Accept("<CR>")', {
				expr = true,
				silent = true,
				noremap = true
			})

			-- Ctrl+Shift+E to dismiss (not built-in; we just do nothing here)
			vim.api.nvim_set_keymap("i", "<C-S-E>", "<Cmd>lua print('Copilot dismissed')<CR>", {
				noremap = true,
				silent = true
			})
		end,
	},
}
