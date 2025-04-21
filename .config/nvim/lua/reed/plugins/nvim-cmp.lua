-- Provides autocompletion functionality
--
-- Features:
--  - Supports LSP-based autocompletion.
--  - Provides snippet expansion using LuaSnip.
--  - Completes from the buffer, filesystem paths, and predefined snippets.
--  - Displays VS Code-like icons using lspkind.
--  - Scrollable documentation in the completion menu.
--  - Custom key mappings for navigating completion suggestions.
--
-- Keybindings:
--  - <C-o> → Previous suggestion.
--  - <C-a> → Next suggestion.
--  - <C-u> / <C-d> → Scroll documentation up/down.
--  - <C-Space> → Show completion suggestions.
--  - <C-e> → Close completion window.
--  - <CR> → Confirm selection.
--
-- Notes:
-- - Autocompletion is disabled in Markdown files.
-- - Snippets are auto-loaded from friendly-snippets.

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",       -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			build = "make install_jsregexp", -- optional for advanced regex snippets
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim",     -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
				-- ["<C-u>"] = cmp.mapping.scroll_docs(-4), --these don't seem to be working properly
				-- ["<C-d>"] = cmp.mapping.scroll_docs(4),  --these don't seem to be working properly
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				-- allows down key to move cursor instead of scrolling list
				["<Down>"] = function(fallback) fallback() end,
				["<Up>"] = function(fallback) fallback() end,
			}),
			-- Gives autocomplete window a border
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- pulls completion data from any active LSP
				{ name = "luasnip" }, -- snippets
				{ name = "path" }, -- file system paths
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end
}
