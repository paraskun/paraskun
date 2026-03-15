return {
  "stevearc/oil.nvim",

  dependencies = {
    { "nvim-mini/mini.icons" }
  },

  config = function ()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },

      keymaps = {
        ["h"] = { "actions.parent", mode = "n" },
        ["l"] = { "actions.select", mode = "n" },
      },
    })

    vim.keymap.set("n", "<leader>pe", "<CMD>Oil<CR>", {})
    vim.keymap.set("n", "<leader>h", "<C-w>h")
    vim.keymap.set("n", "<leader>j", "<C-w>j")
    vim.keymap.set("n", "<leader>k", "<C-w>k")
    vim.keymap.set("n", "<leader>l", "<C-w>l")
  end
}
