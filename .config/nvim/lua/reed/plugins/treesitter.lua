-- provides improved syntax highlighting, indentation, and incremental selection
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup()

			-- install parsers
			require("nvim-treesitter").install({
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
				"python",
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
			})

			-- enable treesitter highlighting and indentation for all filetypes with a parser
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					if pcall(vim.treesitter.start) then
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
				},
			})

			-- textobject keymaps
			local select_textobject = function(query)
				return function()
					require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
				end
			end

			vim.keymap.set({ "x", "o" }, "af", select_textobject("@function.outer"))
			vim.keymap.set({ "x", "o" }, "if", select_textobject("@function.inner"))
			vim.keymap.set({ "x", "o" }, "ac", select_textobject("@class.outer"))
			vim.keymap.set({ "x", "o" }, "ic", select_textobject("@class.inner"))
		end,
	},
}
