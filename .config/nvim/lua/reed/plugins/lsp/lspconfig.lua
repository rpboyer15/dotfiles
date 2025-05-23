-- provides Language Server Protocol (LSP) support in Neovim for enhanced code intelligence
return {
	"neovim/nvim-lspconfig",
	enable = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim",                   opts = {} },
	},
	config = function()
		-- import cmp-nvim-lsp plugin
		local keymap = vim.keymap -- for conciseness

		-- sets up keybindings only when an LSP attaches to a file
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- rename symbol across entire project

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Show source of diagnostic"
				vim.keymap.set("n", "<leader>ds", function()
					local diag = vim.diagnostic.get(0)[1]
					if diag then
						print("Diagnostic source: " .. (diag.source or "unknown"))
					else
						print("No diagnostic available")
					end
				end, { desc = "Show diagnostic source" })

				vim.keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1 })
				end, { desc = "Go to previous diagnostic" })

				vim.keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1 })
				end, { desc = "Go to next diagnostic" })

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "D", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = ev.buf,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end,
		})

		-- local lspconfig = require("lspconfig")
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
		--
		-- lspconfig.gopls.setup({
		-- 	capabilities = cmp_nvim_lsp.default_capabilities(),
		-- })

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			-- (optional) enable other diagnostic UI features
			virtual_text = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or "rounded"
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

		-- vim.lsp.config is a neovim function that registers a config for the LSP
		-- server, in this case the one named lua_ls.
		-- For a list of other LSP servers, see https://github.com/neovim/nvim-lspconfig/tree/master/lsp
		-- settings = { ... } is passed to the language server as part of the LSP
		-- initialization handshake.
		-- Everything under settings are configs from the language server itself.
		-- You need to go to the lua-language-server docs to determine what config
		-- options are available to put here.
		-- https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
		-- But to start just follow what's suggested in https://github.com/neovim/nvim-lspconfig/tree/master/lsp
		vim.lsp.config("lua_ls", {
			-- capabilities = capabilities,
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using (most
						-- likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Tell the language server how to find Lua modules same way as Neovim
						-- (see `:h lua-module-load`)
						path = {
							"lua/?.lua",
							"lua/?/init.lua",
						},
					},
					diagnostics = {
						globals = { "vim" },
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				})
			end,
			settings = {
				Lua = {},
			},
		})
		vim.lsp.config("pyright", {
			settings = {
				python = {
					pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
					analysis = {
						extraPaths = { vim.fn.getcwd() .. "/.venv/lib/python3.11/site-packages" },
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace", -- optional but recommended
					},
				},
			},
		})
		vim.lsp.config("ruff", {
			on_init = function(client)
				client.offset_encoding = "utf-16"
			end,
		})
	end,
}
