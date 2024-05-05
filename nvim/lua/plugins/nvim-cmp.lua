return
  {
  {
 'hrsh7th/nvim-cmp',
  dependencies = {
 'hrsh7th/cmp-buffer',
 'hrsh7th/cmp-path',
 'hrsh7th/cmp-cmdline',
 'saadparwaiz1/cmp_luasnip' --additoinal plugin requried for smooth working of luasnip with nvim-cmp
  },
config = function()
  require('config.completion')
end
}
}