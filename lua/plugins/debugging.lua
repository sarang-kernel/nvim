-- lua/plugins/debugging.lua
return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		-- your dap configuration goes here if any
		-- e.g. dap.adapters / dap.configurations

		-- import your keymaps from vim-options.lua
		require("vim-options").setup_dap_keymaps()
	end,
}
