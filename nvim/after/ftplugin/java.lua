local function compileAndExecJava()
  function javaExec()
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
    local name_no_ext = vim.fn.fnamemodify(vim.fn.expand('%'), ':r')
    -- mount/open the component
    popup:mount()

    --vim.fn.termopen(string.format("g++ \"%s\" -Dfastioexlude && a.exe",filename))
    vim.fn.termopen(string.format("javac \"%s\"  && java \"%s\" ",filename,name_no_ext))

    -- unmount component when cursor leaves buffer
    popup:map('n','q',function()
      popup:unmount()
    end)
    popup:on(event.BufLeave, function()
      popup:unmount()
    end)
  end
  vim.api.nvim_set_var("javaExec", javaExec)
  vim.api.nvim_buf_set_keymap(0,'n', '<leader>4', ':lua javaExec() <CR>', { noremap = true, silent = true })
end
compileAndExecJava()

