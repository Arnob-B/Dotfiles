-- file explorer command
-- nvim tree
vim.keymap.set( 'n', '<leader>et', '<cmd>NvimTreeFindFileToggle<cr>', { noremap = true, silent = true })

--nvim-windows-spliting keywords
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })

--tabs
vim.api.nvim_set_keymap('n', '<S-l>', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-h>', ':tabprevious<CR>', { noremap = true })
for i = 1, 9 do
	vim.api.nvim_set_keymap('n', '<leader>'.. i , ':tabn '..i..'<CR>', { noremap = true })
end

-- Define a keymap to split open a new terminal at the bottom
vim.api.nvim_set_keymap('n', '<C-S-j>', ':below split<CR>:terminal<CR>', { noremap = true, silent = true })

-- telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope diag' })
vim.keymap.set('n', '<leader>fen', function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end,
	{ desc = 'Telescope config' })

vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.builtin, { desc = 'Telescope builtin' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>h', builtin.command_history, { desc = 'Telescope command history' })

-- CompetiTest
-- vim.keymap.set( 'n', '<leader>c1', ':CompetiTest run <CR>', { noremap = true, silent = true })
-- vim.keymap.set( 'n', '<leader>c2', ':CompetiTest run_no_compile <CR>', { noremap = true, silent = true })
-- vim.keymap.set( 'n', '<leader>c3', ':CompetiTest show_ui <CR>', { noremap = true, silent = true })
-- vim.keymap.set( 'n', '<leader>at', ':CompetiTest add_testcase <CR>', { noremap = true, silent = true })
-- vim.keymap.set( 'n', '<leader>ct', ':CompetiTest edit_testcase <CR>', { noremap = true, silent = true })
-- vim.keymap.set( 'n', '<leader>dt', ':CompetiTest delete_testcase <CR>', { noremap = true, silent = true })
-- vim.keymap.set( 'n', '<leader>ap', ':CompetiTest receive problem <CR>', { noremap = true, silent = true })
-- vim.keymap.set( 'n', '<leader>ac', ':CompetiTest receive contest <CR>', { noremap = true, silent = true })

-- copy past from clipboard
vim.keymap.set('v', '<leader>y', "\"+y", { noremap = true }); -- depedent on after/ftplugin/cpp.lua
vim.keymap.set('n', '<leader>Y', "\"+Y", { noremap = true });

vim.keymap.set('n', '<leader>p', "\"+p", { noremap = true });
vim.keymap.set('n', '<leader>P', "\"+P", { noremap = true });
vim.keymap.set('v', '<leader>p', "\"+p", { noremap = true });
vim.keymap.set('v', '<leader>P', "\"+P", { noremap = true });

-- lsp configs

vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)
-- undo tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)


-- half page up and down while being in the middle
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')


-- hot relaod
function ReloadConfig()
    for name,_ in pairs(package.loaded) do
        if name:match('^plugins') or name:match('^config') then
            package.loaded[name] = nil
        end
    end
    dofile(vim.fn.stdpath('config') .. '/init.lua')
    print("Config reloaded!")
end

-- Map to key
vim.api.nvim_set_keymap('n', '<leader>R', ':lua ReloadConfig()<CR>', { noremap = true, silent = true })



-- commmands
vim.keymap.set( 'n', '<leader>:', ':Telescope commands<CR>', { noremap = true, silent = true })
