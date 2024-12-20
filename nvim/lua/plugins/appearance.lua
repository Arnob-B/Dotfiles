function makeDiagTransparent()
  --vim.api.nvim_set_hl(0,"DiagnosticVirtualTextError",{bg='none'})
  vim.cmd("highlight DiagnosticVirtualTextError guibg=none");
  vim.cmd("highlight DiagnosticVirtualTextWarning guibg=none");
end

function makeTransparent()
  vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
  vim.api.nvim_set_hl(0, "NormalNc", { bg = 'none' })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = 'none' })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = 'none' }) -- for nvim cmp
  --vim.api.nvim_set_hl(0,"DiagnosticVirtualTextError",{guibg='none'})
  --vim.api.nvim_set_hl(0,"DiagnosticVirtualTextWarning",{guibg='none'})
end

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1002,
    config = function()
      vim.cmd("colorscheme rose-pine-main");
      makeTransparent()
      makeDiagTransparent()
    end
  },
  --[[
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enable = false,
    priority = 1000,
    config = function ()
      makeDiagTransparent()
      vim.cmd("colorscheme catppuccin-mocha");
      makeTransparent()
    end
  } ,
  ]] --
  -- the line that comes in the indents
  {
    "lukas-reineke/indent-blankline.nvim"
    --config = function()
    --end
  },
  {
    "thedenisnikulin/vim-cyberpunk",
    name = "cyberpunk",
  },
  {
    "akai54/2077.nvim",
    name = "akaiCyberpunk",
  },
}
