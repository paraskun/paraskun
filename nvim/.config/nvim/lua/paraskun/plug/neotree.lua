return {
  "nvim-neo-tree/neo-tree.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    vim.keymap.set("n", "<leader>h", "<C-w>h")
    vim.keymap.set("n", "<leader>j", "<C-w>j")
    vim.keymap.set("n", "<leader>k", "<C-w>k")
    vim.keymap.set("n", "<leader>l", "<C-w>l")
  end
}
