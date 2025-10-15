return {
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require('competitest').setup({
        run_command = {
          python = {
            exec = "python3",
            args = { "$(FNAME)" },
          },
        },
      })
    end,
  },
}
