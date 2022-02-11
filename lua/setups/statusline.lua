local gps = require"nvim-gps"

local custom_gruvbox = require'lualine.themes.gruvbox'

require"lualine".setup{
	sections = {
		lualine_c = {
			{ gps.get_location, cond = gps.is_available },
		}
	},
	options = {
		theme = custom_gruvbox
	}
}

gps.setup()
