-- provides an easy way to install and manage LSP servers, formatters, and linters in Neovim
return {
	"williamboman/mason.nvim",
	enable = true,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"goimports", -- Go auto-import + formatter
				"gofumpt", -- strict Go formatter
				"shfmt", -- Bash formatting
				"prettier", -- for markdown/json/yaml/html
				"stylua", -- Lua formatter
				"sqlfluff", -- optional, SQL linter/formatter	
			},
		})
	end,
}
