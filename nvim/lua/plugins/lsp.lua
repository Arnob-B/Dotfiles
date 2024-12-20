return{
  {"neovim/nvim-lspconfig",
  config = function()
    require("config.lspconfig");
  end,
},
  {
   -- for toggling the error and warnings
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    config = function()
      require('toggle_lsp_diagnostics').init()
    end
  }
}
