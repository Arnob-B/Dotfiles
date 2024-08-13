function movetocc()
  vim.cmd('cd ~/Documents/cp/')
  vim.cmd('Ex')
end
function movetodotfiles()
  vim.cmd('cd ~/.config/nvim/')
  vim.cmd('Ex')
end
function movetonotes()
  vim.cmd('cd ~/OneDrive/Obsidian Vaults OD/')
  vim.cmd('Ex')
end
return{
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
          }  --your footer
        }
    }
  end
  }
}

