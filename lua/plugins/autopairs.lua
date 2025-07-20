return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
			ts_config = {
				rust = { "string" },
				c = { "string" },
				python = { "string" },
				bash = { "string" },
				html = { "attribute" },
				javascript = { "template_string" },
				typescript = { "template_string" },
			},
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascriptreact", "typescriptreact", "xml" },
		opts = { enable = true, filetypes = { "html", "xml", "javascript", "typescript", "jsx", "tsx" } },
		config = function(_, opts)
			require("nvim-ts-autotag").setup(opts)
		end,
	},
}
