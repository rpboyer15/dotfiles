-- Provides fuzzy finding and searching capabilities in Neovim

-- 📦 Custom smart C-q action: send selected or all entries to quickfix
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function smart_send_to_qflist(prompt_bufnr)
	local picker = action_state.get_current_picker(prompt_bufnr)
	local selections = picker:get_multi_selection()

	if next(selections) ~= nil then
		actions.send_selected_to_qflist(prompt_bufnr)
	else
		actions.send_to_qflist(prompt_bufnr)
	end

	actions.open_qflist(prompt_bufnr)
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	opts = {
		defaults = {
			path_display = { "smart" },
			mappings = {
				i = {
					["<C-q>"] = smart_send_to_qflist,
					["<C-t>"] = actions.select_tab,
				},
				n = {
					["<C-q>"] = smart_send_to_qflist,
					["<C-t>"] = actions.select_tab,
				},
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")

		telescope.setup(opts)

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
