-- provides a popup displaying available keybindings
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		preset = "helix",
		win = {
			border = "rounded",
			-- col = 50,
		},
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
