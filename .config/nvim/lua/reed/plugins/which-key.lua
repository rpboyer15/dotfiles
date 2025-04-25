-- provides a popup displaying available keybindings
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		win = {
			border = "rounded",
		}
	},
	config = function(_, opts)
		require("which-key").setup(opts)

		-- optional group name for <leader>n
		require("which-key").add({
			{ "<C-w>",     group = "Pane Navigation" },
			{ "<leader>e", group = "File Tree" },
			{ "<leader>f", group = "Fuzzy Finder" },
		})
	end,
}
