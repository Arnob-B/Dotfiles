-- { noremap = true, silent = true } 'noremap' prevents recursive mappings|'silent' suppresses the command from being echoed to the command line

--[[
-- Define a function to set up key mappings for the explorer
local function setup_explorer_keymaps()
    -- Use the leader key followed by "e" to open the explorer
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

  --vim.fn.termopen(string.format("g++ \"%s\" -Dfastioexlude && a.exe",filename))
  vim.fn.termopen(string.format("g++ \"%s\" -Dfastioexlude && ./a.out",filename))

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
]]--

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
