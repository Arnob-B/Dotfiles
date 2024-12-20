-- file explorer command
vim.api.nvim_set_keymap('n', '<Leader>ee', ':Ex<CR>', { noremap = true, silent = true })

--nvim-windows-spliting keywords
  vim.api.nvim_set_keymap('n', '<Leader>l','<C-w>l', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>h','<C-w>h', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>j','<C-w>j', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>k','<C-w>k', { noremap = true })

  --tabs
  vim.api.nvim_set_keymap('n', '<S-l>',':tabnext<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<S-h>',':tabprevious<CR>', { noremap = true })

 -- Define a keymap to split open a new terminal at the bottom
vim.api.nvim_set_keymap('n', '<C-S-j>', ':below split<CR>:terminal<CR>', { noremap = true, silent = true })

-- telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope diag' })
vim.keymap.set('n', '<leader>fen', function() builtin.find_files({cwd = vim.fn.stdpath("config")})end, { desc = 'Telescope config'})

vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep'})
vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find,{desc = 'Telescope live grep'})
vim.keymap.set('n', '<leader>b', builtin.builtin, { desc = 'Telescope builtin' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- copy past from clipboard
vim.keymap.set('v','<leader>y',"\"+y",{noremap=true});
vim.keymap.set('n','<leader>Y',"\"+Y",{noremap=true});

vim.keymap.set('n','<leader>p',"\"+p",{noremap=true});
vim.keymap.set('n','<leader>P',"\"+P",{noremap=true});
vim.keymap.set('v','<leader>p',"\"+p",{noremap=true});
vim.keymap.set('v','<leader>P',"\"+P",{noremap=true});

-- lsp configs

vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)
