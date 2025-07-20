vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set line number
vim.cmd("set number")

-- Setting <leader> to "space" -> " "
vim.g.mapleader = " "
vim.g.maplocalleader = "//"

-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Quit file
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit window" })

-- Save and quit
vim.keymap.set("n", "<leader>x", ":wq<CR>", { desc = "Save and quit" })

-- Clear search highlights
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlights" })

-- Fast Escape using `jk`
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

-- ========== Window/Pane Navigation ==========

-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })

-- Resize windows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- =========== Neotree ============
-- Utility to resize Neo-tree by width delta
local function resize_neotree(delta)
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local ft = vim.api.nvim_buf_get_option(buf, "filetype")
		if ft == "neo-tree" then
			vim.api.nvim_set_current_win(win)
			vim.cmd("vertical resize " .. delta)
			return
		end
	end
end

-- Launching neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal_force_cwd<CR>", { desc = "Toggle Neo-tree" })

-- Resize neotree(filemanager)
vim.keymap.set("n", "<leader>+", function()
	resize_neotree("+5")
end, { desc = "Increase Neo-tree width" })

vim.keymap.set("n", "<leader>-", function()
	resize_neotree("-5")
end, { desc = "Decrease Neo-tree width" })

-- ============ LSP ===============
-- Keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- =========== none-ls ============
-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- ============= Completions (Autocomplete) ==========
local M = {}

M.get_cmp_mappings = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	return cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	})
end

-- =========== Debugger =============

function M.setup_dap_keymaps()
	local ok, dap = pcall(require, "dap")
	if not ok then
		vim.notify("nvim-dap not available", vim.log.levels.WARN)
		return
	end

	vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
	vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "DAP: Continue" })
	vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "DAP: Step Over" })
	vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "DAP: Step Into" })
	vim.keymap.set("n", "<Leader>du", dap.step_out, { desc = "DAP: Step Out" })
end

return M

-- -- ========== Telescope ===========
--
-- local builtin = require("telescope.builtin")
-- -- Find files with <leader>ff
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
--
-- -- Live grep with <leader>fg
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind [G]rep' })
--
-- -- Find Buffers with <leader>fb
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
--
-- -- Find Help with <leader>fh
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
--
