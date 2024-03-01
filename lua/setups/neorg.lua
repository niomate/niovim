require('neorg').setup {
	load = {
		["core.defaults"] = {},
		["core.dirman"] = {
				config = {
						workspaces = {
								work = "~/notes/work",
						}
				}
		},
		["core.syntax"] = {},
		["core.concealer"] = {},
		["core.integrations.treesitter"] = {},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp"
			}
		}
	}
}
