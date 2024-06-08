return{
  {
    "williamboman/mason.nvim",
    config = function ()
      require 'mason'.setup()
      local mason_registry = require("mason-registry")
      local codelldb = mason_registry.get_package("codelldb")
    end
  }
}