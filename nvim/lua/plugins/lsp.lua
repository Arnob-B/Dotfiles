return{
  {"neovim/nvim-lspconfig",
  dependencies = {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  },
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
