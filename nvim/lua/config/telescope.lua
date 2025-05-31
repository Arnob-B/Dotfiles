require('telescope').setup {
  defaults = vim.tbl_deep_extend("force", {
    file_ignore_patterns = { "node_modules" },
  }, require('telescope.themes').get_ivy({
    previewer = false,
    sorting_strategy = "ascending",
    layout_config = {
      height = 15,
    },
  }))
}
