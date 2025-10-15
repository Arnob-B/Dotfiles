local M = {}

M.Create_Split = function ()
	local tc_name = vim.fn.fnamemodify("tc.txt", ":p")
	local out_name = vim.fn.fnamemodify("output.txt", ":p")

	local tc_win, out_win

	-- check existing windows for tc and output
	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		local buf = vim.api.nvim_win_get_buf(win)
		local name = vim.api.nvim_buf_get_name(buf)
		if name == tc_name then tc_win = win
		elseif name == out_name then out_win = win
		end
	end

	if tc_win and out_win then
		print("Test layout already exists")
		return
	end

	-- create right vertical split for test case
	vim.cmd("rightbelow vsplit")
	vim.cmd("vertical resize " .. math.floor(vim.o.columns * 0.3))
	vim.cmd("edit " .. vim.fn.fnameescape("tc.txt"))
	M.tc_buf = vim.api.nvim_get_current_buf()

	-- horizontal split for output
	vim.cmd("rightbelow split")
	vim.cmd("edit " .. vim.fn.fnameescape("output.txt"))
	M.output_buf = vim.api.nvim_get_current_buf()

	-- return to code window
	vim.cmd("wincmd h")
end

M.RunFile = function ()
	local cur_buf = vim.api.nvim_get_current_buf()
	local file_name = vim.api.nvim_buf_get_name(cur_buf)

	if not M.output_buf or not vim.api.nvim_buf_is_valid(M.output_buf) then
		print("Output buffer not found! Run Create_Split first.")
		return
	end

	--local command = { "python3", file_name }
	local command = "cat tc.txt | ".. "python3 " .. file_name

	-- Read the file and join lines with newline for stdin
	-- local stdin_content = table.concat(vim.fn.readfile("tc.txt"), "\n").."\n"
	-- print(stdin_content)

	vim.fn.jobstart(command, {
		--stdin = stdin_content,
		stdout_buffered = true,
		stderr_buffered = true,
		on_exit = function ()
			--vim.notify("file excution completed")
			local data = {"-- exectuion completed --", command}
			local line_count = vim.api.nvim_buf_line_count(M.output_buf)
			vim.api.nvim_buf_set_lines(M.output_buf, line_count, line_count, false, data)
		end,
		on_stdout = function(_, data, _)
			if data then
				-- remove trailing empty lines
				while #data > 0 and data[#data] == "" do
					table.remove(data)
				end
				vim.api.nvim_buf_set_lines(M.output_buf, 0, -1, false, data)
			end
		end,
		on_stderr = function(_, data, _)
			if data then
				while #data > 0 and data[#data] == "" do
					table.remove(data)
				end
				local current = vim.api.nvim_buf_get_lines(M.output_buf, 0, -1, false)
				for _, line in ipairs(data) do
					table.insert(current, line)
				end
				vim.api.nvim_buf_set_lines(M.output_buf, 0, -1, false, current)
			end
		end,
	})
end

M.setup = function()
	vim.api.nvim_create_user_command("TCsplit", M.Create_Split, {})
	vim.api.nvim_create_user_command("TCRun", M.RunFile, {})
end

return M
