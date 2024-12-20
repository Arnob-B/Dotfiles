require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua",  "markdown", "markdown_inline" ,"typescript","javascript"},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,

    -- donot load tree sitter for large files
    disable = function(lang , buf)
      local max_filesize = 100 * 1024 -- 100 kb
      local ok , stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and starts and stats.size > max_filesize then 
        return true;
      end
    end,

    additional_vim_regex_highlighting = false,
  },
}

