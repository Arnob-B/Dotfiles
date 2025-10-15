return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/vaults/Personal",
			},
			{
				name = "Work",
				path = "~/Documents/notes/Work",
			},
			{
				name = "DSA",
				path = "~/Documents/notes/DSA",
			}
		},
		daily_notes = {
			folder = "Dailies/",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			default_tags = { "daily-notes" },
			template = "daily.md"
		},
		templates = {
			folder = "Templates/", -- this must point to the folder containing your templates
		},
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return suffix
		end,
		disable_frontmatter = true,
		follow_url_func = function(url)
			-- copy the link
			vim.fn.setreg('+', url)
			vim.notify("URL copied to clipboard!", vim.log.levels.INFO)
		end,
		attachments = {
			img_folder = "assets/", -- This is the default

			---@return string
			img_name_func = function()
				return string.format("%s-", os.time())
			end,

			---@param client obsidian.Client
			---@param path obsidian.Path the absolute path to the image file
			---@return string
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format("![%s](%s)", path.name, path)
			end,
		},
		ui = {
			enable = false
		},
	},

}
