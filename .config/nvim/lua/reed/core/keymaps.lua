vim.g.mapleader = " "

local keymap = vim.keymap

-- escape sequence
keymap.set("i", ".-", "<ESC>", { desc = "Exit insert mode with .-" })

-- clear search highlights
keymap.set("n", "<leader>vh", ":nohl<CR>", { desc = "Clear search highlights" })

-- move panes with winshift
--

-- navigate panes with tmux-navigator
-- C-haoe

-- maximize panes with vim-maximizer
-- M-=

-- window management
keymap.set("n", "<M-\\>", "<C-w>v", { desc = "Split window vertically" })    -- split window vertically
keymap.set("n", "<M-->", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
keymap.set("n", "<M-q>", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<M-=>", "<C-w>=", { desc = "Equalize splits" })

-- resize panes
keymap.set("n", "<M-O>", ":resize +5<CR>", { desc = "Increase height" })
keymap.set("n", "<M-A>", ":resize -5<CR>", { desc = "Decrease height" })
keymap.set("n", "<M-E>", ":vertical resize +5<CR>", { desc = "Increase width" })
keymap.set("n", "<M-H>", ":vertical resize -5<CR>", { desc = "Decrease width" })

-- Tab navigation
keymap.set("n", "<M-d>", "<cmd>tabnew<CR>", { desc = "New tab" })                               -- open new tab
keymap.set("n", "<M-q>", "<cmd>tabclose<CR>", { desc = "Close current tab" })                   -- close current tab
keymap.set("n", "<M-w>", "<cmd>tabn<CR>", { desc = "Go to next tab" })                          --  go to next tab
keymap.set("n", "<M-l>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
