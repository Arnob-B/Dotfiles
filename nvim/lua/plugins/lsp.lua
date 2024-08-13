return{
  {"neovim/nvim-lspconfig"},
  {
   -- for toggling the error and warnings
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    config = function()
      require('toggle_lsp_diagnostics').init()
    end
  }
}
