-- gitsigns: git signs in the gutter. NOTE: the hunk keymaps live in vim-options.lua (setup_gitsigns_keymaps) and are NOT attached here (no on_attach).
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		watch_gitdir = { follow_files = true },
		current_line_blame = false,
	},
	config = function(_, opts)
		require("gitsigns").setup(opts)
	end,
}
