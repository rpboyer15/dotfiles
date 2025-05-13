-- provides asynchronous linting for various programming languages
-- - Supports multiple linters for different file types.
-- - Runs linting automatically on file open, save, and after exiting insert mode.
-- - Allows manual linting via <leader>l.
return {
	"mfussenegger/nvim-lint",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Check the nvim-lint readme for the correct linter name (may not match mason exactly)
		-- https://github.com/mfussenegger/nvim-lint
		lint.linters_by_ft = {
			go = { "golangcilint" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			python = { "pylint" },
			svelte = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
