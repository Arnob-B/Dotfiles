function makeDiagTransparent()
	--vim.api.nvim_set_hl(0,"DiagnosticVirtualTextError",{bg='none'})
	vim.cmd("highlight DiagnosticVirtualTextError guibg=none");
	vim.cmd("highlight DiagnosticVirtualTextWarning guibg=none");
	vim.cmd("highlight DiagnosticVirtualTextWarn guibg=none");
end

function makeTransparent()
	vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
	vim.api.nvim_set_hl(0, "NormalNc", { bg = 'none' })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = 'none' })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = 'none' }) -- for nvim cmp
	--vim.api.nvim_set_hl(0,"DiagnosticVirtualTextError",{guibg='none'})
	--vim.api.nvim_set_hl(0,"DiagnosticVirtualTextWarning",{guibg='none'})
	-- for sidebar
	vim.api.nvim_set_hl(0, "LineNr", { bg = 'none' , fg='#333333'})
	-- for cursor line nr to work we need to set cursorline 
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = 'none' , fg='#888888'})
	vim.opt.cursorline=true
	vim.api.nvim_set_hl(0, "CursorLine", { bg = 'none', fg='none' }) -- this sets cursorline invisible
	vim.api.nvim_set_hl(0, "SignColumn", { bg = 'none' })
end







return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
		end
	},
	-- the line that comes in the indents
	{
		"lukas-reineke/indent-blankline.nvim"
		--config = function()
		--end
	},
	{
		"thedenisnikulin/vim-cyberpunk",
		name = "cyberpunk",
	},
	{
		"akai54/2077.nvim",
		name = "akaiCyberpunk",
	}, {
	"RRethy/base16-nvim",
},
	-- {
	--   "sphamba/smear-cursor.nvim",
	--   opts = {
	--     -- Smear cursor when switching buffers or windows.
	--     smear_between_buffers = true,
	--
	--     -- Smear cursor when moving within line or to neighbor lines.
	--     -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
	--     smear_between_neighbor_lines = true,
	--
	--     -- Draw the smear in buffer space instead of screen space when scrolling
	--     scroll_buffer_space = true,
	--
	--     -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
	--     -- Smears will blend better on all backgrounds.
	--     legacy_computing_symbols_support = false,
	--
	--     -- Smear cursor in insert mode.
	--     -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
	--     smear_insert_mode = true,
	--   },
	--   disable = true -- does not workd well with kitty's build in cusror-Trailing
	-- }
}
