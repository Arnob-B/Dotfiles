local function movetocc()
	vim.cmd('cd ~/Documents/cp/')
	vim.cmd('NvimTreeToggle')
end

local function movetodotfiles()
	vim.cmd('NvimTreeToggle ~/.config/')
end

local function movetonotes()
	vim.cmd('cd ~/Documents/notes/')
	vim.cmd('NvimTreeToggle')
end

local function moveToCurrentDirectory()
	vim.cmd('NvimTreeToggle')
end

local function movetoproj()
	vim.cmd('cd ~/Documents/prj/')
	vim.cmd('NvimTreeToggle')
end

local function movetogit()
	vim.cmd('cd ~/Documents/gitRepo/')
	vim.cmd('NvimTreeToggle')
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
						[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
						[[⠀⠀⠀⠀⠀⠀⣰⣾⠁⠀⢦⣾⣤⠆⠀⠻⣧⠀⠀⠀⠀⠀⠀]],
						[[⠀⠀⠀⠀⢠⣼⠏⠀⠀⠀⠀⣿⡇⠀⠀⠀⠈⢷⣄⠀⠀⠀⠀]],
						[[⠀⠀⢀⣸⣿⠃⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⢿⣧⡀⠀⠀]],
						[[⠀⢰⣾⣿⡁⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⢀⣿⣿⠖⠀]],
						[[⠀⠀⠈⠻⣿⣦⣄⠀⠀⠀⠀⣿⡇⠀⠀⠀⢀⣴⣿⠟⠁⠀⠀]],
						[[⠀⠀⠀⠀⠈⠻⢿⣷⣄⡀⠀⣿⡇⠀⣠⣾⣿⠟⠁⠀⠀⠀⠀]],
						[[⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣦⣿⣧⣾⣿⠟⠁⠀⠀⠀⠀⠀⠀]],
						[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
						[[⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀]],
						[[⠀⠀⠀⠀⠀⢀⣴⣿⣿⠟⠁⣻⣿⠈⠙⢿⣿⣦⡀⠀⠀⠀⠀]],
						[[⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⣽⣿⠀⠀⠀⠙⢿⣿⣦⣄⠀⠀]],
						[[⠀⣠⣴⣿⡿⠋⠀⠀⠀⠀⠀⢼⣿⠀⠀⠀⠀⠀⠈⢻⣿⣷⣄]],
						[[⠈⠙⢿⣿⣦⣄⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⣠⣾⣿⠟⠁]],
						[[⠀⠀⠀⠙⢿⣿⣷⣄⠀⠀⠀⢸⣿⠀⠀⠀⣠⣾⣿⠟⠁⠀⠀]],
						[[⠀⠀⠀⠀⠀⠙⢻⣿⣷⡄⠀⢸⣿⠀⠀⣼⣿⣿⠃⠀⠀⠀⠀]],
						[[⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣦⣸⣿⣠⣾⣿⠟⠁⠀⠀⠀⠀⠀]],
						[[⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀]],
						[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
						[[]],
						[[]],
						[[]],
						[[]],
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
							keymap = 'd',
							key_format = ' %s', -- remove default surrounding `[]`
							action = movetodotfiles
						},
						{
							icon = '󰂺 ',
							desc = 'Notes',
							desc_hl = 'String',
							key = 'n',
							keymap = 'n',
							key_format = ' %s', -- remove default surrounding `[]`
							action = movetonotes
						},
						{
							icon = '⤵ ',
							desc = 'oil',
							desc_hl = 'String',
							key = '.',
							keymap = '.',
							key_format = ' %s', -- remove default surrounding `[]`
							action = moveToCurrentDirectory
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
