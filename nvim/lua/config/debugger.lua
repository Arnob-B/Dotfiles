function cppdebugexec()
  local Popup = require("nui.popup")
  local event = require("nui.utils.autocmd").event

  local popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
    },
    position = "50%",
    size = {
      width = "80%",
      height = "60%",
    },
  })

  local filename = vim.api.nvim_buf_get_name(0);
  -- mount/open the component
  popup:mount()

  --vim.fn.termopen(string.format("g++ \"%s\" -g -o agdb.exe && gdb agdb.exe",filename))
  vim.fn.termopen(string.format("g++ \"%s\" -g -o agdb && gdb agdb",filename))

  -- unmount component when cursor leaves buffer
  popup:map('n','q',function()
    popup:unmount()
  end)
  popup:on(event.BufLeave, function()
    popup:unmount()
  end)
end
vim.api.nvim_set_keymap('n', '<leader>5', ':lua cppdebugexec() <CR>', { noremap = true, silent = true })
