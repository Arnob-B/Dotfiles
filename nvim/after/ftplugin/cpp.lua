function Cpp_exec()
	local Popup = require("nui.popup")
	local event = require("nui.utils.autocmd").event

	local popup = Popup({
		enter = true,
		focusable = true,
		border = {
			style = "rounded",
		},
		position = "50%",
		size = {
			width = "80%",
			height = "60%",
		},
	})

	local filename = vim.api.nvim_buf_get_name(0);
	-- mount/open the component
	popup:mount()

	--vim.fn.termopen(string.format("g++ \"%s\" -Dfastioexlude && a.exe",filename))
	vim.fn.termopen(string.format("g++ \"%s\" -Dfastioexlude && ./a.out", filename))

	-- unmount component when cursor leaves buffer
	popup:map('n', 'q', function()
		popup:unmount()
	end)
	popup:on(event.BufLeave, function()
		popup:unmount()
	end)
end

vim.api.nvim_set_var("Cpp_exec", Cpp_exec)

vim.api.nvim_buf_set_keymap(0, 'n', '<leader><leader>x', ':lua Cpp_exec() <CR>', { noremap = true, silent = true })



-- leetcode specific bindings
function Leetcodeyank()
	vim.cmd('normal! ma`sV`e"+y`a')
end

vim.api.nvim_set_var("Leetcodeyank", Leetcodeyank);
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ly', ':lua Leetcodeyank()<CR>', { noremap = true, silent = true })
