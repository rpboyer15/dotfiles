vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", ".-", "<ESC>", { desc = "Exit insert mode with .-" })

keymap.set("n", "<leader>vh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>p", '"_dwP', { desc = "Replace word with clipboard contents" })

-- Pane management
keymap.set("n", "<M-p>", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<M-->", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<M-=>", "<C-w>=", { desc = "Equalize splits" })
keymap.set("n", "<M-q>", "<cmd>close<CR>", { desc = "Close current split" })

-- Pane resizing
keymap.set("n", "<leader>ro", ":resize +5<CR>", { desc = "Increase height" })
keymap.set("n", "<leader>ra", ":resize -5<CR>", { desc = "Decrease height" })
keymap.set("n", "<leader>re", ":vertical resize +5<CR>", { desc = "Increase width" })
keymap.set("n", "<leader>rh", ":vertical resize -5<CR>", { desc = "Decrease width" })
keymap.set("n", "<leader>r=", "<C-w>=", { desc = "Equalize splits" })

-- Tab navigation
keymap.set("n", "<M-r>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<M-t>", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<M-s>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Navigate panes with tmux-navigator

-- Move panes with winshift

-- Maximize panes with vim-maximizer

-- Replace text
-- keymap.set("v", "<leader>s", "hy:%s/<C-r>h//g<Left><Left>")
