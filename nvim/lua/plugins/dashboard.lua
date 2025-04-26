function movetocc()
  vim.cmd('cd ~/Documents/cp/')
  vim.cmd('Oil')
end

function movetodotfiles()
  vim.cmd('Oil ~/.config/')
end

function movetonotes()
  vim.cmd('cd ~/OneDrive/Obsidian Vaults OD/')
  local ondRes = vim.fn.jobstart('onedrive --synchronize', {
    on_stdout = function(_, data, _)
      if (data) then
        for _, line in ipairs(data) do
          print(line)
        end
      end
    end
  });
  on_exit = function(_, _)
    print("onedrive sync completed")
  end
  print(ondRes)
  vim.cmd('Oil')
end

function movetoproj()
  vim.cmd('cd ~/Documents/prj/')
  vim.cmd('Oil')
end

function movetogit()
  vim.cmd('cd ~/Documents/gitRepo/')
  vim.cmd('Oil')
end

return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = {
            [[_____________________                              _____________________]],
            [[`-._                 \           |\__/|           /                 _.-']],
            [[\                 \          |-  -|          /                 /]],
            [[\                 `-_______/      \_______-'                 /]],
            [[|                                                          |]],
            [[|                                                          |]],
            [[|                                                          |]],
            [[/                                                          \]],
            [[/_____________                                  _____________\]],
            [[`----._                    _.----']],
            [[`--.            .--']],
            [[`-.      .-']],
            [[\    /]],
            [[\  /]],
            [[\/]],
            [[  ]],
            [[  ]],
            [[  ]],
          }, --your header
          center = {
            {
              icon = '󰘦 ',
              desc = 'git repo',
              desc_hl = 'String',
              key = 'g',
              keymap = 'g',
              key_hl = 'Number',
              key_format = ' %s', -- remove default surrounding `[]`
              action = movetogit
            },
            {
              icon = '󰘦 ',
              desc = 'project ',
              desc_hl = 'String',
              key = 'p',
              keymap = 'l',
              key_hl = 'Number',
              key_format = ' %s', -- remove default surrounding `[]`
              action = movetoproj
            },
            {
              icon = '󰘦 ',
              desc = 'CC ',
              desc_hl = 'String',
              key = 'c',
              keymap = 'l',
              key_hl = 'Number',
              key_format = ' %s', -- remove default surrounding `[]`
              action = movetocc
            },
            {
              icon = ' ',
              desc = 'Dotfiles',
              desc_hl = 'String',
              key = 'd',
              keymap = 'SPC f d',
              key_format = ' %s', -- remove default surrounding `[]`
              action = movetodotfiles
            },
            {
              icon = '󰂺 ',
              desc = 'Notes',
              desc_hl = 'String',
              key = 'n',
              keymap = 'SPC f d',
              key_format = ' %s', -- remove default surrounding `[]`
              action = movetonotes
            },
          },
          footer = {
            [[while(1) {Eat Code Sleep} ]]
          } --your footer
        }
      }
    end
  }
}
