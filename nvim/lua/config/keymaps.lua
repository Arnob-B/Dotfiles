-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here






-- Define a function to set up key mappings for the explorer
local function setup_explorer_keymaps()
    -- Use the leader key followed by "e" to open the explorer
    vim.api.nvim_set_keymap('n', '<Leader>e', ':Ex<CR>', { noremap = true, silent = true })
    
    -- Use the leader key followed by "r" to refresh the explorer
    vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
    
    -- Use the leader key followed by "n" to find the current file in the explorer
    vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
end
vim.api.nvim_set_keymap('n', '<Leader>1', ':!g++ % -o a.exe && a.exe<CR>', { noremap = true, silent = true })

-- Call the setup function
setup_explorer_keymaps()
