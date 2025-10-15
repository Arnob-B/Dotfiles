local function buf_formater ()
	vim.lsp.buf.format()
end
vim.api.nvim_create_user_command("W", buf_formater,{} )
