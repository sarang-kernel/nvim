return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ts_ls",
					"html",
					"cssls",
					"bashls",
					"clangd",
					"rust_analyzer",
					"jsonls",
					"yamlls",
					"marksman",
					"dockerls",
					"taplo",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				pyright = {},
				ts_ls = {},
				html = {},
				cssls = {},
				bashls = {},
				clangd = {},
				rust_analyzer = {},
				jsonls = {},
				yamlls = {},
				marksman = {},
				dockerls = {},
				taplo = {},
			}

			-- Setup Lua LS separately with proper root_dir
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				root_dir = require("lspconfig.util").root_pattern(
					".git",
					".luarc.json",
					".luarc.jsonc",
					".luacheckrc",
					"lua"
				),
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = { enable = false },
					},
				},
			})

			-- Setup other servers
			for server, config in pairs(servers) do
				config.capabilities = capabilities
				lspconfig[server].setup(config)
			end

			-- Inline diagnostics
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},
}
