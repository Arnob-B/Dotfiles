local ls = require('luasnip')

local M = {}
vim.keymap.set({"i"}, "<C-J>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-H>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

function M.reload_package(package_name)
	for module_name, _ in pairs(package.loaded) do
		if string.find(module_name, '^' .. package_name) then
			package.loaded[module_name] = nil
			require(module_name)
		end
	end
end
function M.refresh_snippets()
	ls.cleanup()
	M.reload_package('config.snips')
end
local set = vim.keymap.set
local normal = { 'n' }
set(normal, ',r', M.refresh_snippets)
