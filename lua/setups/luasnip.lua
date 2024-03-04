-- require("luasnip.loaders.from_vscode").lazy_load()
-- require("luasnip.loaders.from_snipmate").lazy_load()
local types = require("luasnip.util.types")
require("luasnip").config.set_config(
  {
    keep_roots = true,
    link_roots = true,
    link_children = true,
    update_events = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged",
    enable_autosnippets = true,
		store_selection_keys = "<Tab>",
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = {{"choiceNode", "Comment"}}
        }
      }
    }
  }
)
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets"})
