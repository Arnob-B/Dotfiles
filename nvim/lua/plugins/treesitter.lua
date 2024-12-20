return{ 
  {
    'nvim-treesitter/nvim-treesitter', 
    build = ":TSUpdate", -- if we update the plugin , make sure to run the build command
    config = function()
      require('config.treesiterconfig')
    end
  }
}
