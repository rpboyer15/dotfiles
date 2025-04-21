vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", ".-", "<ESC>", { desc = "Exit insert mode with .-" })

-- clear search highlights
keymap.set("n", "<leader>vh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>s/", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
keymap.set("n", "<leader>s-", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Pane navigation
-- keymap.set("n", "<leader>th", "<C-w>h", { noremap = true, silent = true, desc = "Navigate left" })
-- keymap.set("n", "<leader>ta", "<C-w>j", { noremap = true, silent = true, desc = "Navigate down" })
-- keymap.set("n", "<leader>to", "<C-w>k", { noremap = true, silent = true, desc = "Navigate up" })
-- keymap.set("n", "<leader>te", "<C-w>l", { noremap = true, silent = true, desc = "Navigate right" })

-- Tab navigation
-- keymap.set("n", "<C-w>d", "<cmd>tabnew<CR>", { desc = "New tab" })             -- open new tab
-- keymap.set("n", "<leader>td", "<cmd>tabnew<CR>", { desc = "New tab" })             -- close current tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tw", "<cmd>tabn<CR>", { desc = "Go to next tab" })        --  go to next tab
-- keymap.set("n", "<leader>tl", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Disable default mappings for tmux navigator
-- vim.g.tmux_navigator_no_mappings = 1
--
-- -- Custom key mappings for tmux navigation
-- local opts = { noremap = true, silent = true }
--
-- keymap.set("n", "<C-h>", ":<C-U>TmuxNavigateLeft<CR>", opts)
-- keymap.set("n", "<C-a>", ":<C-U>TmuxNavigateDown<CR>", opts)
-- keymap.set("n", "<C-o>", ":<C-U>TmuxNavigateUp<CR>", opts)
-- keymap.set("n", "<C-e>", ":<C-U>TmuxNavigateRight<CR>", opts)
-- keymap.set('n', '<Previous-Mapping>', ':<C-U>TmuxNavigatePrevious<CR>', opts)
