-- Allows you to maximize split windows
return {
  "szw/vim-maximizer",
  keys = {
    { "<leader>s.", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
  },
}
