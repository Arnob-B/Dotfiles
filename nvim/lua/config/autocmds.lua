-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Trigger autoread when files change on disk



-- vim auto reading
-- Define file exension and filetype variables
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})


vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank();
	end
})
-- Global blacklist table
Format_blacklist = Format_blacklist or {}

-- Function to check if filetype is blacklisted
local function is_blacklisted(ft)
	return vim.tbl_contains(Format_blacklist, ft)
end

-- Toggle current buffer's filetype in blacklist
local function toggle_formatting_blacklist()
	local ft = vim.bo.filetype
	local buf = vim.api.nvim_get_current_buf()

	if is_blacklisted(ft) then
		-- Remove from blacklist
		Format_blacklist = vim.tbl_filter(function(x)
			return x ~= ft
		end, Format_blacklist)
		vim.notify("Removed '" .. ft .. "' from format blacklist")
	else
		-- Add to blacklist
		table.insert(Format_blacklist, ft)
		vim.notify("Added '" .. ft .. "' to format blacklist")
	end

	-- Force BufEnter callback to re-trigger logic
	vim.api.nvim_exec_autocmds("BufEnter", { buffer = buf })
end

-- Create a user command to toggle formatting for the current filetype
vim.api.nvim_create_user_command("ToggleFormatBlacklist", toggle_formatting_blacklist, {})
