-- Set the directory you want to open
local directory = "D://code/cp/"

-- Change directory command
local cd_command = "cd " .. directory

-- Execute the commands
vim.cmd(cd_command)
-- Enable relative line numbering
vim.api.nvim_command('set relativenumber')

-- Set tab width to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

