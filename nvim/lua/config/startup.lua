-- Set the directory you want to open
--local directory = "D://code/cp/"
-- Change directory command
--local cd_command = "cd " .. directory
-- Execute the commands
--vim.cmd(cd_command)






-- netrw hidding files
--vim.g.netrw_list_hide = '^\\.$,^\\.\\.$'
vim.g.netrw_hide = 1
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
--vim.g.netrw_browse_split = 4
--vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

vim.cmd("colorscheme base16-black-metal-venom");
makeTransparent()
makeDiagTransparent()

-- cursor change cuolor as it changes mode
-- if vim.fn.has("nvim") == 1 then
--   -- Define a group for cursor color changes
--   vim.api.nvim_create_augroup("CursorColor", {})
--
--   -- Set cursor color to red in Insert mode
--   vim.api.nvim_create_autocmd("ModeChanged", {
--     group = "CursorColor",
--     pattern = "*:[iI]",
--     callback = function()
--       vim.cmd("highlight CursorColor guibg=red")
--     end,
--   })
--
--   -- Set cursor color to green in Normal mode
--   vim.api.nvim_create_autocmd("ModeChanged", {
--     group = "CursorColor",
--     pattern = "[iI]:*",
--     callback = function()
--       vim.cmd("highlight CursorColor guibg=green")
--     end,
--   })
--
--   -- Set cursor to block and use the custom highlight
--   vim.opt.guicursor = "n-v-c:block-CursorColor,i:block-CursorColor"
--
--   -- Apply the green color at startup
--   vim.api.nvim_create_autocmd("VimEnter", {
--     group = "CursorColor",
--     callback = function()
--       vim.cmd("highlight CursorColor guibg=green")
--     end,
--   })
-- end
