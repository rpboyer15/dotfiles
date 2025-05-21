-- Allows you to maximize split windows
return {
	"szw/vim-maximizer",
	enabled = true,
	keys = {
		{ "<M-g>", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	},
}
