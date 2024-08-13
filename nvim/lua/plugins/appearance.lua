return{
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
      vim.cmd("colorscheme catppuccin-mocha");
    end
  } ,
  -- the line that comes in the indents
  {
    "lukas-reineke/indent-blankline.nvim"
    --config = function()
    --end
  }
}
