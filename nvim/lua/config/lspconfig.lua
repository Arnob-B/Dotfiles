-- be sure to include the bits/stdc++ file into the clang include folder
-- to do so in terminal run clangd the look for the clangd.exe file location , you will find the include file somewhere over here
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require 'lspconfig'.clangd.setup({
  cmd = {
    'clangd',
    --    "--suggest-missing-includes",
    --'--query-driver="D:\\applications\\gcc\\bin\\g++.exe"',
  },
  filetypes = { "cpp", "c" },
})


-- TypeScript
-- prerequisite (install the typescript lsp from https://github.com/typescript-language-server/typescript-language-server)
require 'lspconfig'.ts_ls.setup {
  on_attach = function()
    vim.notify("attached to ts_ls server");
  end,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "literal",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    capabilities = capabilities,
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}
require 'lspconfig'.tailwindcss.setup {
  on_attach = function()
    vim.notify("tailwind server attached");
  end,
  root_dir = function(...)
    return require("lspconfig.util").root_pattern(".git")(...)
  end
}

require('lspconfig').rust_analyzer.setup {
  on_attach = function()
    vim.notify("rust_analyzer server attached");
  end,
  root_dir = function(...)
    return require("lspconfig.util").root_pattern(".git", "Cargo.toml")(...)
  end
}





require 'lspconfig'.jdtls.setup {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  on_attach = function(client, bufnr)
    -- Make sure LSP attach only sends notifications after attachment
  end,
  settings = {
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
--vim.api.nvim_set_keymap('n', '<Leader>dd', ':ToggleDiagDefault<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>df', ':ToggleDiagOn<CR>', { noremap = true })




-- lsp apearancesk
-- Define diagnostic signs with number highlighting (numhl)
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticHint" })

-- Highlight groups for diagnostics
vim.cmd([[
  highlight DiagnosticError guifg=#ff0000 gui=bold
  highlight DiagnosticWarn guifg=#ffaa00 gui=bold
  highlight DiagnosticInfo guifg=#00aaff gui=bold
  highlight DiagnosticHint guifg=#00ffaa gui=bold
]])

-- Default diagnostic configuration: Symbols only in the number line
local symbol_only_config = {
  virtual_text = false,
  signs = true, -- Signs enable the numhl to work
  underline = false,
  update_in_insert = false,
  severity_sort = true,
}

-- Detailed diagnostic configuration
local detailed_config = {
  virtual_text = { prefix = "●", spacing = 2 },
  signs = true, -- Keeps the numhl active
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

-- Apply the default symbol-only configuration
vim.diagnostic.config(symbol_only_config)

-- Function to toggle between configurations
local detailed = false
local function toggle_diagnostics()
  detailed = not detailed
  if detailed then
    vim.diagnostic.config(detailed_config)
    print("Diagnostics: Detailed")
  else
    vim.diagnostic.config(symbol_only_config)
    print("Diagnostics: Symbol Only")
  end
end

-- Keymap to toggle diagnostics (change '<leader>d' to your preferred keybinding)
vim.keymap.set("n", "<leader>df",
  function() vim.diagnostic.config(detailed_config) end
  , { desc = "Toggle Diagnostics Display: Detailed" })

vim.keymap.set("n", "<leader>dd",
  function() vim.diagnostic.config(symbol_only_config) end
  , { desc = "Toggle Diagnostics Display: Symbol Only" })
