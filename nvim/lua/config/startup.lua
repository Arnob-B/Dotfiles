-- Set the directory you want to open
--local directory = "D://code/cp/"
-- Change directory command
--local cd_command = "cd " .. directory
-- Execute the commands
--vim.cmd(cd_command)




-- Enable relative line numbering
vim.cmd('set relativenumber')
vim.cmd('set number')

-- Set tab width to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2




-- remapping the leader key
vim.g.mapleader = " "


--python provider support
--vim.g.python3_host_prog = 'C:\\Users\\A\\AppData\\Local\\Microsoft\\WindowsApps\\python.exe '
