return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- lazy load
	dependencies = {
		-- mason.nvim is assumed to be configured elsewhere
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		-- Define format on save autocmd group
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- Setup none-ls
		null_ls.setup({
			sources = {
				-- Formatters
				formatting.stylua, -- Lua
				formatting.prettier, -- JS, TS, CSS, HTML
				formatting.shfmt, -- Shell
				formatting.black, -- Python

				-- Diagnostics
				-- diagnostics.eslint_d, -- JS/TS
				-- diagnostics.flake8, -- Python
				-- diagnostics.shellcheck, -- Shell
				diagnostics.markdownlint, -- Markdown
				diagnostics.yamllint, -- YAML

				-- Optional
				null_ls.builtins.completion.spell,
			},

			on_attach = function(client, bufnr)
				-- Autoformat on save
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})

		-- Safely setup mason-null-ls to avoid race conditions
		vim.schedule(function()
			local ok, mason_null_ls = pcall(require, "mason-null-ls")
			if ok then
				mason_null_ls.setup({
					ensure_installed = {
						-- Formatters
						"stylua",
						"prettier",
						"shfmt",
						"black",

						-- Diagnostics
						"eslint_d",
						"flake8",
						"shellcheck",
						"markdownlint",
						"yamllint",
					},
					automatic_installation = true,
				})
			else
				vim.notify("mason-null-ls not found", vim.log.levels.WARN)
			end
		end)

		-- Optional: Manual format key
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "[G]o [F]ormat (via LSP)" })
	end,
}
