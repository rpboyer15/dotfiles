return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "frappe",
		color_overrides = {
			frappe = {
				surface1 = "#71758e", -- palette index 0
				surface2 = "#8e91a4", -- palette index 1
			},
		},
		integrations = {
			cmp = true,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
