return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    config = function()
      require('config.snips')
      require('config.snipkeybind')
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  }
}
