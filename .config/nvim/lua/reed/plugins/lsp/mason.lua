-- provides an easy way to install and manage LSP servers, formatters, and linters in Neovim
return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")
		local mason_lspconfig = require("mason-lspconfig")

		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
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

		mason_lspconfig.setup({
			-- List of servers for mason to install.
			-- Rely on installing LSP's with this method instead of through the Mason
			-- menu, since this keeps a record of which LSP's you want and you can easily
			-- restore your setup with dotfiles.
			ensure_installed = {
				"bashls", -- Bash LSP
				"clangd", -- C++ LSP
				"dockerls", -- Dockerfile LSP
				"gopls", -- Go LSP
				"jsonls", -- JSON LSP
				"lua_ls", -- Lua (for Neovim config)
				"marksman", -- Markdown LSP
				"pyright", -- python LSP
				"sqls", -- SQL LSP
				"yamlls", -- YAML (optional)
			},
			automatic_installation = true,
		})

		-- for installing formatters and linters
		mason_tool_installer.setup({
			-- Same with LSP's, only install through here instead of Mason menu.
			-- Apply formatters in conform.lua and linters in linting.lua
			ensure_installed = {
				"eslint_d", --
				"clang-format", -- C++
				"isort", -- sorts python imports
				"gofumpt", -- strict Go formatter
				"goimports", -- Go auto-import + formatter
				"golangci-lint", -- Go linter
				"prettier", -- for markdown/json/yaml/html
				"shfmt", -- Bash formatting
				"sqlfluff", -- optional, SQL linter/formatter
				"stylua", -- Lua formatter
			},
		})
	end,
}
