require('neorg').setup {
	load = {
		["core.defaults"] = {},
		["core.dirman"] = {
				config = {
						workspaces = {
								work = "~/notes/work",
						},
						default_workspace = "work"
				}
		},
		["core.presenter"] = {
			config = {
				zen_mode = "truezen"
			}
		},
		["core.ui.calendar"] = {},
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
