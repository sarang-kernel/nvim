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
					"texlab",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Capabilities (unchanged)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if ok_cmp then
				capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
			end

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
				dockerls = {},
				taplo = {},
				texlab = {},
			}

			-- Lua LS (updated API)
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				root_dir = vim.fs.root(0, {
					".git",
					".luarc.json",
					".luarc.jsonc",
					".luacheckrc",
					"lua",
				}),
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
			vim.lsp.enable("lua_ls")

			-- Other servers (updated API)
			for server, config in pairs(servers) do
				config.capabilities = capabilities
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end

			-- Diagnostics config (unchanged)
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			-- Disable diagnostics in Markdown (fixed scope)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.diagnostic.enable(false, { bufnr = 0 })
				end,
			})
		end,
	},
}
