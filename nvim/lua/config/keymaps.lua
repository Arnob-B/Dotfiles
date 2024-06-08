-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


-- { noremap = true, silent = true } are options for the mapping
--   - 'noremap' prevents recursive mappings
--   - 'silent' suppresses the command from being echoed to the command line


vim.g.mapleader = " "

--shortcut to reload vim file
vim.api.nvim_set_keymap('n','<leader>rr',':source $MYVIMRC<CR>',{ noremap = true, silent = true })

-- Define a function to set up key mappings for the explorer
local function setup_explorer_keymaps()
    -- Use the leader key followed by "e" to open the explorer
    vim.api.nvim_set_keymap('n', '<Leader>ee', ':Ex<CR>', { noremap = true, silent = true })
end

-- Call the setup function
setup_explorer_keymaps()




-- Define key mappings
local function compiler_and_run_cpp_windows()
function cppexec()
  local Popup = require("nui.popup")
  local event = require("nui.utils.autocmd").event

  local popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
    },
    position = "50%",
    size = {
      width = "80%",
      height = "60%",
    },
  })

  local filename = vim.api.nvim_buf_get_name(0);
  -- mount/open the component
  popup:mount()

  vim.fn.termopen(string.format("g++ \"%s\" -Dfastioexlude && a.exe",filename))

  -- unmount component when cursor leaves buffer
  popup:map('n','q',function()
    popup:unmount()
  end)
  popup:on(event.BufLeave, function()
    popup:unmount()
  end)
end
  vim.api.nvim_set_var("cppexec", cppexec)
  vim.api.nvim_set_keymap('n', '<leader>1', ':CompetiTest run <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>2', ':CompetiTest run_no_compile <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>3', ':CompetiTest show_ui <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>4', ':lua cppexec() <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>at', ':CompetiTest add_testcase <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>et', ':CompetiTest edit_testcase <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>dt', ':CompetiTest delete_testcase <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>ap', ':CompetiTest receive problem <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>ac', ':CompetiTest receive contest <CR>', { noremap = true, silent = true })
end
compiler_and_run_cpp_windows()



--nvim-windows-spliting keywords
  vim.api.nvim_set_keymap('n', '<Leader>l','<C-w>l', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>h','<C-w>h', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>j','<C-w>j', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>k','<C-w>k', { noremap = true })
  --tabs
  vim.api.nvim_set_keymap('n', '<S-k>',':tabnext<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<S-j>',':tabprevious<CR>', { noremap = true })
 -- Define a keymap to split open a new terminal at the bottom
vim.api.nvim_set_keymap('n', '<C-S-j>', ':below split<CR>:terminal<CR>', { noremap = true, silent = true })
 

-- auto bracket/'/" completions
vim.api.nvim_set_keymap('i','{<CR>','{<CR>}<Esc>ko<tab>',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('i','(','()<Esc>i',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('i','[','[]<Esc>i',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('i','\'','\'\'<Esc>i',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('i','\"','\"\"<Esc>i',{ noremap = true, silent = true })