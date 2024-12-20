-- be sure to include the bits/stdc++ file into the clang include folder
-- to do so in terminal run clangd the look for the clangd.exe file location , you will find the include file somewhere over here
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require 'lspconfig'.clangd.setup({
  cmd = {
    'clangd',
    "--suggest-missing-includes",
    '--query-driver="D:\\applications\\gcc\\bin\\g++.exe"',
  },
  filetypes = { "cpp", "c" },
})


-- TypeScript
-- prerequisite (install the typescript lsp from https://github.com/typescript-language-server/typescript-language-server)
require 'lspconfig'.ts_ls.setup {
  on_attach = function()
    print("attached to ts_ls server");
  end,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

require 'lspconfig'.jdtls.setup {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  on_attach = function(client, bufnr)
    -- Make sure LSP attach only sends notifications after attachment
    client.handlers["textDocument/didChange"] = function() end
  end,
  settings = {
    java = {
      configuration = {
        updateBuildConfiguration = "disabled", -- Set to "interactive" or "disabled"
      },
    },
  },
  filetypes = { "java" },
  cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls') },
  capabilities = capabilities
}

--lua
require 'lspconfig'.lua_ls.setup {
  on_attach = function()
    print("attached to lua server");
  end,
  filetypes = { "lua" },
  cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/lua-language-server') },
  capabilities = capabilities
}
-- vim.diagnostic.config({ virtual_text = true, signs = false })
-- enable thihs for only signs at the end
vim.diagnostic.config({ virtual_text = { format = function(d) return "" end }, signs = false })
require('toggle_lsp_diagnostics').init(vim.diagnostic.config())
--vim.keyp <leader>tlv <Plug>(toggle-lsp-diag-vtext)
vim.api.nvim_set_keymap('n', '<Leader>dd', ':ToggleDiagDefault<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>df', ':ToggleDiagOn<CR>', { noremap = true })
