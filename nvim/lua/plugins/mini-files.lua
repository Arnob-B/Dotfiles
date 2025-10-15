-- Filename: ~/github/dotfiles-latest/neovim/neobean-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/mini-files.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/mini-files.lua
--
-- https://github.com/echasnovski/mini.files
--
-- I got this configuration from LazyVim.org
-- http://www.lazyvim.org/extras/editor/mini-files

-- I migrated my custom keymaps config and also the git status config to
-- separate files, as this file was growing too big
-- I also use this file as a centralized place for all the different keymaps,
-- including my custom ones
--


return {
  "echasnovski/mini.files",
  opts = function(_, opts)

    opts.windows = vim.tbl_deep_extend("force", opts.windows or {}, {
      preview = false,
      width_focus = 20,
      width_preview = 50,
    })
		opts.mappings = {
			go_in = '<CR>',
			go_in_plus = 'L',
			go_out = 'H',
			go_out_plus = 'H'
		}

    opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
      -- Whether to use for editing directories
      -- Disabled by default in LazyVim because neo-tree is used for that
      use_as_default_explorer = true,
      -- If set to false, files are moved to the trash directory
      -- To get this dir run :echo stdpath('data')
      -- ~/.local/share/neobean/mini.files/trash
      permanent_delete = false,
    })
    return opts
  end,

  keys = {
    {
      -- Open the directory of the file currently being edited
      -- If the file doesn't exist because you maybe switched to a new git branch
      -- open the current working directory
      "<leader>e.",
      function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        local dir_name = vim.fn.fnamemodify(buf_name, ":p:h")
        if vim.fn.filereadable(buf_name) == 1 then
          -- Pass the full file path to highlight the file
          require("mini.files").open(buf_name, true)
        elseif vim.fn.isdirectory(dir_name) == 1 then
          -- If the directory exists but the file doesn't, open the directory
          require("mini.files").open(dir_name, true)
        else
          -- If neither exists, fallback to the current working directory
          require("mini.files").open(vim.uv.cwd(), true)
        end
      end,
      desc = "Open mini.files (Directory of Current File or CWD if not exists)",
    },
    -- Open the current working directory
    {
      "<leader>ee",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },

  config = function(_, opts)
    -- Set up mini.files
    require("mini.files").setup(opts)
  end,
}
