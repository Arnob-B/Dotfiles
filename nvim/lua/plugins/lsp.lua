return{
  {"neovim/nvim-lspconfig"},
  {
   -- for toggling
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    config = function()
      require('toggle_lsp_diagnostics').init()
    end
  }
}