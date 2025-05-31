-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Enable relative line numbering
vim.opt.relativenumber = true;
vim.opt.number = true;

-- Set tab width to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.bo.softtabstop = 2

vim.opt.list = true;
vim.opt.listchars = {
	eol = '↲',
	tab = '» ',
	space = '·',
	extends = '→',
	precedes = '←'
}
vim.cmd [[highlight ExtraSpace guibg=#000000 guifg=#1a1a1a]]
vim.fn.matchadd('ExtraSpace', [[\s]])

vim.opt.fillchars = {
	eob = " ",
	vert = "│",
	fold = "·",
}
vim.o.winbar = "%=%#Title#缓冲[ %t%{&modified ? ' ☯' : ''} ]"
vim.o.laststatus = 3
vim.o.statusline = "[%f] %r %h %w %=%y [%l:%c] [%p%%]"
