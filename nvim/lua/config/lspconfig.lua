-- be sure to include the bits/stdc++ file into the clan include folder  
-- to do so in terminal run clangd the look for the clangd.exe file location , you will find the include file somewhere over here
require'lspconfig'.clangd.setup({
  cmd = {
  'clangd',
    "--suggest-missing-includes",
    '--query-driver="D:\\applications\\gcc\\bin\\g++.exe"',
},
  filetypes = {"cpp","c"}
})
-- vim.diagnostic.config({ virtual_text = true, signs = false })
-- enable thihs for only signs at the end 
vim.diagnostic.config({ virtual_text = { format = function(d) return "" end }, signs = false })
require('toggle_lsp_diagnostics').init(vim.diagnostic.config())
--vim.keyp <leader>tlv <Plug>(toggle-lsp-diag-vtext)
  vim.api.nvim_set_keymap('n', '<Leader>dd',':ToggleDiagDefault<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<Leader>df',':ToggleDiagOn<CR>', { noremap = true })