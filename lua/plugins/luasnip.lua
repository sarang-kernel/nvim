-- lua/plugins/luasnip.lua
-- This file REQUIRES your snippets and tells Luasnip to load them.

-- This line requires the table returned by 'snippets.lua'.
-- It will only work if the path is correct and the other file has a 'return' statement.
local snippet_utils = require("utils.snippets")

return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		-- Load snippets from VS Code-style packages
		require("luasnip.loaders.from_vscode").lazy_load()

		-- This is line 9. It calls the function from the table we required.
		-- This will now work because 'snippet_utils' is a valid table.
		snippet_utils.load_latex_snippets()
	end,
}
