vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", ".-", "<ESC>", { desc = "Exit insert mode with .-" })

keymap.set("n", "<leader>vh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>p", '"_dwP', { desc = "Replace word with clipboard contents" })

-- Pane management
keymap.set("n", "<M-.>", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<M-->", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<M-=>", "<C-w>=", { desc = "Equalize splits" })
keymap.set("n", "<M-q>", "<cmd>close<CR>", { desc = "Close current split" })

-- Pane resizing
keymap.set("n", "<M-o>", ":resize +5<CR>", { desc = "Increase height" })
keymap.set("n", "<M-a>", ":resize -5<CR>", { desc = "Decrease height" })
keymap.set("n", "<M-e>", ":vertical resize +5<CR>", { desc = "Increase width" })
keymap.set("n", "<M-h>", ":vertical resize -5<CR>", { desc = "Decrease width" })

-- Tab navigation
keymap.set("n", "<M-r>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<M-t>", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<M-s>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Navigate panes with tmux-navigator
-- C-arrows

-- Move panes with winshift
-- M-HAOE

-- Maximize panes with vim-maximizer
-- M-p
