-- provides improved syntax highlighting, indentation, and incremental selection

return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({
			modules = {},
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},
			-- ensure these language parsers are installed
			ensure_installed = {
				"bash",
				"c",
				"css",
				"dockerfile",
				"gitignore",
				"go",
				"graphql",
				"html",
				"json",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"swift",
				"sql",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"zig",
			},

			sync_install = false,
			auto_install = true,
			ignore_install = {},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			-- rainbow bracket config needs work
			-- rainbow = {
			-- 	enable = true,
			-- 	query = "rainbow-parens",
			-- },
		})
	end,
}
