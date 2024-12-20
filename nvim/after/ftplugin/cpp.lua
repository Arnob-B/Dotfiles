local function compiler_and_run_cpp_windows()
  function cppexec()
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

    --vim.fn.termopen(string.format("g++ \"%s\" -Dfastioexlude && a.exe",filename))
    vim.fn.termopen(string.format("g++ \"%s\" -Dfastioexlude && ./a.out",filename))

    -- unmount component when cursor leaves buffer
    popup:map('n','q',function()
      popup:unmount()
    end)
    popup:on(event.BufLeave, function()
      popup:unmount()
    end)
  end
  vim.api.nvim_set_var("cppexec", cppexec)
  vim.api.nvim_buf_set_keymap(0,'n', '<leader>1', ':CompetiTest run <CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0,'n', '<leader>2', ':CompetiTest run_no_compile <CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0,'n', '<leader>3', ':CompetiTest show_ui <CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0,'n', '<leader>4', ':lua cppexec() <CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0,'n', '<leader>at', ':CompetiTest add_testcase <CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0,'n', '<leader>et', ':CompetiTest edit_testcase <CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0,'n', '<leader>dt', ':CompetiTest delete_testcase <CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0,'n', '<leader>ap', ':CompetiTest receive problem <CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0,'n', '<leader>ac', ':CompetiTest receive contest <CR>', { noremap = true, silent = true })
end
compiler_and_run_cpp_windows()

