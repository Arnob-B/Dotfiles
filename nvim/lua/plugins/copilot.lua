return {
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.cmd [[
        imap <silent><script><expr> <S-Tab> copilot#Accept("\<CR>")
        let g:copilot_assume_mapped = v:true
        let g:copilot_tab_fallback = ""
      ]]
    end
  },
}
