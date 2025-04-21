return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			color_overrides = {
				frappe = {
					surface1 = "#71758e", -- palette index 0
					surface2 = "#8e91a4", -- palette index 1
				},
			},
			integrations = {
				cmp = true,
			}
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
