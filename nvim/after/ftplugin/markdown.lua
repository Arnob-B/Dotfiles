vim.api.nvim_buf_set_keymap(0, 'n', '<leader>4', ':RenderMarkdown toggle<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>y", function()
	local start = vim.fn.search("^```", "bnW") -- Search back to starting ```
	local finish = vim.fn.search("^```", "nW") -- Search forward to ending ```

	if start > 0 and finish > start + 1 then
		-- Yank only the lines *between* the backticks, to system clipboard
		vim.cmd(string.format("%d,%dyank +", start + 1, finish - 1))

		-- Neovim UI message
		vim.notify("Code block copied to clipboard", vim.log.levels.INFO)
	else
		vim.notify("⚠️ No full markdown code block found!", vim.log.levels.WARN)
	end
end, { desc = "Copy markdown code to clipboard", buffer = true })
