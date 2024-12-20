-- lua keymaps
print("lua loaded");
vim.keymap.set('n',"<leader><leader>x", "<cmd>source %<CR>");
vim.keymap.set('n',"<leader>x", "<cmd>.lua<CR>");
vim.keymap.set('v',"<leader>x", ":.lua<CR>");

--[[
-- lua keymaps
vim.keymap.set('n',"<leader><leader>x", "<cmd>source %<CR>");
vim.keymap.set('n',"<leader>x", "<cmd>source %<CR>");
vim.keymap.set('n',"<leader><leader>x", "<cmd>source %<CR>");
]]--
